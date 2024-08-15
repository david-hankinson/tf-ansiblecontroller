terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_launch_configuration" "ansible_controller_asg_launch_configuration" {
  image_id        = "ami-0dcab815e6ee910aa"
  instance_type   = var.instance_type
  security_groups = [aws_security_group.cluster_sg.id]

  # Required when using a launch configuration with an auto scaling group.
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "ansible_controller_asg" {
  launch_configuration = aws_launch_configuration.ansible_controller_asg_launch_configuration.name
  vpc_zone_identifier  = data.aws_subnets.default.ids

  min_size = var.min_size
  max_size = var.max_size

  tag {
    key                 = "default-tag"
    value               = var.cluster_name
    propagate_at_launch = true
  }
}



