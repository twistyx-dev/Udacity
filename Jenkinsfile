pipeline {
   agent any

   stages {
      stage('Build') {
        steps {
          withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
          sh '''
          docker build --tag=twi5tyx/capstone .
          '''
          }
        }
      }
      stage('Test') {
        steps {
            echo 'Testing..'
        }
      }
      stage('Deploy') {
        steps {
            echo 'Deploying....'
        }
      }
    }
}
