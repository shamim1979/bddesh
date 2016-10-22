dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
}
hibernate {	
	cache.use_second_level_cache = true
	cache.use_query_cache = false
	cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
	singleSession = true // configure OSIV singleSession mode
	flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}
// environment specific settings
environments {
	development {
		dataSource {
			//logSql = true
			dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:mysql://localhost/bddeshnews?shutdown=true&useUnicode=yes&characterEncoding=UTF-8"
			username = "root"
			password = "root"
		}
	}
	
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:mysql://localhost/bddeshtest?shutdown=true&useUnicode=yes&characterEncoding=UTF-8"
			username = "root"
			password = "root"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			url = "jdbc:mysql://localhost/bddesh?shutdown=true&useUnicode=yes&characterEncoding=UTF-8"
			username = "root"
			password = "root"  //local server
			properties {				
				maxActive = -1
				minEvictableIdleTimeMillis = 1800000
				timeBetweenEvictionRunsMillis = 1800000
				numTestsPerEvictionRun = 3
				testOnBorrow = true
				testWhileIdle = true
				testOnReturn = true
				validationQuery = "SELECT 1"
			}
		}
	}
}