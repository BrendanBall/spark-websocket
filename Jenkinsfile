node {
    def imageTag = "uctdemo/spark-websocket:${env.BRANCH_NAME}.${env.BUILD_NUMBER}"

    checkout scm

    stage ('compile') {
        sh("./gradlew build")
    }

    stage ('build docker image') {
        sh("docker build -t ${imageTag} .")
    }

    if (env.BRANCH_NAME == 'master') {
        stage ('deploy') {
            sh("sed -i.bak 's#uctdemo/spark-websocket:master.1#${imageTag}#' ./k8s/production/*.yaml")
            sh("kubectl apply -f k8s/production/")
            sh("kubectl apply -f k8s/services/")
        }
    }
}