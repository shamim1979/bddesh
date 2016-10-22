package com.bddesh24

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

class LinkzController {

    def springSecurityService
	def NewsSourceService
	
	@Secured(['permitAll'])
    def index() { 
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def newsSources = NewsSourceService.getNewsSources(0)
		def newsSourcesMap = newsSources.groupBy({it[0]})
		def newsSourceTags
		def newsHashwords
		def topTenTags
		def pollTags
		def questionTags
		def usaTags
		def hashwordSet = HashwordSet.findByLocation("home")
		if(hashwordSet){
			newsSourceTags = hashwordSet.newsSourceTags
			if(newsSourceTags)
				newsSourceTags = newsSourceTags.replaceAll("\\s+", " ").trim().split(" ")
			newsHashwords = hashwordSet.newsArticleTags
			if(newsHashwords)
				newsHashwords = newsHashwords.replaceAll("\\s+", " ").trim().split(" ")
			topTenTags = hashwordSet.topTenTags
			if(topTenTags)
				topTenTags = topTenTags.replaceAll("\\s+", " ").trim().split(" ")
			pollTags = hashwordSet.pollTags
			if(pollTags)
				pollTags = pollTags.replaceAll("\\s+", " ").trim().split(" ")
			questionTags = hashwordSet.questionTags
			if(questionTags)
				questionTags = questionTags.replaceAll("\\s+", " ").trim().split(" ")
			usaTags = hashwordSet.usaSourceTags
			if(usaTags)
				usaTags = usaTags.replaceAll("\\s+", " ").trim().split(" ")
		}
		def metaData = [:]
		metaData.put("keyword", "bddesh24, newspaper, newspapers, all newspapers, top newspapers, bangladesh newspaper, bangladesh newspapers, top bangladesh newspapers, indian newspapers, usa newspapers, world newspapers")
		metaData.put("title", "Top list newspapers and news sites in Bangladesh")
		metaData.put("description", "Top list of national and local newspapers and news sites in Bangladesh and other countries in the world")
		metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultLinkz.jpg")
		metaData.put("url", "http://www.bddesh24.com/linkz")
		[metaData:metaData,usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,user:user,newsSourcesMap:newsSourcesMap,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]		
	}
	
