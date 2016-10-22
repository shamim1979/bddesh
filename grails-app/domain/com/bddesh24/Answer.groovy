package com.bddesh24

import java.util.Date;

class Answer {
	String detailsDescription
	String imageName
		
	boolean enabled = true
	boolean isBest = false
	
	int totalView = 0
	int totalVote = 0
	int totalScore = 0
	int totalComment = 0
		
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		detailsDescription blank:false, maxSize:2000
		imageName nullable:true, maxSize:150
		answerComments nullable:true
	}
	
	static belongsTo = [answerOwner:User,question:Question]
	
	static hasMany = [answerComments:AnswerComment]
	
	def beforeInsert() {
		dateCreated = new Date()
		lastUpdated = new Date()
	}
	
	def beforeUpdate() {
		lastUpdated = new Date()
	}
	
	String toString() {
		return detailsDescription
	}
    
}
