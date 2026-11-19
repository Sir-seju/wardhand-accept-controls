resource "aws_vpc_security_group_ingress_rule" "acceptance_ssh" {
  security_group_id = "sg-01c0f464c44252fd2"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_ipv4         = "0.0.0.0/0"
}

