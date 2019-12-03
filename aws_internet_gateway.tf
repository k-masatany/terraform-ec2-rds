resource "aws_internet_gateway" "main-igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name        = "${lookup(var.settings, "app_name")}-main-vpc-igw-${terraform.workspace}"
    Description = "This resource was created through Terraform"
  }
}
