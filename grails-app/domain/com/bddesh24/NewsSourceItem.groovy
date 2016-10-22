package com.bddesh24

class NewsSourceItem {

	String title
	String shortDescription
	String newsLinks
	String newsSourceTag	
	
	boolean enabled = true
	
	int totalVote = 0
	int totalComment = 0
	
	static constraints = {
		title blank:false, maxSize:300
		shortDescription nullable:true, maxSize:500
		newsSourceTag nullable:true, maxSize:500		
		newsLinks blank:false, maxSize:14000
		newsSourceItemComment nullable:true
	}
		
	static belongsTo = [newsSource:NewsSource]
	
	static hasMany = [newsSourceItemComment:NewsSourceItemComment]
		
	String toString() {
		return title
	}
}
