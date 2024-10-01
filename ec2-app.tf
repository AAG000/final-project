resource "aws_launch_configuration" "app_lc" {
  name          = "app-lc"
  image_id      = var.ami_id
  instance_type = var.instance_type
  security_groups = [aws_security_group.app_sg.id]
  key_name      = "your-key-name"

  user_data = <<-EOF
                #!/bin/bash
                sudo apt update
                sudo apt install -y <your-application-dependencies>
                # Start your application here
              EOF
}

resource "aws_autoscaling_group" "app_asg" {
  launch_configuration = aws_launch_configuration.app_lc.id
  min_size             = 2
  max_size             = 2
  desired_capacity     = 2
  vpc_zone_identifier  = [aws_subnet.private_1.id, aws_subnet.private_2.id]
}
