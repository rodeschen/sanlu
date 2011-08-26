dataSource {

	logSql = true	
	pooled = true
	dbCreate = "update"
	url = "jdbc:mysql://localhost/yourDB"
	driverClassName = "com.mysql.jdbc.Driver"
    username = "root"
	password = ""
	properties {
		maxActive = 50
		maxIdle = 25
		minIdle = 5
		initialSize = 5
		minEvictableIdleTimeMillis = 60000
		timeBetweenEvictionRunsMillis = 60000
		maxWait = 10000
		validationQuery = "/* ping */"
	}

}
hibernate {
	cache.use_second_level_cache=true
	cache.use_query_cache=true
	cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "create" // one of 'create', 'create-drop','update'
			//jndiName = "java:comp/env/jdbc/sanlu"
			url = "jdbc:mysql://localhost/sanlu?useUnicode=true&characterEncoding=UTF-8"
		}
	}
	test {
		dataSource {
			dbCreate = "create-drop"
			url = "jdbc:mysql://localhost/sanlu?useUnicode=true&characterEncoding=UTF-8"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			url = "jdbc:mysql://localhost/sanlu?useUnicode=true&characterEncoding=UTF-8"
		}
	}
}