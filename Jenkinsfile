pipeline {
    agent any
    stages {
        stage('Lint') {
            steps {
                sh 'make lint'
            }
        }
        stage('Build Docker') {
            steps {
                sh 'make build'
            }
        }
        stage('Login to dockerhub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u twi5tyx -p ${dockerhubpwd}'
                }
            }
        }
        stage('Upload Image') {
            steps {
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
