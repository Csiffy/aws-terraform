

# Our default security group to access
# the instances over SSH and HTTP
resource "aws_security_group" "instance-sg" {
  provider = aws.current
  count    = "${var.count_number}"

  name        = "${format("instance-%d", count.index)}"
  description = "Instance security group"
  vpc_id      = "${var.vpc}"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from the VPC
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "this" {
  provider = aws.current
  connection {
    # The default username for the instance
    user = "admin"
  }
  instance_type = "t2.micro"
  ami = "${lookup(var.aws_amis, var.aws_region)}"

  # The name of our SSH keypair
  key_name = "${var.key_name}"
  count = "${var.count_number}"
  subnet_id      = "${element(var.public_subnets, count.index)}"

  #Security group to allow HTTP and SSH access
  security_groups = ["${element(aws_security_group.instance-sg.*.id, count.index)}"]

  iam_instance_profile = "${var.iamrole}"

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh",
      "aws s3 cp s3://common-store-source-code/script.sh /tmp/script_new.sh",
      " chmod +x /tmp/script_new.sh",
      "/tmp/script_new.sh",
      "echo '<html><title>${var.aws_region} - ${element(var.public_subnets, count.index)}</title><body>${var.aws_region} - ${element(var.public_subnets, count.index)}</body></html>' > /usr/share/nginx/html/index.html",
    ]
  }

  tags = merge(local.common_tags, local.module_tags, var.private_subnet_tags, tomap({"Name" = format("ec2-%s-%s-%s-%s-%s", var.aws_short_region, split("-", element(var.azs, count.index))[2], var.environment, var.service, count.index)}))
}

