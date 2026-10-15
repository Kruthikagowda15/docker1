
pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "kruthikagowda15/docker1"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Kruthikagowda15/docker1.git'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([string(
                    credentialsId: 'dockerhub-creds1',
                    variable: 'DOCKER_PAT'
                )]) {
                    powershell '''
                        $env:DOCKER_PAT | docker login -u kruthikagowda15 --password-stdin

                        if ($LASTEXITCODE -ne 0) {
                            exit $LASTEXITCODE
                        }
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %DOCKER_IMAGE%:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                bat 'docker push %DOCKER_IMAGE%:latest'
            }
        }
    }

    post {
        success {
            echo 'Docker image built and pushed successfully.'
        }

        failure {
            echo 'Pipeline failed. Check Console Output.'
        }
    }
}
