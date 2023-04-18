pipeline {
  agent any



  stages {
      stage ('Clone repo with app') {
          steps {
              git 'https://github.com/Elferey/test.git'
          }
      }

      stage('Login to Docker Hub') {
          steps{
      	      withCredentials([usernameColonPassword(credentialsId: '726b595f-27d3-49b0-bff7-4d1331f73129', variable: 'DOCKERHUB_CREDENTIALS')]) {
      	      sh 'docker login -u $DOCKERHUB_CREDENTIALS --password-stdin'
      	      echo 'Login Completed'
      	      }
          }
      }

      stage ('Build and push manifest') {
          steps {
              sh 'docker build -t $image_name .'
              sh 'docker tag $image_name elferey/docker_images:$tag'
              sh 'docker push elferey/docker_images:$tag'
          }
      }
  }
}
