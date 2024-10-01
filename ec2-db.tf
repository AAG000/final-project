resource "aws_launch_configuration" "db_lc" {
  name          = "db-lc"
  image_id      = var.ami_id
  instance_type = var.instance_type
  security_groups = [aws_security_group.db_sg.id]
  key_name      = "your-key-name"

  user_data = <<-EOF
                #!/bin/bash
                sudo apt update
                sudo apt install -y mysql-server
                sudo systemctl start mysql
                sudo systemctl enable mysql
              EOF
}

resource "aws_autoscaling_group" "db_asg" {
  launch_configuration = aws_launch_configuration.db_lc.id
  min_size             = 2
  max_size             = 2
  desired_capacity     = 2
  vpc_zone_identifier  = [aws_subnet.private_3.id, aws_subnet.private_4.id]
}
