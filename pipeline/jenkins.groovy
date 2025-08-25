pipeline {
    agent any

    parameters {
        string(name: 'BRANCH', defaultValue: 'main', description: 'Git branch to build')
        string(name: 'DOCKER_IMAGE', defaultValue: 'my-kbot:latest', description: 'Docker image name')
        choice(name: 'DEPLOY_ENV', choices: ['dev', 'staging', 'prod'], description: 'Deployment environment')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${params.BRANCH}", url: 'https://github.com/Laskavchuk/kbot.git'
            }
        }

        stage('Build') {
            steps {
                sh """
                echo "Building Docker image: ${params.DOCKER_IMAGE}"
                docker build -t ${params.DOCKER_IMAGE} .
                """
            }
        }

        stage('Deploy') {
            steps {
                sh """
                echo "Deploying to environment: ${params.DEPLOY_ENV}"
                # тут може бути helm install / kubectl apply / docker run
                """
            }
        }
    }
}
