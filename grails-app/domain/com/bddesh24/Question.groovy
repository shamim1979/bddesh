package com.bddesh24

import java.util.Date;

class Question {
	String title
	String shortDescription
	String imageName
	String questionTags
		
	boolean enabled = true
	boolean featured = false
	
	int totalView = 0
	int totalVote = 0
	int totalScore = 0
	int totalAnswer = 0
	Long postId = 0
	
	Answer bestAnswer
		
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		title blank:false, maxSize:500
		shortDescription nullable:true, maxSize:500
		questionTags nullable:true, maxSize:500
		imageName nullable:true, maxSize:150
		answers nullable:true
		bestAnswer nullable:true
	}
	
	static belongsTo = [questionOwner:User]
	
	static hasMany = [answers:Answer]
	
	def beforeInsert() {
		dateCreated = new Date()
		lastUpdated = new Date()
	}
	
	def beforeUpdate() {
		lastUpdated = new Date()
	}
	
	String toString() {
		return title
	}
    
}
