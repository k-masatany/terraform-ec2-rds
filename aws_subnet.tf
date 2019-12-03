# Public Subnets
resource "aws_subnet" "main-vpc-public-a" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${lookup(var.settings, "${terraform.workspace}.cidr_head")}.0.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name        = "${lookup(var.settings, "app_name")}-public-subnet-a-${terraform.workspace}"
    Description = "This resource was created through Terraform"
  }
}

resource "aws_subnet" "main-vpc-public-c" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${lookup(var.settings, "${terraform.workspace}.cidr_head")}.1.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name        = "${lookup(var.settings, "app_name")}-public-subnet-c-${terraform.workspace}"
    Description = "This resource was created through Terraform"
  }
}

resource "aws_subnet" "main-vpc-public-d" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${lookup(var.settings, "${terraform.workspace}.cidr_head")}.2.0/24"
  availability_zone       = "ap-northeast-1d"
  map_public_ip_on_launch = true

  tags = {
    Name        = "${lookup(var.settings, "app_name")}-public-subnet-d-${terraform.workspace}"
    Description = "This resource was created through Terraform"
  }
}

# Private Subnets

resource "aws_subnet" "main-vpc-private-a" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${lookup(var.settings, "${terraform.workspace}.cidr_head")}.10.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = false

  tags = {
    Name        = "${lookup(var.settings, "app_name")}-private-subnet-a-${terraform.workspace}"
    Description = "This resource was created through Terraform"
  }
}

resource "aws_subnet" "main-vpc-private-c" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${lookup(var.settings, "${terraform.workspace}.cidr_head")}.11.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = false

  tags = {
    Name        = "${lookup(var.settings, "app_name")}-private-subnet-c-${terraform.workspace}"
    Description = "This resource was created through Terraform"
  }
}

resource "aws_subnet" "main-vpc-private-d" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${lookup(var.settings, "${terraform.workspace}.cidr_head")}.12.0/24"
  availability_zone       = "ap-northeast-1d"
  map_public_ip_on_launch = false

  tags = {
    Name        = "${lookup(var.settings, "app_name")}-private-subnet-d-${terraform.workspace}"
    Description = "This resource was created through Terraform"
  }
}
