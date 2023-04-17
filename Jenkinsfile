pipeline {
    agent any

  stages {
      stage ('Clone repo with app') {
          steps {
              git 'https://github.com/Elferey/test.git'
          }
      }
      stage ('Build manifest') {
          steps {
              sh 'docker build -t '
          }
      }
  }
}