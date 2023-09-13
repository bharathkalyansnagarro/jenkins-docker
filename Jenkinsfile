pipeline {
    agent any

    tools {
        maven "maven 3.9.4"
    }

    stages {
        stage('Git Pull & Build JAR') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/bharathkalyansnagarro/jenkins-docker']])

                sh "mvn clean install"

            }
        }
        stage('Build Docker Image') {
            steps {
               script {
                   sh 'docker build -t bharathkalyans/springboot-docker:latest .'
               }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                        sh 'docker login -u bharathkalyans -p ${dockerhubpwd}'
                    }

                    sh 'docker image push bharathkalyans/springboot-docker:latest'
                }

            }
        }

    }
}
