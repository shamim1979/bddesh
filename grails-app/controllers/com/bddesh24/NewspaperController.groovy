package com.bddesh24

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU


class NewspaperController {
	def springSecurityService
	def NewsSourceService
		
	@Secured(['permitAll'])
	def index() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
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
		metaData.put("url", "http://www.bddesh24.com/newspapers")
		[metaData:metaData,usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,user:user,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]

	}
	
	@Secured(['permitAll'])
	def source() {		
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
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
		metaData.put("url", "http://www.bddesh24.com/newspapers")
		[metaData:metaData,usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,user:user,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]

	}
	
	@Secured(['permitAll'])
	def worldnews() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
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
		metaData.put("url", "http://www.bddesh24.com/newspapers")
		[metaData:metaData,usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,user:user,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]

	}
	
	@Secured(['permitAll'])
	def continent() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
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
		metaData.put("url", "http://www.bddesh24.com/newspapers")
		[metaData:metaData,usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,user:user,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]

	}
	
	@Secured(['permitAll'])
	def country() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
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
		metaData.put("url", "http://www.bddesh24.com/newspapers")
		[metaData:metaData,usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,user:user,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]

	}
	
	@Secured(['permitAll'])
	def tagWord() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
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
		metaData.put("url", "http://www.bddesh24.com/newspapers")
		[metaData:metaData,usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,user:user,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]

	}
	
	@Secured(['permitAll'])
	def language() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
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
		metaData.put("url", "http://www.bddesh24.com/newspapers")
		[metaData:metaData,usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,user:user,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]

	}
}
