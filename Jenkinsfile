pipeline {
    agent any
    stages {
        stage('Lint') {
            steps {
                echo 'Linting...'
                sh 'make lint'
            }
        }
        stage('Build Docker') {
            steps {
                echo 'Building...'
                sh 'make build'
            }
        }
        stage('Login to dockerhub') {
            steps {
                echo 'Logging into DockerHub...'
                withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u twi5tyx -p ${dockerhubpwd}'
                }
            }
        }
        stage('Upload Image') {
            steps {
                echo 'Uploading Image to DockerHub...'
                sh 'make upload'
            }
        }
        stage('Deploy Kubernetes') {
            steps {
                sh 'kubectl apply -f ./kubernetes'
            }
        }
    }
}
