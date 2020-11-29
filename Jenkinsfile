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
            stage('Linting') {
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
            stage('Upload to dockerhub') {
                steps {
                    echo 'Uploading to Docker...'
                    script {
                        docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                        }
                    }

                }
            }
            stage('Deployment') {
                steps {
                    echo 'Deploying...'
                    sh 'aws eks --region ap-south-1 update-kubeconfig --name capstone'
                    sh 'kubectl apply -f Deployment/Deployment.yml'
                    sh 'kubectl get all'
                }
            }
            stage('Cleaning up') {
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
