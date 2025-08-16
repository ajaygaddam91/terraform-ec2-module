
resource "aws_instance" "module-vm" {
  ami                    = var.ami_id
  instance_type          = var.instance-type
  availability_zone      = var.availability-zone
  vpc_security_group_ids = [aws_security_group.sg-vm.id]
  tags                   = var.tag
}

resource "aws_security_group" "sg-vm" {
  name        = var.sg-name
  description = var.sg-description
  tags        = var.tag

  dynamic "ingress" {
    for_each = var.sg-inbound
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}