resource "aws_instance" "dannie-server" {
  ami                             = "ami-0443d29a4bc22b3a5"
  key_name                        = "microlondon"
  instance_type                   = "t2.micro"
  subnet_id      = aws_subnet.dannie-public-subnet-1.id
  vpc_security_group_ids          = [aws_security_group.dannie-vpc-sg.id]
  associate_public_ip_address     = true

//User Data for EC2 Instance
 user_data = file("script.sh")



  tags = {
    Name = "dannie-server"
  }

}
