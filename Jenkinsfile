pipeline {
  agent {
      agent { dockerfile true }

   stages {
      stage('Build') {
      steps {
          echo 'Building..'
        }
      }
      stage('Test') {
        steps {
            echo 'Testing..'
            sh 'node --version'
            sh 'svn --version'
        }
      }
      stage('Deploy') {
        steps {
            echo 'Deploying....'
        }
      }
    }
}
