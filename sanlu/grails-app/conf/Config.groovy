import org.apache.log4j.ConsoleAppender
import org.apache.log4j.DailyRollingFileAppender
import org.apache.log4j.PatternLayout

// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if(System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [ html: [
		'text/html',
		'application/xhtml+xml'
	],
	xml: [
		'text/xml',
		'application/xml'
	],
	text: 'text/plain',
	js: 'text/javascript',
	rss: 'application/rss+xml',
	atom: 'application/atom+xml',
	css: 'text/css',
	csv: 'text/csv',
	all: '*/*',
	json: [
		'application/json',
		'text/json'
	],
	form: 'application/x-www-form-urlencoded',
	multipartForm: 'multipart/form-data'
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// whether to install the java.util.logging bridge for sl4j. Disable for AppEngine!
grails.logging.jul.usebridge = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []

//log4j
def log4jConsoleLogLevel = Priority.INFO
def log4jAppFileLogLevel = Priority.INFO

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// set per-environment serverURL stem for creating absolute links
environments {
	production { grails.serverURL = "http://www.changeme.com" }
	development {
		grails.serverURL = "http://localhost:8080/${appName}"
		log4jConsoleLogLevel = Priority.DEBUG
		log4jAppFileLogLevel = Priority.DEBUG
	}
	test { grails.serverURL = "http://localhost:8080/${appName}" }
}

// log4j configuration
log4j = {
	println "Log4j consoleLevel: ${log4jConsoleLogLevel} appFile Level: ${log4jAppFileLogLevel}"

	def logLayoutPattern = new PatternLayout("%d [%t] %-5p %c %x - %m%n")

	error 'org.codehaus.groovy.grails.commons', // core / classloading
			'org.codehaus.groovy.grails.plugins', // plugins
			'org.codehaus.groovy.grails.orm.hibernate', // hibernate itg
			'org.springframework',
			'org.hibernate',
			'net.sf.ehcache.hibernate',
			'grails',
			'groovyx.net.http'

	info 'org.codehaus.groovy.grails.web.servlet',  //  controllers
			'org.codehaus.groovy.grails.web.pages', //  GSP
			'org.codehaus.groovy.grails.web.sitemesh', //  layouts
			'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
			'org.codehaus.groovy.grails.web.mapping' // URL mapping

	debug 'com.mycompany'

	appenders {
		appender new ConsoleAppender(name: "console",
				threshold: log4jConsoleLogLevel,
				layout: logLayoutPattern
				)
		appender new DailyRollingFileAppender(name: "appFile",
				threshold: log4jAppFileLogLevel,
				file: "sanlu.log",
				datePattern: "'.'yyyy-MM-dd",
				layout: logLayoutPattern
				)
	}

	root {
		error 'stdout', 'appFile'
		additivity = true
	}
}
