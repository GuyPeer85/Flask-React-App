pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'compose', url: 'https://github.com/your-username/Flask-React-App.git'
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    sh "docker-compose down --rmi all"
                }
            }
        }

        stage('Build and Deploy') {
            steps {
                script {
                    sh "docker-compose up -d --build"
                }
            }
        }

        stage('Verify Server Deployment') {
            steps {
                script {
                    sh "curl http://localhost:5000/api/message"
                }
            }
        }

        stage('Verify Client Deployment') {
            steps {
                script {
                    sh 'until $(curl --output /dev/null --silent --head --fail http://localhost:3000); do sleep 5; done'
                }
            }
        }
    }
}
