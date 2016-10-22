package com.bddesh24

import grails.transaction.Transactional

@Transactional
class NewsSourceService {

    def getNewsSources(Long newsSourceId = 0){
		def newsSources = NewsSource.executeQuery("select NS, NSI from NewsSource as NS inner join NS.newsSourceItems as NSI where NS.id>:newsSourceId and NS.enabled=true order by NS.id",[newsSourceId:newsSourceId,max:10])		
		return newsSources
	}
	
	def getNewsSourceItems(def newsSource){
		def newsSources = NewsSource.executeQuery("select NSI from NewsSource as NS inner join NS.newsSourceItems as NSI where NS=:newsSource and NSI.enabled=true order by NSI.id",[newsSource:newsSource])
		return newsSources
	}
	
}
