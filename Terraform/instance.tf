resource "aws_instance" "name" {
  ami = var.ami_id
  instance_type = var.instance_type
  user_data = file("./deploy.sh")
  vpc_security_group_ids = [ aws_security_group.docker_3000.id ]
  subnet_id = local.public_subnet_id
  
}
