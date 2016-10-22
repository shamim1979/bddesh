package com.bddesh24

import java.util.Date;

class TopTenOpinion {
	String opinion
	
	boolean enabled = true
	
	int totalLike = 0 
	
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		opinion blank:false, maxSize:500
	}
		
	static belongsTo = [opinionOwner:User,topTenItem:TopTenItem]
	
	def beforeInsert() {
		dateCreated = new Date()
		lastUpdated = new Date()
	}
	
	def beforeUpdate() {
		lastUpdated = new Date()
	}
	
	String toString() {
		return opinion
	}
    
}
