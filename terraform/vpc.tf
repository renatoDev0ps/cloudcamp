resource "aws_vpc" "vpc" {
  cidr_block = "${var.cidr_vpc}"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "VPC-CLOUDURBANS"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name = "GTW-CLOUDURBANS"
  }
}

resource "aws_subnet" "subnet_public-1a" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.cidr_subnet_1a}"
  map_public_ip_on_launch = "true"
  availability_zone = "${var.availability_zone_1a}"
  tags = {
    Name = "SUBNET | ZONE-1A | 192.168.1.0/24"
  }
}

resource "aws_subnet" "subnet_public-1b" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.cidr_subnet_1b}"
  map_public_ip_on_launch = "true"
  availability_zone = "${var.availability_zone_1b}"
  tags = {
    Name = "SUBNET | ZONE-1B | 192.168.2.0/24"
  }
}

resource "aws_route_table" "rtb_public" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "RT-CLOUDURBANS"
  }
}

resource "aws_route_table_association" "rta_subnet_public_1a" {
  route_table_id = "${aws_route_table.rtb_public.id}"
  subnet_id      = "${aws_subnet.subnet_public-1a.id}"
}

resource "aws_route_table_association" "rta_subnet_public_1b" {
  route_table_id = "${aws_route_table.rtb_public.id}"
  subnet_id      = "${aws_subnet.subnet_public-1b.id}"
}