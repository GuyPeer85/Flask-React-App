variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS secret access key"
  type        = string
}

variable "create_ecr_repository" {
  description = "Flag to create the ECR repository"
  type        = bool
  default     = true
}