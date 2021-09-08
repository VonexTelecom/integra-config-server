pipeline {
    agent any 
    tools {
        maven 'Maven 3.8.1'
        jdk 'jdk8'
    }
    stages {
        stage ('Build') {
            steps {    
                sh ' mvn clean install -DskipTests'
            }
        }
        /*stage ('Test') {
            steps {    
                sh ' mvn test'
            }
        }*/        
        stage ('Imagem docker') {
            steps {
                sh 'docker build . -t vonex/api_config-server:${BUILD_NUMBER}'
            }
        }
        stage ('Run docker') {
            steps {
                sh ' docker stop integra-config-server' 
                sh ' docker rm integra-config-server'                
                sh ' docker container run -h integra-config-server -d --name integra-config-server -p 8088:8088 vonex/api_config-server:${BUILD_NUMBER}'
            }
        }        
    }
}


