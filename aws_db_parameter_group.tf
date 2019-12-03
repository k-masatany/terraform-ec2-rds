resource "aws_db_parameter_group" "parameter_group" {
  name   = "${var.settings.app_name}-db-pg-${terraform.workspace}"
  family = "${lookup(var.settings, "${terraform.workspace}.db_parameter_group_family")}"
}

