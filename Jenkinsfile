pipeline {
    agent any
    environment {
        IMAGE_TAG = script("uctdemo/spark-websocket:${env.BRANCH_NAME}.${env.BUILD_NUMBER}")
    }
    stages {
        stage ('compile') {
            steps {
                sh('./gradlew clean build')
            }
        }

        stage ('build docker image') {
            steps {
                sh('docker build -t $IMAGE_TAG .')
            }
        }

        stage ('deploy') {
            steps {
                sh("sed -i.bak 's#uctdemo/spark-websocket:master.1#$IMAGE_TAG#' ./k8s/production/*.yaml")
                sh('kubectl apply -f k8s/production/')
            }
        }
    }
}