package com.bddesh24

import java.util.Date;

class UserProfile {
	String coverImage
	String title
	String phone
	
	boolean isSuperAdmin = false
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		title nullable:true
		phone nullable:true
		coverImage nullable:true
    }
	
	static belongsTo = User
	
	def beforeInsert() {
		dateCreated = new Date()
		lastUpdated = new Date()
	}
	
	def beforeUpdate() {
		lastUpdated = new Date()
	}
}
