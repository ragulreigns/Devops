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
            when {
                branch 'dev'
            }
            steps {
                script {
                    docker.withRegistry('', DOCKER_HUB_CREDENTIALS) {
                        
                        docker.image("${DOCKER_HUB_REPO_DEV}:latest").push()
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
