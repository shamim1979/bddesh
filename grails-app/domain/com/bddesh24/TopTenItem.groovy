package com.bddesh24

class TopTenItem {

	String title
	String shortDescription
	String imageName
		
	boolean enabled = true
	
	int totalVote = 0 
	int totalOpinion = 0
	
	static constraints = {
		title blank:false, maxSize:200
		shortDescription nullable:true, maxSize:500
		imageName nullable:true, maxSize:150
		topTenOpinions nullable:true
	}
		
	static belongsTo = [topTen:TopTen,topTenItemOwner:User]
	
	static hasMany = [topTenOpinions:TopTenOpinion]
	
	String toString() {
		return title
	}
}
