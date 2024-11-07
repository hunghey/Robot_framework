pipeline {
    agent any 

    stages {
        stage('Build') { 
            agent { label 'built-in' }
            steps { 
                echo 'make' 
            }
        }
        stage('Test'){
            steps {
                echo 'make check'
              
            }
        }
        stage('Deploy') {
            agent { label 'win' }
            steps {
                echo 'make publish'
            }
        }
    }
}
