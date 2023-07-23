# Flask-React Application with AWS Deployment

## Description

This project is a web application with a Flask server-side and React client-side. The "aws" branch focuses on deploying the application to AWS using various AWS services such as ECR, ECS, ALB, S3, and CloudFront. It leverages Terraform and GitHub Actions for infrastructure provisioning and deployment automation.

The Flask server logs requests and returns a JSON response on receiving a GET request at the '/api/message' endpoint. The React client fetches and displays this message.

The main objective of this branch is to showcase a complete deployment pipeline, including infrastructure setup and continuous deployment to AWS.

## Technologies

- Backend: Flask
- Frontend: ReactJS
- Infrastructure Provisioning: Terraform
- Deployment Automation: GitHub Actions
- AWS Services: ECR, ECS, ALB, S3, CloudFront

## Installation & Setup

**Prerequisites:**
Ensure you have the following installed on your local development machine:

- Git
- Docker
- AWS CLI
- Terraform
- Node.js and npm (for ReactJS)

# AWS Access Credentials:
You need to set up AWS access credentials to deploy the application to AWS. You can obtain your AWS Access Key ID and Secret Access Key from the AWS Management Console.

1. Create an IAM user with the necessary permissions for deploying the infrastructure and accessing AWS services.
2. Retrieve that user's AWS Access Key ID and Secret Access Key.
3. Configure the AWS CLI on your local machine using the obtained credentials.

`aws configure`

# Branch-Specific Secrets:
This branch requires the following secrets to be set in your GitHub repository:

1. `AWS_ACCESS_KEY_ID`: Your IAM user's AWS Access Key ID.
2. `AWS_SECRET_ACCESS_KEY`: The AWS Secret Access Key for your IAM user.

These secrets are referenced in the GitHub Actions workflows and Terraform configuration files.

# Deployment
The deployment process is divided into three main GitHub Actions workflows:

1. Deploy to AWS: This workflow provisions the required AWS resources using Terraform and creates an ECR repository for storing Docker images. It is triggered when changes are pushed to the "aws" branch or when a pull request is raised.

2. Build and Push Docker Image: This workflow builds the Docker image for the Flask server and pushes it to the ECR repository created in the previous step. It is triggered after the "Deploy to AWS" workflow completes successfully.

3. Apply Infrastructure for S3 and CloudFront: This workflow provisions the S3 bucket and CloudFront distribution for hosting the React client application. It is triggered when the `apply_to_S3_Cloudfront.txt` file is pushed to the "aws" branch.

To deploy the application to AWS, follow these steps:

1. Ensure you have the credentials and secrets mentioned in the prerequisites and secrets sections.
2. Push changes to the "aws" branch or raise a pull request to trigger the deployment workflows.
3. Monitor the GitHub Actions logs for any issues or errors encountered during deployment.
   
## Important Message:

If you need to delete the infrastructure, you must do it manually. However, in the future, we plan to automate this process to make it easier for you.

Please note that some manual changes are required for everything to work correctly. In the near future, these manual steps will be replaced with automated processes for improved convenience and efficiency.


