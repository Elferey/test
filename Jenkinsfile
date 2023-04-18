pipeline {
  agent any

  environment {
      DOCKERHUB_CREDENTIALS= credentials('726b595f-27d3-49b0-bff7-4d1331f73129')
  }

  stages {
      stage ('Clone repo with app') {
          steps {
              git 'https://github.com/Elferey/test.git'
          }
      }

      stage('Login to Docker Hub') {
          steps{
      	sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      	echo 'Login Completed'
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
