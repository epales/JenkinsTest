import java.text.SimpleDateFormat

def TODAY = (new SimpleDateFormat("yyyyMMddHHmmss")).format(new Date())

pipeline {
    agent any
    environment {
        strDockerTag = "${TODAY}_${BUILD_ID}"
        strDockerImage ="selenedis/cicd_jenkins_test:${strDockerTag}"
    }
    stages {
        stage('Docker Image Build') {
            agent any
            steps {
                git branch: 'master', url:'https://github.com/epales/JenkinsTest.git'
                sh './mvnw clean package'
                script {
                    //oDockImage = docker.build(strDockerImage)
                    oDockImage = docker.build(strDockerImage, "--build-arg VERSION=${strDockerTag} -f Dockerfile .")
                }
            }
        }
        stage('Docker Image Push') {
            agent any
            steps {
                script {
                    docker.withRegistry('', 'Docker-token') {
                        oDockImage.push()
                    }
                }
            }
        }
        stage('Deploy Container') {
            agent any
            steps {
                sh """
                docker stop spring-app || true
                docker rm spring-app || true

                docker run -d \
                -p 8081:8080 \
                --name spring-app \
                selenedis/cicd_jenkins_test:${strDockerTag}
                """
            }
        }
    }
}

