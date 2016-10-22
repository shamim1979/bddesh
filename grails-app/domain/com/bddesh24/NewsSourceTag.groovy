package com.bddesh24

import java.util.Date;

class NewsSourceTag {

    String newsSourceTag
	String tagDescription
	String relatedHashwords
	String coverImage
	
	boolean featured = false
	boolean enabled = true
	
	int totalNewsSourceItem = 1
	
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		newsSourceTag blank:false, maxSize:150
		tagDescription nullable:true, maxSize:300
		relatedHashwords nullable:true, maxSize:800
		coverImage nullable:true, maxSize:150
		newsSourceItems nullable:true
	}
		
	static hasMany = [newsSourceItems:NewsSourceItem]
	
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
