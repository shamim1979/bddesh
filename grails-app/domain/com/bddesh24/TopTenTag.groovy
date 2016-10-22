package com.bddesh24

import java.util.Date;

class TopTenTag {
	String topTenTag
	String tagDescription
	String relatedHashwords
	String coverImage
	
	boolean featured = false
	boolean enabled = true
	
	int totalTopTen = 1
	
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		topTenTag blank:false, maxSize:150
		coverImage nullable:true, maxSize:150
		relatedHashwords nullable:true, maxSize:800
		tagDescription nullable:true, maxSize:300
		topTens nullable:true
	}
	
	static belongsTo = [topTenTagOwner:User]
	
	static hasMany = [topTens:TopTen]
	
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
