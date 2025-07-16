

resource "aws_vpc" "pd_vpc" {

cidr_block = "10.0.0.0/16"

enable_dns_support = true

enable_dns_hostnames = true

tags = {Name = "vpc-production"}
  
}

resource "aws_subnet" "subnet1" {

    vpc_id = aws_vpc.pd_vpc.id

    cidr_block = "10.0.1.0/24"

    map_public_ip_on_launch = true

    availability_zone = "us-east-1a"
}


resource "aws_internet_gateway" "in-ig-1" {
    vpc_id = aws_vpc.pd_vpc.id
      
}


resource "aws_route_table" "rt-1" {

    vpc_id = aws_vpc.pd_vpc.id

    route  {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.in-ig-1.id

    }
  
}

 resource "aws_route_table_association" "assoc1" {
  subnet_id = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt-1.id
   
}









 resource "aws_eip" "publics_ip" {
 instance = aws_instance.production_instance.id
    
  }