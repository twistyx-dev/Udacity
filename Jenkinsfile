pipeline {
    environment {
        eksClusterName = 'capstone-cluster'
        eksRegion = 'us-west-1'
        dockerHub = 'twi5tyx'
        dockerImage = 'capstone'
        dockerVersion = '0.3'
    }
    agent any
    stages {
        stage('Lint') {
            steps {
                echo 'Linting...'
                sh '''pylint --disable=R,C,W1203 app.py'''
            }
        }
        stage('Build') {
            steps {
                echo 'Building...'
                script {
                    dockerImage = docker.build('${dockerHub}/${dockerImage}:${dockerVersion}')
                    docker.withRegistry('', 'dockerhub') {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Deploy')  {
            steps {
                echo 'Deploying...'
                withAWS(credentials: 'capstone-credentials', region: eksRegion) {
                    sh 'aws eks --region=${eksRegion} update-kubeconfig --name ${eksClusterName}'
                }
            }
        }
    }
}
