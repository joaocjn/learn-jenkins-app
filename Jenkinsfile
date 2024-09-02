pipeline {
    agent any
    // This is a comment
    /* This is a 
    block comment*/
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'node:18-alpine'
                    reuseNode true
                }
            }
            steps {
                sh '''
                    ls -la
                    node --version
                    npm --version
                    npm ci
                    npm run build
                    ls -la
                '''
            }
        }
        stage('Test') {
            agent {
                docker {
                    image 'node:18-alpine'
                    reuseNode true
                }
            }
            steps {
                sh '''
                    echo "Test stage"
                    test -f build/index.html && echo "O arquivo existe" || echo "O arquivo não existe"
                    npm test
                '''
            }
        }
        
    }
    post {
        always {
            junit 'jest-results/junit.xml'
        }
    }
}
