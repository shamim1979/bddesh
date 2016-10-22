package com.bddesh24

import java.util.Date;

class QuoteAuthor {

	String authorName
	String displayName
	String profileImage
	String coverImage
	String description
	
	Date dateCreated
	Date dob
	Date dod
	
	int totalQuote = 0
	
	static constraints = {
		authorName blank:false, maxSize:150
		displayName nullable:true, maxSize:150
		description nullable:true, maxSize:1000
		profileImage nullable:true
		coverImage nullable:true
		dob nullable:true
		dod nullable:true
	}
		
	static hasMany = [quotes:Quote]
	
	def beforeInsert() {
		dateCreated = new Date()
	}
	
	String toString() {
		return authorName
	}
}
