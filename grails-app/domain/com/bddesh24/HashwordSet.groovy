package com.bddesh24

import java.util.Date;

class HashwordSet {

    String newsArticleTags
	String pollTags
	String questionTags
	String topTenTags
	String newsSourceTags
	String usaSourceTags
	String location
	
	static constraints = {
		location blank:false, unique:true, maxSize:50
		newsArticleTags nullable:true, maxSize:2000
		pollTags nullable:true, maxSize:2000
		questionTags nullable:true, maxSize:2000
		topTenTags nullable:true, maxSize:2000
		newsSourceTags nullable:true, maxSize:8000
		usaSourceTags nullable:true, maxSize:1000
    }
	
}
