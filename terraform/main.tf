# EC2 Security Group
resource "aws_security_group" "flask_react_app_sg" {
  name        = "flask-react-app-SG"
  description = "flask-react-app-SG"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    security_groups = [aws_security_group.flask_react_app_sg.id]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self = true
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ECS Cluster
resource "aws_ecs_cluster" "flask_react_app_cluster" {
  name = "flask-react-app-server-side"
}

# Task Definition
resource "aws_ecs_task_definition" "flask_react_app_task_definition" {
  family                   = "flask-react-app-task-family"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = "arn:aws:iam::848523308061:role/ecsTaskExecutionRole"

  container_definitions = jsonencode([
    {
      "name": "flask-react-app-container",
      "image": "848523308061.dkr.ecr.us-east-1.amazonaws.com/flask-react-app-repo-ecr:latest",
      "portMappings": [
        {
          "containerPort": 5000,
          "hostPort": 5000,
          "protocol": "tcp"
        }
      ]
    }
  ])
}

# EC2 Target Group
resource "aws_lb_target_group" "flask_react_app_tg" {
  name        = "flask-react-app-TG"
  port        = 5000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = "vpc-08d9d0b1dc4b47d41"
}

# EC2 Application Load Balancer
resource "aws_lb" "flask_react_app_alb" {
  name             = "flask-react-app-ALB"
  subnets          = ["subnet-012ef49073ec21b34", "subnet-018a531e030fc761b", "subnet-0ed855ff1f7d5fb61", "subnet-09f48fe3de3534711", "subnet-0ebda44417a1904a9", "subnet-0b0fc1ed5fa23a11b"]
  security_groups  = [aws_security_group.flask_react_app_sg.id]
}

# ALB Listener
resource "aws_lb_listener" "flask_react_app_listener" {
  load_balancer_arn = aws_lb.flask_react_app_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.flask_react_app_tg.arn
  }
}
