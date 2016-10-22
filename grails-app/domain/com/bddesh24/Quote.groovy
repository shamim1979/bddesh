package com.bddesh24

import java.util.Date;

class Quote {
	
	String quote
	String description
	String imageName
	String topicHashword
	String quoteAuthor
	String quoteAuthorName
	
	boolean enabled = true
	boolean featured = false
	
	int totalView = 0 
	int totalLike = 0 
	int totalComment = 0 
	Long postId = 0
		
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		quote blank:false, maxSize:600
		description nullable:true, maxSize:1000
		imageName nullable:true	
		topicHashword nullable:true, maxSize:500
		quoteComments nullable:true
		quoteAuthor nullable:true, maxSize:150
		quoteAuthorName nullable:true, maxSize:150
    }
		
	static belongsTo = [quoteOwner:User]
	
	static hasMany = [quoteComments:QuoteComment]
	
	def beforeInsert() {
		dateCreated = new Date()
		lastUpdated = new Date()
	}
	
	def beforeUpdate() {
		lastUpdated = new Date()
	}
	
	String toString() {
		return quote
	}
}
