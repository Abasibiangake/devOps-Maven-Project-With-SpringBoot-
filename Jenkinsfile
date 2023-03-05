pipeline {
	agent none

	triggers {
		pollSCM 'H */6 * * *'
	}

	stages {
		stage("test: baseline (jdk8)") {
			steps {
				sh 'echo JENKINS_URL: $JENKINS_URL'
				sh 'echo BUILD_ID: $BUILD_ID'
			    }
		}

	}
}
