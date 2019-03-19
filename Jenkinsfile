node {

	def mvnHome
	
	//git fetch
	stage('Preparation') {
		git 'https://github.com/srinivasbv22/Guns-Project.git'

		mvnHome = tool 'Maven'
	}
	
	
	//maven build
	stage('Build') {
		sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean package"
	}
	
	
	//Deployment on tomcat
	stage ('Final deploy'){
		sh 'cp  /var/lib/jenkins/workspace/project1/target/*.war /opt/tomcat/apache-tomcat-8.5.38/webapps/'
	}
	
	
}
	
	
