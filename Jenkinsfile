pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }
  }
  stages {
    stage('Lint') {
      steps {
        echo 'Linting..'
      }
    }
  }
  stages {
    stage('Build') {
      steps {
        echo 'Building..'
      }
    }
  }
  stage('Test') {
    steps {
      echo 'Testing..'
      }
    }
  }
  stage('Deploy') {
    steps {
      echo 'Deploying....'
      }
    }
  }
}
