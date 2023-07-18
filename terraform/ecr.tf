# ECR Repository
resource "aws_ecr_repository" "flask_react_app_repo_ecr" {
  name = "flask-react-app-repo-ecr"
  image_tag_mutability = "MUTABLE"
}