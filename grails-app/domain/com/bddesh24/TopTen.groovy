package com.bddesh24

import java.util.Date;

class TopTen {
	String title
	String shortDescription
	String detailsDescription
	String imageName
	String topTenTags
		
	boolean enabled = true
	boolean featured = false
	
	int totalView = 0
	int totalImages = 0
	int totalVote = 0
	int totalScore = 0
	int totalTopTenItem = 0
	
	Long postId = 0
	
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		title blank:false, maxSize:300
		shortDescription nullable:true, maxSize:500
		detailsDescription blank:false, maxSize:1000
		topTenTags nullable:true, maxSize:500
		imageName nullable:true, maxSize:150
		topTenItems nullable:true
	}
	
	static belongsTo = [topTenOwner:User]
	
	static hasMany = [topTenItems:TopTenItem]
	
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
