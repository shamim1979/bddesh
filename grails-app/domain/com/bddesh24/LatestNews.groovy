package com.bddesh24

import java.util.Date;

class LatestNews {
	String title
	String shortDescription
	String imageName
	
	boolean enabled = true
	
	int postType = 1 
	Long postId = 0
		
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		title nullable:true, maxSize:300
		shortDescription nullable:true, maxSize:500		
		imageName nullable:true
	}
	
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
