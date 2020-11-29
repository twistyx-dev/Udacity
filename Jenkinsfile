pipeline {
    agent any
        stages {
            stage('Setup Environment') {
                steps {
                    echo 'Setting Up Environment'
                    sh '''make setup
                          make install
                    '''
                }
            }
            stage('Lint') {
                steps {
                    echo 'Linting...'
                    sh 'make lint'
                }
            }
            stage('Build') {
                steps {
                    echo 'Building...'
                    script {
                        dockerImage = docker.build registry + ":predict"
                    }
                }
            }
            stage('Upload') {
                steps {
                    echo 'Uploading to DockerHub...'
                    script {
                        docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                        }
                    }

                }
            }
            stage('Deploy') {
                steps {
                    echo 'Deploying...'
                    sh 'aws eks --region ap-south-1 update-kubeconfig --name capstone'
                    sh 'kubectl apply -f Deployment/Deployment.yml'
                    sh 'kubectl get all'
                }
            }
            stage('Cleaning Up') {
                steps {
                    echo 'Cleaning up...'
                    sh 'docker system prune'
                }
            }

        }
        environment {
            registry = 'twi5tyx/capstone'
            registryCredential = 'dockerhub'
            dockerImage = ''
        }
}
