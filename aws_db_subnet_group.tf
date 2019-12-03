resource "aws_db_subnet_group" "db_subnet_group" {
  name        = "${var.settings.app_name}-${terraform.workspace}"
  description = "For ${terraform.workspace} of ${var.settings.app_name}"
  subnet_ids = [
    "${aws_subnet.main-vpc-private-a.id}",
    "${aws_subnet.main-vpc-private-c.id}",
    "${aws_subnet.main-vpc-private-d.id}"
  ]
}
