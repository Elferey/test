pipeline {
  agent {
    kubernetes {
      yaml '''
        apiVersion: apps/v1
        kind: Deployment
        metadata:
          name: hello-web
          labels:
            app: hello-web-apps
        spec:
          replicas: 2
          selector:
            matchLabels:
              project: kgb
          template:
            metadata:
              labels:
                project: kgb
            spec:
              containers:
                - name: kgb-web
                  image: elferey/docker_images:first
                  ports:
                    - containerPort: 9092
                  readinessProbe:
                    httpGet:
                      path: /actuator
                      port: 9092
                      scheme: HTTP
                    timeoutSeconds: 5
                    periodSeconds: 10
                    failureThreshold: 6
                  livenessProbe:
                    httpGet:
                      path: /actuator/health
                      port: 9092
                      scheme: HTTP
                    timeoutSeconds: 5
                    periodSeconds: 10
                    failureThreshold: 6
                  startupProbe:
                    httpGet:
                      path: /actuator/metrics
                      port: 9092
                      scheme: HTTP
                    periodSeconds: 5
                    failureThreshold: 36
        '''
      retries 1
    }
  }
  stages {
    stage ('test') {
      steps {
        sh 'ls -l'
      }
    }
  }
}
