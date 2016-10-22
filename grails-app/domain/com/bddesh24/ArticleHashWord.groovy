package com.bddesh24

import java.util.Date;

class ArticleHashWord {
	String hashWord
	String hashWordTitle
	String relatedHashwords
	String coverImage
	
	boolean featured = false
	boolean enabled = true
	
	int totalArticle = 1
	
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		hashWord blank:false, maxSize:150
		hashWordTitle nullable:true, maxSize:150
		coverImage nullable:true, maxSize:150
		relatedHashwords nullable:true, maxSize:800
		newsArticles nullable:true
	}
	
	static belongsTo = [articleHashWordOwner:User]
	static hasMany = [newsArticles: NewsArticle]
	
	def beforeInsert() {
		dateCreated = new Date()
		lastUpdated = new Date()
	}
	
	def beforeUpdate() {
		lastUpdated = new Date()
	}
	
	String toString() {
		return hashWordTitle
	}
}
