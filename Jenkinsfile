pipeline {
  agent any
  stages {
    stage(‘Lint python’) {
      steps {
        sh ‘pylint -q -e *.py’
      }
    }
    stage('Upload to AWS') {
      steps {
        withAWS(region:’us-west-1’,credentials:’jenkins’) {
            s3Upload(pathStyleAccessEnabled:true, payloadSigningEnabled: true, file:’index.html’, bucket:’c3pipelines’)
        }
      }
    }
  }
}
