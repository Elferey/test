pipeline {
    agent any

    stages {

        stage ('git') {
            steps {
                git 'https://github.com/Elferey/test.git'
            }
        }

        stage ('test') {
            steps {
                podTemplate(yaml: readTrusted('deployment.yaml')) {
                node(POD_LABEL) {
                    }
                }
            }
        }
    }

}

