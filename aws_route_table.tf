resource "aws_route_table" "main-vpc-public-rtb" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name        = "${lookup(var.settings, "app_name")}-main-vpc-public-rtb-${terraform.workspace}"
    Description = "This resource was created through Terraform"
  }
}

resource "aws_route_table" "main-vpc-private-rtb" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name        = "${lookup(var.settings, "app_name")}-main-vpc-private-rtb-${terraform.workspace}"
    Description = "This resource was created through Terraform"
  }
}
