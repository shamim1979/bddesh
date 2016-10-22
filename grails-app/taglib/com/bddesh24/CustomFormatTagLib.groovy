package com.bddesh24

import java.text.SimpleDateFormat

class CustomFormatTagLib {
    static defaultEncodeAs = [taglib:'html']
	//static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
	def i18nNumber = { attrs, body ->
		String numStr = attrs.number.toString()
		numStr.trim().split('').each {
			out << g.message(code:it)
		}
	}
	def utcDate = { attrs, body ->		
		SimpleDateFormat utcDateFormat = new SimpleDateFormat("yyyy-M-d H:m:s X")
		TimeZone utc = TimeZone.getTimeZone("UTC")
		utcDateFormat.setTimeZone(utc);
		out << utcDateFormat.format(attrs.date)		
	}
	def seoCovert = { attrs, body ->
		def text 
		if(attrs.title)
			text = attrs.title
		else
			text = "bddesh24 the leading social portal in Bangladesh"
		text = text.toLowerCase()
		text = text.replaceAll("[^\\u0100-\\uFFFF-_a-zA-Z0-9]", " ");
		text = text.trim()
		text = text.replaceAll('\\s+', '-')
		text = text.replaceAll('-+', '-')
		out << body() << text
	}
	
	def hashConvert = { attrs, body ->
		def type = attrs.type
		def hashwords = attrs.hashwords
		if(type && hashwords){
			if(type.equals("article")){
				out << render(template: "/home/genArticleHashword", model: [hashwords: hashwords.split(" ")])
			}
			else if(type.equals("newsSource")){
				out << render(template: "/home/genNewsSourceHashword", model: [hashwords: hashwords.split(" ")])
			}
			else if(type.equals("poll")){
				out << render(template: "/home/genPollHashword", model: [hashwords: hashwords.split(" ")])
			}
			else if(type.equals("topTen")){
				out << render(template: "/home/genTopTenHashword", model: [hashwords: hashwords.split(" ")])
			}
			else if(type.equals("question")){
				out << render(template: "/home/genQuestionHashword", model: [hashwords: hashwords.split(" ")])
			}			
		}
	}
}
