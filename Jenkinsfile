pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
        IMAGE_NAME = "nvh140404/mmtnc_pj3"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'master', url: 'git@github.com:22120139/mmtnc_pj3.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:latest")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_CREDENTIALS) {
                        docker.image("${IMAGE_NAME}:latest").push()
                    }
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    docker.image("${IMAGE_NAME}:latest").remove()
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed!'
        }
    }
}
