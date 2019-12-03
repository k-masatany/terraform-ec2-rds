# Public Route
resource "aws_route_table_association" "main-vpc-public-a" {
  route_table_id = "${aws_route_table.main-vpc-public-rtb.id}"
  subnet_id      = "${aws_subnet.main-vpc-public-a.id}"
}

resource "aws_route_table_association" "main-vpc-public-c" {
  route_table_id = "${aws_route_table.main-vpc-public-rtb.id}"
  subnet_id      = "${aws_subnet.main-vpc-public-c.id}"
}

resource "aws_route_table_association" "main-vpc-public-d" {
  route_table_id = "${aws_route_table.main-vpc-public-rtb.id}"
  subnet_id      = "${aws_subnet.main-vpc-public-d.id}"
}

# Private Route
resource "aws_route_table_association" "main-vpc-private-a" {
  route_table_id = "${aws_route_table.main-vpc-private-rtb.id}"
  subnet_id      = "${aws_subnet.main-vpc-private-a.id}"
}

resource "aws_route_table_association" "main-vpc-private-c" {
  route_table_id = "${aws_route_table.main-vpc-private-rtb.id}"
  subnet_id      = "${aws_subnet.main-vpc-private-c.id}"
}

resource "aws_route_table_association" "main-vpc-private-d" {
  route_table_id = "${aws_route_table.main-vpc-private-rtb.id}"
  subnet_id      = "${aws_subnet.main-vpc-private-d.id}"
}
