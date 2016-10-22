package com.bddesh24

class PollItem {

	String title
	String deffence
	String imageName
		
	boolean enabled = true
	boolean isPositive = false
	
	int totalVote = 0
	int totalOpinion = 0
	
	static constraints = {
		title blank:false, maxSize:50
		deffence nullable:true, maxSize:500
		imageName nullable:true, maxSize:150
		pollItemOpinions nullable:true
	}
		
	static belongsTo = [poll:Poll,pollItemOwner:User]
	
	static hasMany = [pollItemOpinions:PollItemOpinion]
	
	String toString() {
		return title
	}
}
