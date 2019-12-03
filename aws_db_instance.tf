resource "aws_db_instance" "db-instance" {
  identifier           = "${var.settings.app_name}-${terraform.workspace}"
  allocated_storage    = "${lookup(var.settings, "${terraform.workspace}.db_allocated_storage")}"
  storage_type         = "gp2"
  engine               = "${lookup(var.settings, "${terraform.workspace}.db_engine")}"
  engine_version       = "${lookup(var.settings, "${terraform.workspace}.db_engine_version")}"
  instance_class       = "${lookup(var.settings, "${terraform.workspace}.db_instance_class")}"
  name                 = "${replace(var.settings.app_name, "-", "_")}_${terraform.workspace}"
  username             = "${lookup(var.settings, "${terraform.workspace}.db_username")}"
  password             = "${lookup(var.settings, "${terraform.workspace}.db_password")}"
  port                 = "${lookup(var.settings, "${terraform.workspace}.db_port")}"
  publicly_accessible  = false
  security_group_names = []
  vpc_security_group_ids = [
    "${aws_security_group.main-vpc-rds.id}"
  ]
  db_subnet_group_name       = "${aws_db_subnet_group.db_subnet_group.name}"
  parameter_group_name       = "${aws_db_parameter_group.parameter_group.name}"
  multi_az                   = "${lookup(var.settings, "${terraform.workspace}.db_multi_az")}"
  backup_retention_period    = "${lookup(var.settings, "${terraform.workspace}.db_backup_retention_period")}"
  backup_window              = "${lookup(var.settings, "${terraform.workspace}.db_backup_window")}"
  maintenance_window         = "${lookup(var.settings, "${terraform.workspace}.db_maintenance_window")}"
  auto_minor_version_upgrade = false
  copy_tags_to_snapshot      = true
  skip_final_snapshot        = true

  tags = {
    ENV = "${terraform.workspace}"
  }

  lifecycle {
    ignore_changes = [
      "password",
    ]
  }
}
