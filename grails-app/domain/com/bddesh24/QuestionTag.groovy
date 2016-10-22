package com.bddesh24

import java.util.Date;

class QuestionTag {
	String questionTag
	String tagDescription
	String relatedHashwords
	String coverImage
	
	boolean featured = false
	boolean enabled = true
	
	int totalQuestion = 1
	
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		questionTag blank:false, maxSize:150
		coverImage nullable:true, maxSize:150
		relatedHashwords nullable:true, maxSize:800
		tagDescription nullable:true, maxSize:300
		questions nullable:true
	}
	
	static belongsTo = [questionTagOwner:User]
	
	static hasMany = [questions:Question]
	
	def beforeInsert() {
		dateCreated = new Date()
		lastUpdated = new Date()
	}
	
	def beforeUpdate() {
		lastUpdated = new Date()
	}
	
	String toString() {
		return tagDescription
	}
}
