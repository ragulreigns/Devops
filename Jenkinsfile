pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO_DEV = 'ragul11/dev'
        DOCKER_HUB_REPO_PROD = 'ragul11/prod'
        DOCKER_HUB_CREDENTIALS = 'dockerhub-credentials'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    
                    docker.build("${DOCKER_HUB_REPO_DEV}:latest")
                }
            }
        }
        stage('Push to Docker Hub - Dev') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        docker.image('ragul11/dev:latest').push()
                    }
                }
            }
        }
        stage('Push to Docker Hub - Prod') {
            when {
                branch 'master'
            }
            steps {
                script {
                    docker.withRegistry('', DOCKER_HUB_CREDENTIALS) {
                        
                        docker.image("${DOCKER_HUB_REPO_PROD}:latest").push()
                    }
                }
            }
        }
    }
}
