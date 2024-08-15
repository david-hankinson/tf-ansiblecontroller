resource "aws_security_group" "cluster_sg" {
  name = "${var.cluster_name}-instance"
}

## Allow outbound traffic to SSH and Windows RDP

resource "aws_security_group_rule" "allow_ssh_outbound" {
  security_group_id = aws_security_group.cluster_sg.id
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_rdp_outbound" {
  security_group_id = aws_security_group.cluster_sg.id
  type              = "egress"
  from_port         = 3389
  to_port           = 3389
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}