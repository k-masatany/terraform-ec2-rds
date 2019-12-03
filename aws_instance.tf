data "template_file" "userdata" {
  template = "${file("userdata-${terraform.workspace}.sh")}"
  vars     = {}
}

resource "random_shuffle" "az" {
  input = [
    "${aws_subnet.main-vpc-public-a.id}",
    "${aws_subnet.main-vpc-public-c.id}",
    "${aws_subnet.main-vpc-public-d.id}"
  ]
  result_count = 1
}

resource "aws_instance" "main" {
  ami           = "${lookup(var.settings, "${terraform.workspace}.ec2_instance_ami")}"
  instance_type = "${lookup(var.settings, "${terraform.workspace}.ec2_instance_type")}"
  key_name      = "${aws_key_pair.main-instance-key.id}"
  subnet_id     = "${random_shuffle.az.result[0]}"
  vpc_security_group_ids = [
    "${aws_security_group.main-vpc-web.id}",
    "${aws_security_group.main-vpc-ssh.id}"
  ]
  root_block_device {
    volume_size = "${lookup(var.settings, "${terraform.workspace}.ec2_volume_size")}"
  }

  tags = {
    Name        = "${lookup(var.settings, "app_name")}-${terraform.workspace}"
    Description = "This resource was created through Terraform"
  }

  lifecycle {
    ignore_changes = [
      "availability_zone"
    ]
  }
}
