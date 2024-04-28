pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'app-back'
        DOCKER_IMAGE_VERSION = '1.0.0'
        DOCKER_HUB_USERNAME = 'brahim2023'
    }

    stages {
        stage('Run Tests') {
            steps {
                script {
                    // Running Maven tests using a Docker image
                    sh 'docker run --rm -v $PWD:/app -w /app maven:3.6-openjdk-8 mvn test'
                }
            }
        }

 //       stage('Push Docker Image to Docker Hub') {
 //           steps {
 //               script {
 //                   // Log in and push to Docker Hub using hardcoded credentials
 //                   sh "docker login -u brahimbenyouns@gmail.com -p Lifeisgoodbrahim@@"
 //                   sh "docker tag ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION} ${DOCKER_HUB_USERNAME}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}"
//                  sh "docker push ${DOCKER_HUB_USERNAME}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}"
 //               }
  //          }
   //     }

        stage('Control Docker Compose Services') {
            steps {
                script {
                    // Managing Docker Compose services
                    sh 'docker-compose down'
                    sh 'docker-compose up -d'
                }
            }
        }
    }
}
