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
            steps {
                echo 'make publish'
            }
        }
    }
}
