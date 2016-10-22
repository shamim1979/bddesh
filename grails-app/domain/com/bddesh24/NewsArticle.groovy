package com.bddesh24

import java.util.Date;

class NewsArticle {
	
	String title
	String shortDescription
	String detailsDescription
	String imageName
	String hashWords
	String newsLink
	
	boolean enabled = true
	boolean featured = false
	boolean hasDetails = false
	
	int totalView = 0 
	int totalLike = 0 
	int totalComment = 0 
	int postType = 1 //1=article 2=topten 3=poll 4=question
	Long postId = 0
		
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		title nullable:true, maxSize:300
		shortDescription nullable:true, maxSize:500
		detailsDescription blank:false, maxSize:4000
		imageName nullable:true	
		hashWords nullable:true, maxSize:500
		articleComments nullable:true
		newsLink nullable:true, maxSize:300
    }
		
	static belongsTo = [articleOwner:User]
	
	static hasMany = [articleComments:ArticleComment]
	
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
