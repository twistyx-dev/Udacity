pipeline {
   agent any

   stages {
      stage('Build') {
        steps {
            echo 'Building..'
            make setup
            
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
