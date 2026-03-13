pipeline {
    stages {
        stage('Checkout') {
            agent any
            steps {
                git branch: 'master', url:'https://github.com/epales/JenkinsTest.git'
            }
        }
        stage('Build') {
            agent any
            steps {
                sh './mvnw clean package'
            }
        }  
    }
}

