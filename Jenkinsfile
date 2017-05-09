node {
  def appName = 'spark-websocket'
  def imageTag = "uctdemo/spark-websocket::${env.BRANCH_NAME}.${env.BUILD_NUMBER}"

  checkout scm

  stage 'compile'
  sh("./gradle build")

  stage 'build docker image'
  sh("docker build -t ${imageTag} .")
}