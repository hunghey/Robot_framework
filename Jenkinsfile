pipeline {
    agent any 

    stages {
        stage('Build') { 
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
