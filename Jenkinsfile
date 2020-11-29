pipeline {
    environment {
        eksClusterName = 'capstone-cluster'
        eksRegion = 'us-west-1'
        dockerHub = 'twi5tyx'
        dockerImage = 'capstone'
        dockerVersion = '0.3'
    }
    agent any
    #stages {
        stage('Lint') {
            steps {
                echo 'Linting...'
                sh '''docker run --rm -i hadolint/hadolint:latest-alpine < Dockerfile'''
            }
        }
        stage('Build') {
            steps {
                echo 'Building...'
                script {
                    dockerImage = docker.build('${dockerHub}/${dockerImage}:${dockerVersion}')
                    docker.withRegistry('', 'docker-hub-creds') {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Deploy')  {
            steps {
                echo 'Deploying...'
                withAWS(credentials: 'aws-creds', region: eksRegion) {
                    sh 'aws eks --region=${eksRegion} update-kubeconfig --name ${eksClusterName}'
                }
            }
        }
    }
}
