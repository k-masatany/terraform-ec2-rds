resource "aws_key_pair" "main-instance-key" {
  key_name   = "${lookup(var.settings, "app_name")}-instance-key-${terraform.workspace}"
  public_key = "${file("${lookup(var.settings, "${terraform.workspace}.public_key_path")}")}"
}
