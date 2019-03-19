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
	stage ('Deploy to local tomcat vm'){
		sh 'cp  /var/lib/jenkins/workspace/Guns-Project/target/*.war /opt/tomcat/apache-tomcat-8.5.38/webapps/'
	}
	
	//Build Docker image
	stage ('Docker image with version'){
		sh "docker build -t srinivasbv22/tomcat:${BUILD_NUMBER} ."
	}
	
	//remove old docker containers
	stage ('Tomcat container delete'){
		sh "docker rm -f tomcat"
	}
	
	//Deploy to tomcat container
	stage ('Deploy stage'){
		sh "docker run -d -p 8082:8080 -v /opt/tomcat/apache-tomcat-8.5.38/webapps:/usr/local/tomcat/webapps --name tomcat srinivasbv22/tomcat"
	}
	
}
	
	

