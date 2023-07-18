# ECR Repository
resource "aws_ecr_repository" "flask_react_app_repo_ecr" {
  count                 = var.create_ecr_repository ? 1 : 0
  name                  = "flask-react-app-repo-ecr"
  image_tag_mutability  = "MUTABLE"
}

# Output the ECR repository URL
output "ecr_repository_url" {
  value = aws_ecr_repository.flask_react_app_repo_ecr[0].repository_url
}