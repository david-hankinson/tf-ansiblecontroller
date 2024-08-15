output "asg_name" {
  value       = aws_autoscaling_group.ansible_controller_asg.name
  description = "The name of the Auto Scaling Group"
}

output "asg_security_group_name" {
  value       = aws_security_group.cluster_sg.id
  description = "The name of the Security Group attached to the ASG"
}

output "allow_ssh_outbound_security_group_rule_name" {
  value       = aws_security_group_rule.allow_ssh_outbound.id
  description = "The ID of the Security Group attached to the ASG for SSH outbound"
}

output "allow_rdp_outbound_security_group__rule_name" {
  value       = aws_security_group_rule.allow_rdp_outbound.id
  description = "The ID of the Security Group attached to the ASG for RDP outbound"
}
