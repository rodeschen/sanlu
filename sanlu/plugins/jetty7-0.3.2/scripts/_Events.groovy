// No programmable web.xml path yet, so put it in the right place automatically
eventGenerateWebXmlEnd = {
	packagePluginsForWar("${basedir}/web-app")
	System.setProperty("grails.server.factory", "org.grails.jetty.JettyServerFactory")
}
eventCreateWarStart = { warName,stagingDir ->
        println "Removing Jetty jars"
        Ant.delete {
		fileset(dir:"${stagingDir}/WEB-INF/lib") {
			include(name:"jetty-*.jar")
		}
	}
}
