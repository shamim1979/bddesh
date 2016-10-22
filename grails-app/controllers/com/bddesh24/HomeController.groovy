package com.bddesh24

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import java.text.SimpleDateFormat
import org.springframework.web.servlet.support.RequestContextUtils as RCU

class HomeController {

    def springSecurityService
	def NewsService
	
	@Secured(['permitAll'])
    def index() {		
		def newsArticles 
		def allLatestNews 
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		if(user){
			newsArticles = NewsService.getLatestNewsArticles(new Date())
			allLatestNews = NewsService.getLatestNews()
			allLatestNews = allLatestNews.groupBy({ latestNews -> latestNews.postType })
		}
		else{
			allLatestNews = NewsService.getLatestNews()
			allLatestNews = allLatestNews.groupBy({ latestNews -> latestNews.postType })
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-M-d H:m:s")
		def nowFeedDate = df.format(new Date())
		def metaData = [:]
		metaData.put("keyword", "bddesh24, news, bangladesh, bangladesh news, science, technology, sports, cricket, culture, lifestyle, education, entertainment, health, world, asia, europe, africa, usa, middle east, india, UK, south america, north america")
		metaData.put("title", "Bddesh24 | the leading social portal in Bangladesh")
		metaData.put("description", "Bddesh24 latest news, top ten, poll, question, ask, quote and Bangladesh as well as world newspapers")
		metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultArticle.jpg")
		metaData.put("url", "http://www.bddesh24.com")
		[nowFeedDate:nowFeedDate,metaData:metaData,user:user,allLatestNews:allLatestNews,newsArticles:newsArticles,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl,isHome:true]
	}
}
