pipeline {
    agent any

    stages {
        stage('Сборка Docker Image') {
            steps {
                script {
                   sh 'docker build -t "jar4ik/myapp" .'
                }
            }
        }
        stage('Запуск тестов') {
            steps {
                script {
		sh 'node -v'
                    sh 'npm test'
                }
            }
        }
        stage('Загрузка в Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://registry-1.docker.io/', 'dockerhub-credentials-id') {
                        docker.image('jar4ik/myapp').push('latest')
                    }
                }
            }
        }
    }
}

