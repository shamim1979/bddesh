package com.bddesh24

import grails.transaction.Transactional

@Transactional
class NewsService {

    def getLatestNewsArticles(def lastNewsDate = new Date()){
		def newsLatestArticles = NewsArticle.executeQuery("select NAU,NA from NewsArticle as NA inner join NA.articleOwner as NAU where NA.dateCreated<:lastNewsDate and NA.enabled=true order by NA.dateCreated desc",[lastNewsDate:lastNewsDate,max:10])		
		return newsLatestArticles
	}
	
	def getLatestOnlyNewsArticles(def lastNewsDate = new Date()){
		def newsLatestArticles = NewsArticle.executeQuery("select NAU,NA from NewsArticle as NA inner join NA.articleOwner as NAU where NA.postType=1 and NA.dateCreated<:lastNewsDate and NA.enabled=true order by NA.dateCreated desc",[lastNewsDate:lastNewsDate,max:10])
		return newsLatestArticles
	}
	
	def getUserNewsArticles(def profileUser = null, def lastNewsDate = new Date()){
		def newsLatestArticles = NewsArticle.executeQuery("select NAU,NA from NewsArticle as NA inner join NA.articleOwner as NAU where NAU=:profileUser and NA.dateCreated<:lastNewsDate and NA.enabled=true order by NA.dateCreated desc",[profileUser:profileUser,lastNewsDate:lastNewsDate,max:10])
		return newsLatestArticles
	}
	
	def getLatestNews(){
		def newsLatestArticles = LatestNews.executeQuery("from LatestNews as LN order by LN.dateCreated desc")
		return newsLatestArticles
	}
}
