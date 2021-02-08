data "aws_ami" "latest" {
  most_recent = true
  owners      = [var.owner]

  filter {
    name   = "name"
    values = [lookup(var.default_ami, var.ami)]
  }
}

resource "aws_instance" "test-ec2deployment" {
  ami                         = data.aws_ami.latest.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  availability_zone           = var.availability_zone
  associate_public_ip_address = var.public_ip

  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.volume_size
    delete_on_termination = false
  }
  tags = {
    Name     = var.env_name
    Schedule = var.schedule
  }
}

resource "aws_eip" "ip" {
  instance = aws_instance.test-ec2deployment.id

  tags = {
    Name = var.env_name
  }
}

resource "aws_eip" "example" {
  vpc = true
}
