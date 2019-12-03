resource "aws_eip_association" "main_eip_assoc" {
  instance_id   = "${aws_instance.main.id}"
  allocation_id = "${aws_eip.main.id}"
}
