# Internet VPC
resource "aws_vpc" "playground" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags {
    Name = "playground"
  }
}

# Subnets
resource "aws_subnet" "playground-public-1" {
  vpc_id                  = "${aws_vpc.playground.id}"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-2a"

  tags {
    Name = "playground-public-1"
  }
}

# resource "aws_subnet" "playground-public-2" {
#   vpc_id                  = "${aws_vpc.playground.id}"
#   cidr_block              = "10.0.2.0/24"
#   map_public_ip_on_launch = "true"
#   availability_zone       = "us-west-2b"

#   tags {
#     Name = "playground-public-2"
#   }
# }

# resource "aws_subnet" "playground-public-3" {
#   vpc_id                  = "${aws_vpc.playground.id}"
#   cidr_block              = "10.0.3.0/24"
#   map_public_ip_on_launch = "true"
#   availability_zone       = "us-west-2c"

#   tags {
#     Name = "playground-public-3"
#   }
# }

resource "aws_subnet" "playground-private-1" {
  vpc_id                  = "${aws_vpc.playground.id}"
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-west-2a"

  tags {
    Name = "playground-private-1"
  }
}

# resource "aws_subnet" "playground-private-2" {
#   vpc_id                  = "${aws_vpc.playground.id}"
#   cidr_block              = "10.0.5.0/24"
#   map_public_ip_on_launch = "false"
#   availability_zone       = "us-west-2b"

#   tags {
#     Name = "playground-private-2"
#   }
# }

# resource "aws_subnet" "playground-private-3" {
#   vpc_id                  = "${aws_vpc.playground.id}"
#   cidr_block              = "10.0.6.0/24"
#   map_public_ip_on_launch = "false"
#   availability_zone       = "us-west-2c"

#   tags {
#     Name = "playground-private-3"
#   }
# }

# Internet GW
resource "aws_internet_gateway" "playground-gw" {
  vpc_id = "${aws_vpc.playground.id}"

  tags {
    Name = "playground"
  }
}

# route tables
resource "aws_route_table" "playground-public" {
  vpc_id = "${aws_vpc.playground.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.playground-gw.id}"
  }

  tags {
    Name = "playground-public-1"
  }
}

# route associations public
resource "aws_route_table_association" "playground-public-1-a" {
  subnet_id      = "${aws_subnet.playground-public-1.id}"
  route_table_id = "${aws_route_table.playground-public.id}"
}

# resource "aws_route_table_association" "playground-public-2-a" {
#   subnet_id      = "${aws_subnet.playground-public-2.id}"
#   route_table_id = "${aws_route_table.playground-public.id}"
# }

# resource "aws_route_table_association" "playground-public-3-a" {
#   subnet_id      = "${aws_subnet.playground-public-3.id}"
#   route_table_id = "${aws_route_table.playground-public.id}"
# }
