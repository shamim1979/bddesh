package com.bddesh24

import java.util.Date;

class Poll {

    String question
	String shortDescription
	String imageName
	String pollTags
		
	boolean enabled = true
	boolean featured = false
	
	int totalView = 0
	int totalLike = 0
	int totalScore = 0
	Long postId = 0
	
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		question blank:false, maxSize:200
		shortDescription nullable:true, maxSize:500
		pollTags nullable:true, maxSize:500
		imageName nullable:true, maxSize:150
		pollItems nullable:true
	}
	
	static belongsTo = [pollOwner:User]
	
	static hasMany = [pollItems:PollItem]
	
	def beforeInsert() {
		dateCreated = new Date()
		lastUpdated = new Date()
	}
	
	def beforeUpdate() {
		lastUpdated = new Date()
	}
	
	String toString() {
		return question
	}
}
