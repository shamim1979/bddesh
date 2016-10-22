package com.bddesh24

import java.util.Date;

class QuoteTopic {

	String topic
	String topicDescription
	String relatedHashwords
	String coverImage
	
	boolean featured = false
	boolean enabled = true
	
	int totalQuote = 1
	
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		topic blank:false, maxSize:150
		coverImage nullable:true, maxSize:150
		relatedHashwords nullable:true, maxSize:800
		topicDescription nullable:true, maxSize:300
		quotes nullable:true
	}
	
	static belongsTo = [quoteTopicOwner:User]
	
	static hasMany = [quotes:Quote]
	
	def beforeInsert() {
		dateCreated = new Date()
		lastUpdated = new Date()
	}
	
	def beforeUpdate() {
		lastUpdated = new Date()
	}
	
	String toString() {
		return topicDescription
	}
	
}
