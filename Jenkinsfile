pipeline {
    agent any
    environment {
        MAVEN_HOME = tool name: 'm2.home', type: 'hudson.tasks.Maven$MavenInstallation'

    }

    stages {
        stage('Debug') {
        steps {
            script {
                echo "Current PATH: ${MAVEN_HOME}"
            }
        }
        }

        stage('Build Maven') {
            steps {
                // Checkout the repository
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/kanishkapanchal1199/devops-automation.git']])

                // R'un mvn clean install on Windows
                bat "${MAVEN_HOME}\\mvn clean install"
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    bat 'docker build -t kpanchal11/devops-automation .'
                }
            }
        }
            stage('Push Image to Hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                        // Log in to Docker Hub
                        bat 'docker login -u kpanchal11 -p %dockerhubpwd%'
                    }

                    // Push the Docker image
                    bat 'docker push kpanchal11/devops-automation'
                }
            }
        }
    }
}
