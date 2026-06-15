pipeline {

    agent any

    stages {

        stage('Deploy') {

            steps {

                sh '''
                chmod +x scripts/deploy.sh
                ./scripts/deploy.sh
                '''

            }

        }

    }

}
