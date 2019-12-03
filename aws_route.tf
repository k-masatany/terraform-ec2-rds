resource "aws_route" "main-vpc-public-route" {
  route_table_id         = "${aws_route_table.main-vpc-public-rtb.id}"
  gateway_id             = "${aws_internet_gateway.main-igw.id}"
  destination_cidr_block = "0.0.0.0/0"
}
