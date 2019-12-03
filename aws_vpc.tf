resource "aws_vpc" "main" {
  cidr_block           = "${lookup(var.settings, "${terraform.workspace}.cidr_head")}.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${lookup(var.settings, "app_name")}-vpc-${terraform.workspace}"
    Description = "This resource was created through Terraform"
  }
}
