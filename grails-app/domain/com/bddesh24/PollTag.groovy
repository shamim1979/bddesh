package com.bddesh24

import java.util.Date;

class PollTag {

	String pollTag
	String tagDescription
	String relatedHashwords
	String coverImage
	
	boolean featured = false
	boolean enabled = true
	
	int totalPoll = 1
	
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		pollTag blank:false, maxSize:150
		coverImage nullable:true, maxSize:150
		relatedHashwords nullable:true, maxSize:800
		tagDescription nullable:true, maxSize:300
		polls nullable:true
	}
	
	static belongsTo = [pollTagOwner:User]
	
	static hasMany = [polls:Poll]
	
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