	@Secured(['permitAll'])
	def newsSource() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def newsSource
		try {
			newsSource = NewsSource.get(Integer.parseInt(params.id))
		}
		catch(Exception e) {
		}
		if(newsSource){
			def newsSourceItems = NewsSourceService.getNewsSourceItems(newsSource)
			def comments = NewsSourceComment.executeQuery("select NSCU,NSC from NewsSourceComment as NSC inner join NSC.newsSource as NS inner join NSC.commentOwner as NSCU where NS=:newsSource and NSC.enabled=true order by NSC.dateCreated desc",[newsSource:newsSource,max:40])
			
			def keyWords = "linkz,"
			if(newsSource.title){
				def tmpKeyWords = newsSource.title.split(" ")
				for(word in tmpKeyWords){
					if(word.length() > 3){
						if(keyWords)
							keyWords = keyWords + " " + word + ", "
						else
							keyWords = word + ", "
					}
				}
			}
			
			def newsSourceTags
			def newsHashwords
			def topTenTags
			def pollTags
			def questionTags
			def usaTags
			def hashwordSet = HashwordSet.findByLocation("home")
			if(hashwordSet){
				newsSourceTags = hashwordSet.newsSourceTags
				if(newsSourceTags)
					newsSourceTags = newsSourceTags.replaceAll("\\s+", " ").trim().split(" ")
				newsHashwords = hashwordSet.newsArticleTags
				if(newsHashwords)
					newsHashwords = newsHashwords.replaceAll("\\s+", " ").trim().split(" ")
				topTenTags = hashwordSet.topTenTags
				if(topTenTags)
					topTenTags = topTenTags.replaceAll("\\s+", " ").trim().split(" ")
				pollTags = hashwordSet.pollTags
				if(pollTags)
					pollTags = pollTags.replaceAll("\\s+", " ").trim().split(" ")
				questionTags = hashwordSet.questionTags
				if(questionTags)
					questionTags = questionTags.replaceAll("\\s+", " ").trim().split(" ")
				usaTags = hashwordSet.usaSourceTags
				if(usaTags)
					usaTags = usaTags.replaceAll("\\s+", " ").trim().split(" ")
			}
			def metaData = [:]
			metaData.put("keyword", keyWords+"newspapers, all newspapers")
			if(newsSource.title)
				metaData.put("title", newsSource.title)
			else
				metaData.put("title", "Bddesh24 | the leading social portal in Bangladesh")
			if(newsSource.shortDescription)
				metaData.put("description", newsSource.shortDescription)
			else
				metaData.put("description", "Best list of newspapers and news sites in the world")
			metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultLinkz.jpg")
			metaData.put("url", "http://www.bddesh24.com/linkz/newsSource/"+newsSource.id+"/"+seoCovert(title:newsSource.title))
			[metaData:metaData,usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,keyWords:keyWords,user:user,newsSource:newsSource,newsSourceItems:newsSourceItems,comments:comments,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]
		}
		else{
			redirect(uri:"/")
			return
		}
	}
	
	@Secured(['permitAll'])
	def newsSourceItem() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def newsSourceItem
		try {
			newsSourceItem = NewsSourceItem.get(Integer.parseInt(params.id))
		}
		catch(Exception e) {
		}
		if(newsSourceItem){
			def comments = NewsSourceItem.executeQuery("select NSICU,NSIC from NewsSourceItem as NSI inner join NSI.newsSourceItemComment as NSIC inner join NSIC.commentOwner as NSICU where NSI=:newsSourceItem and NSIC.enabled=true order by NSIC.dateCreated desc",[newsSourceItem:newsSourceItem,max:40])
			def keyWords = "linkz,"
			if(newsSourceItem.title){
				def tmpKeyWords = newsSourceItem.title.split(" ")
				for(word in tmpKeyWords){
					if(word.length() > 3){
						if(keyWords)
							keyWords = keyWords + " " + word + ", "
						else
							keyWords = word + ", "
					}
				}
			}
			
			def newsSourceTags
			def newsHashwords
			def topTenTags
			def pollTags
			def questionTags
			def usaTags
			def hashwordSet = HashwordSet.findByLocation("home")
			if(hashwordSet){
				newsSourceTags = hashwordSet.newsSourceTags
				if(newsSourceTags)
					newsSourceTags = newsSourceTags.replaceAll("\\s+", " ").trim().split(" ")
				newsHashwords = hashwordSet.newsArticleTags
				if(newsHashwords)
					newsHashwords = newsHashwords.replaceAll("\\s+", " ").trim().split(" ")
				topTenTags = hashwordSet.topTenTags
				if(topTenTags)
					topTenTags = topTenTags.replaceAll("\\s+", " ").trim().split(" ")
				pollTags = hashwordSet.pollTags
				if(pollTags)
					pollTags = pollTags.replaceAll("\\s+", " ").trim().split(" ")
				questionTags = hashwordSet.questionTags
				if(questionTags)
					questionTags = questionTags.replaceAll("\\s+", " ").trim().split(" ")
				usaTags = hashwordSet.usaSourceTags
				if(usaTags)
					usaTags = usaTags.replaceAll("\\s+", " ").trim().split(" ")
			}
			def metaData = [:]
			metaData.put("keyword", keyWords+"bddesh24")
			if(newsSourceItem.title)
				metaData.put("title", newsSourceItem.title)
			else
				metaData.put("title", "Bddesh24 | the leading social portal in Bangladesh")
			if(newsSourceItem.shortDescription)
				metaData.put("description", newsSourceItem.shortDescription)
			else
				metaData.put("description", "")
			metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultLinkz.jpg")
			metaData.put("url", "http://www.bddesh24.com/linkz/newsSourceItem/"+newsSourceItem.id+"/"+seoCovert(title:newsSourceItem.title))
			[metaData:metaData,usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,keyWords:keyWords,user:user,newsSourceItem:newsSourceItem,comments:comments,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]
		}
		else{
			redirect(uri:"/")
			return
		}
	}
}
