package com.bddesh24

import java.util.Date;

class AnswerComment {

	String comment
	
	boolean enabled = true
	
	int totalLike = 0 
	
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		comment blank:false, maxSize:500
	}
		
	static belongsTo = [commentOwner:User,answer:Answer]
	
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
