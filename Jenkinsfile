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
sh '''
                        # Download and install NVM
                        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

                        # Source NVM script to add `nvm` command to the shell
                        export NVM_DIR="$HOME/.nvm"
                        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 

                        # Install and use Node.js version 14
                        nvm install 14
                        nvm use 14

                        # Verify the Node.js and npm versions
                        node -v
                        npm -v

                        # Install dependencies and run tests
                        npm install
                        npm test
                    '''                }
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

