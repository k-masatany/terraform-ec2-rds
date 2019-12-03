# Web
resource "aws_security_group" "main-vpc-web" {
  name        = "${lookup(var.settings, "app_name")}-sg-web-${terraform.workspace}"
  description = "For ${terraform.workspace} of main-vpc-web"
  vpc_id      = "${aws_vpc.main.id}"

  tags = {
    Name = "${lookup(var.settings, "app_name")}-sg-web-${terraform.workspace}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "main-vpc-web-1" {
  security_group_id = "${aws_security_group.main-vpc-web.id}"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"

  cidr_blocks = "${split(",", lookup(var.settings, "${terraform.workspace}.web_allow_cidr"))}"
}

resource "aws_security_group_rule" "main-vpc-web-2" {
  security_group_id = "${aws_security_group.main-vpc-web.id}"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"

  cidr_blocks = "${split(",", lookup(var.settings, "${terraform.workspace}.web_allow_cidr"))}"
}

resource "aws_security_group_rule" "main-vpc-web-3" {
  security_group_id = "${aws_security_group.main-vpc-web.id}"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

# SSH
resource "aws_security_group" "main-vpc-ssh" {
  name        = "${lookup(var.settings, "app_name")}-sg-ssh-${terraform.workspace}"
  description = "For ${terraform.workspace} of main-vpc-ssh"
  vpc_id      = "${aws_vpc.main.id}"

  tags = {
    Name = "${lookup(var.settings, "app_name")}-sg-ssh-${terraform.workspace}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "main-vpc-ssh-1" {
  security_group_id = "${aws_security_group.main-vpc-ssh.id}"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = "${split(",", lookup(var.settings, "${terraform.workspace}.ssh_allow_cidr"))}"
}

resource "aws_security_group_rule" "main-vpc-ssh-3" {
  security_group_id = "${aws_security_group.main-vpc-ssh.id}"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

# RDS
resource "aws_security_group" "main-vpc-rds" {
  name        = "${lookup(var.settings, "app_name")}-sg-rds-${terraform.workspace}"
  description = "For ${terraform.workspace} of main-vpc-rds"
  vpc_id      = "${aws_vpc.main.id}"

  tags = {
    Name = "${lookup(var.settings, "app_name")}-sg-rds-${terraform.workspace}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "main-vpc-rds-1" {
  security_group_id        = "${aws_security_group.main-vpc-rds.id}"
  type                     = "ingress"
  from_port                = "${lookup(var.settings, "${terraform.workspace}.db_port")}"
  to_port                  = "${lookup(var.settings, "${terraform.workspace}.db_port")}"
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.main-vpc-web.id}"
}

resource "aws_security_group_rule" "main-vpc-rds-2" {
  security_group_id = "${aws_security_group.main-vpc-rds.id}"
  type              = "ingress"
  from_port         = "${lookup(var.settings, "${terraform.workspace}.db_port")}"
  to_port           = "${lookup(var.settings, "${terraform.workspace}.db_port")}"
  protocol          = "tcp"
  cidr_blocks = [
    "${aws_vpc.main.cidr_block}",
  ]
}
resource "aws_security_group_rule" "main-vpc-rds-3" {
  security_group_id = "${aws_security_group.main-vpc-rds.id}"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks = [
    "${aws_vpc.main.cidr_block}",
  ]
}
