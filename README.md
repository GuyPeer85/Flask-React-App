# Flask-React-Kubernetes Application
## Description

This project is a web application with a Flask server-side and React client-side. The application is set up for a Kubernetes environment and is containerized using Docker. Upon pushing changes to the "k8s" branch, a GitHub Action is triggered to automate building Docker images for both the server and client side of the application, push them to DockerHub, and deploy them to a local Kubernetes cluster managed by Minikube.

The Flask server logs requests and returns a JSON response on receiving a GET request at the '/api/message' endpoint. The React client fetches and displays this message.

The main objective of this project is to demonstrate a fully functional CI/CD pipeline for a full-stack web application leveraging Kubernetes for orchestration and GitHub Actions for workflow automation.

## Technologies
- Backend: Flask
- Frontend: ReactJS
- Containerization: Docker
- Orchestration: Kubernetes
- Local Kubernetes Cluster: Minikube
- CI/CD: GitHub Actions

## Installation & Setup
- Git
- Docker
- Minikube
- kubectl
- yq
- Python 3.x (for Flask)
- Node.js and npm (for ReactJS)

Start Minikube:

`minikube start --driver=docker`

`minikube addons enable ingress`

**Configuring Dockerhub credentials:**

If you plan to use this GitHub Action to build and push Docker images to your private Dockerhub registry, you'll need to configure a few secrets in your GitHub repository. 

To do this:

1. Navigate to the main page of your GitHub repository and click on "Settings".
2. From the left-side menu, click on "Secrets".
3. Click on "New repository secret".
4. Add the following two secrets:
    - Name: `DOCKER_USERNAME` and Value: Your DockerHub username.
    - Name: `DOCKER_PASSWORD` and Value: Your DockerHub password.

These secrets are referenced in the GitHub Action workflow as `secrets.DOCKER_USERNAME` and `secrets.DOCKER_PASSWORD`. The workflow will have the necessary permissions to push images to your Dockerhub account by setting these.

Usage
The application serves a single API endpoint (/api/message) which returns a JSON response. The React client fetches and displays this message. To see it in action, push changes to the "k8s" branch of the repository. The GitHub action will handle building and deploying the Docker images, and the results can be seen in the GitHub Actions logs and via curl commands to the server endpoint and client service.

