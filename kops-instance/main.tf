data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  key_name = "bapatlas.site"
  subnet_id = "subnet-0f91105ac5e421ff1"
  vpc_security_group_ids = "sg-0247c6b65a012e5f2"
  tags = {
    Name = "kops-konkas-tech"
  }
}