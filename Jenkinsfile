pipeline {
	agent any

	triggers {
		pollSCM 'H */6 * * *'
	}
	stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Docker Build') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials-id') {
                        def dockerImage = docker.build("Abasibiangake/Abassimageexercise1:${env.BUILD_NUMBER}")
                        dockerImage.push()
                    }
                }
            }
        }
	stage("test: baseline (jdk8)") {
	    steps {
		sh 'echo JENKINS_URL: $JENKINS_URL'
		sh 'echo BUILD_ID: $BUILD_ID'
	    }
	}
    }
}
