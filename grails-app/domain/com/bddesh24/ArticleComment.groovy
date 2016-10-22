package com.bddesh24

import java.util.Date;

class ArticleComment {
	String comment
	
	boolean enabled = true
	
	int totalLike = 0
	
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		comment blank:false, maxSize:500
	}
	
	static belongsTo = [newsArticle:NewsArticle,commentOwner:User]
	
	def beforeInsert() {
		dateCreated = new Date()
		lastUpdated = new Date()
	}
	
	def beforeUpdate() {
		lastUpdated = new Date()
	}
    
	String toString() {
		return comment
	}
}
