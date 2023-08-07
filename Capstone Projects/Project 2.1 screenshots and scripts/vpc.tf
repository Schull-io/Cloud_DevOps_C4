//create VPC
resource "aws_vpc" "dannie-vpc" {
  cidr_block = "10.0.0.0/16"
}


// First public subnet
resource "aws_subnet" "dannie-public-subnet-1" {
  vpc_id                  = aws_vpc.dannie-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-2a" 
  map_public_ip_on_launch = true

  tags = {
    Name = "dannie-public-subnet-1"
  }
}

// Second public subnet
resource "aws_subnet" "dannie-public-subnet-2" {
  vpc_id                  = aws_vpc.dannie-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-west-2b" 
  map_public_ip_on_launch = true

  tags = {
    Name = "dannie-public-subnet-2"
  }
}

// Create Internet Gateway
resource "aws_internet_gateway" "dannie-igw" {
  vpc_id = aws_vpc.dannie-vpc.id

  tags = {
    Name = "dannie-igw"
  }
}

// Create a route table
resource "aws_route_table" "dannie-rt" {
  vpc_id = aws_vpc.dannie-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dannie-igw.id
  }

  tags = {
    Name = "dannie-rt"
  }
}

// Associate both subnets with the route table
resource "aws_route_table_association" "dannie-rt-association-1" {
  subnet_id      = aws_subnet.dannie-public-subnet-1.id
  route_table_id = aws_route_table.dannie-rt.id
}

resource "aws_route_table_association" "dannie-rt-association-2" {
  subnet_id      = aws_subnet.dannie-public-subnet-2.id
  route_table_id = aws_route_table.dannie-rt.id
}

