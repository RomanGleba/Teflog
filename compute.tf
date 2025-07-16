resource "aws_instance" "production_instance" {

ami =   "ami-020cba7c55df1f615"
instance_type = "t3.micro"
vpc_security_group_ids = [aws_security_group.pd_security_group.id]
key_name = aws_key_pair.default_key.key_name
subnet_id = aws_subnet.subnet1.id
}

resource "aws_security_group" "pd_security_group" {
  name = "pd_security_group"
  vpc_id = aws_vpc.pd_vpc.id

  ingress  {
    to_port = 80
    from_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    to_port = 443
    from_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 }

 egress {
    to_port = 0
    from_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
 }

  }
