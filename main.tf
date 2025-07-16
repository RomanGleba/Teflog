
 


resource "aws_key_pair" "default_key" {
    key_name = "instance-key"
    public_key = file("~/.ssh/id_rsa.pub")
  
}


output "prod_public_ip" {

    value = aws_instance.production_instance.public_ip
  
}