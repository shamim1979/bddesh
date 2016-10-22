package com.bddesh24

class NewsSource {

    String title
	String shortDescription
	String newsSourceTag
	String imageName
	
	boolean enabled = true
	
	int totalVote = 0 
	int totalComment = 0
	
	static constraints = {
		title blank:false, maxSize:300
		newsSourceTag nullable:true, maxSize:500
		shortDescription nullable:true, maxSize:500
		imageName nullable:true, maxSize:150
		newsSourceComments nullable:true
	}
		
	static hasMany = [newsSourceComments:NewsSourceComment,newsSourceItems:NewsSourceItem]
	
	String toString() {
		return title
	}
}
