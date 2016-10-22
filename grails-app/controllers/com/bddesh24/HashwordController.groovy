package com.bddesh24

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['permitAll'])
class HashwordController {
	def springSecurityService
	def NewsService
	def TopTenzService
	def PollzService
	def askService
	def HashwordService
	
    def ask() { 
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def questionTag
		def tagWord = params.id
		if(tagWord){
			questionTag = QuestionTag.findByQuestionTag(tagWord)
		}
		if(questionTag){
			def questions = HashwordService.getHashwordQuestions(questionTag,new Date())			
			def newsSourceTags
			def newsHashwords
			def topTenTags
			def pollTags
			def questionTags
			def usaTags
			def hashwordSet = HashwordSet.findByLocation("home")
			if(hashwordSet){
				newsSourceTags = hashwordSet.newsSourceTags
				if(newsSourceTags)
					newsSourceTags = newsSourceTags.replaceAll("\\s+", " ").trim().split(" ")
				newsHashwords = hashwordSet.newsArticleTags
				if(newsHashwords)
					newsHashwords = newsHashwords.replaceAll("\\s+", " ").trim().split(" ")
				topTenTags = hashwordSet.topTenTags
				if(topTenTags)
					topTenTags = topTenTags.replaceAll("\\s+", " ").trim().split(" ")
				pollTags = hashwordSet.pollTags
				if(pollTags)
					pollTags = pollTags.replaceAll("\\s+", " ").trim().split(" ")
				questionTags = hashwordSet.questionTags
				if(questionTags)
					questionTags = questionTags.replaceAll("\\s+", " ").trim().split(" ")
				usaTags = hashwordSet.usaSourceTags
				if(usaTags)
					usaTags = usaTags.replaceAll("\\s+", " ").trim().split(" ")
			}
			def keyWords = "question, ask,"
			if(questionTag.questionTag){
				def tmpKeyWords = questionTag.questionTag.split(" ")
				for(word in tmpKeyWords){
					if(word.length() > 3){
						if(keyWords)
							keyWords = keyWords + " " + word + ", "
						else
							keyWords = word + ", "
					}
				}
			}
			if(questionTag.tagDescription){
				def tmpKeyWords = questionTag.tagDescription.split(" ")
				for(word in tmpKeyWords){
					if(word.length() > 3){
						if(keyWords)
							keyWords = keyWords + " " + word + ", "
						else
							keyWords = word + ", "
					}
				}
			}
			def metaData = [:]
			metaData.put("keyword", keyWords+"answer, best answer")
			metaData.put("title", "Ask and answers in "+questionTag.questionTag)
			if(questionTag.tagDescription)
				metaData.put("description", questionTag.tagDescription)
			else
				metaData.put("description", "Top questions and best answers in "+questionTag.questionTag)
			if(questionTag.coverImage)
				metaData.put("image", "http://www.bddesh24.com/newsImages/d690/"+questionTag.coverImage)
			else
				metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultQuestion.jpg")
			metaData.put("url", "http://www.bddesh24.com/hashword/ask/"+questionTag.questionTag)
			[metaData:metaData,usaTags:usaTags,tTag:questionTag.questionTag,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,user:user,questionTag:questionTag,questions:questions,keyWords:keyWords,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl,isHome:true]
		}
		else{
			redirect(uri:"/")
			return
		}		
	}
	
	def linkz() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def newsSourceTag
		def tagWord = params.id
		if(tagWord){
			newsSourceTag = NewsSourceTag.findByNewsSourceTag(tagWord)
		}
		if(newsSourceTag){
			def newsSourceItems = HashwordService.getHashwordNewsSources(newsSourceTag,new Date())
			def newsSource
			if(newsSourceItems)
				newsSource = newsSourceItems[0].newsSource
				
			def newsSourceTags
			def newsHashwords
			def topTenTags
			def pollTags
			def questionTags
			def usaTags
			def hashwordSet = HashwordSet.findByLocation("home")
			if(hashwordSet){
				newsSourceTags = hashwordSet.newsSourceTags
				if(newsSourceTags)
					newsSourceTags = newsSourceTags.replaceAll("\\s+", " ").trim().split(" ")
				newsHashwords = hashwordSet.newsArticleTags
				if(newsHashwords)
					newsHashwords = newsHashwords.replaceAll("\\s+", " ").trim().split(" ")
				topTenTags = hashwordSet.topTenTags
				if(topTenTags)
					topTenTags = topTenTags.replaceAll("\\s+", " ").trim().split(" ")
				pollTags = hashwordSet.pollTags
				if(pollTags)
					pollTags = pollTags.replaceAll("\\s+", " ").trim().split(" ")
				questionTags = hashwordSet.questionTags
				if(questionTags)
					questionTags = questionTags.replaceAll("\\s+", " ").trim().split(" ")
				usaTags = hashwordSet.usaSourceTags
				if(usaTags)
					usaTags = usaTags.replaceAll("\\s+", " ").trim().split(" ")
			}
			def keyWords = "newspapers,"
			if(newsSourceTag.newsSourceTag){
				def tmpKeyWords = newsSourceTag.newsSourceTag.split(" ")
				for(word in tmpKeyWords){
					if(word.length() > 3){
						if(keyWords)
							keyWords = keyWords + " " + word + ", "
						else
							keyWords = word + ", "
					}
				}
			}
			if(newsSourceTag.tagDescription){
				def tmpKeyWords = newsSourceTag.tagDescription.split(" ")
				for(word in tmpKeyWords){
					if(word.length() > 3){
						if(keyWords)
							keyWords = keyWords + " " + word + ", "
						else
							keyWords = word + ", "
					}
				}
			}
			def metaData = [:]
			metaData.put("keyword", keyWords+"all newspapers")
			metaData.put("title", "List of newspapers and news sites in "+newsSourceTag.newsSourceTag)
			if(newsSourceTag.tagDescription)
				metaData.put("description", newsSourceTag.tagDescription)
			else
				metaData.put("description", "top newspapers in "+newsSourceTag.newsSourceTag)
			if(newsSourceTag.coverImage)
				metaData.put("image", "http://www.bddesh24.com/newsImages/d690/"+newsSourceTag.coverImage)
			else
				metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultLinkz.jpg")
			metaData.put("url", "http://www.bddesh24.com/hashword/linkz/"+newsSourceTag.newsSourceTag)
			[metaData:metaData,usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,user:user,tTag:newsSourceTag.newsSourceTag,newsSourceTag:newsSourceTag,newsSourceItems:newsSourceItems,newsSource:newsSource,keyWords:keyWords,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl,isHome:true]
		}
		else{
			redirect(uri:"/")
			return
		}
	}
	
	def newspapers() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def newsSourceTag
		def tagWord = params.id
		if(tagWord){
			newsSourceTag = NewsSourceTag.findByNewsSourceTag(tagWord)
		}
		if(newsSourceTag){
			def newsSourceItems = HashwordService.getHashwordNewsSources(newsSourceTag,new Date())
			def newsSource
			if(newsSourceItems)
				newsSource = newsSourceItems[0].newsSource
				
			def newsSourceTags
			def newsHashwords
			def topTenTags
			def pollTags
			def questionTags
			def usaTags
			def hashwordSet = HashwordSet.findByLocation("home")
			if(hashwordSet){
				newsSourceTags = hashwordSet.newsSourceTags
				if(newsSourceTags)
					newsSourceTags = newsSourceTags.replaceAll("\\s+", " ").trim().split(" ")
				newsHashwords = hashwordSet.newsArticleTags
				if(newsHashwords)
					newsHashwords = newsHashwords.replaceAll("\\s+", " ").trim().split(" ")
				topTenTags = hashwordSet.topTenTags
				if(topTenTags)
					topTenTags = topTenTags.replaceAll("\\s+", " ").trim().split(" ")
				pollTags = hashwordSet.pollTags
				if(pollTags)
					pollTags = pollTags.replaceAll("\\s+", " ").trim().split(" ")
				questionTags = hashwordSet.questionTags
				if(questionTags)
					questionTags = questionTags.replaceAll("\\s+", " ").trim().split(" ")
				usaTags = hashwordSet.usaSourceTags
				if(usaTags)
					usaTags = usaTags.replaceAll("\\s+", " ").trim().split(" ")
			}
			def keyWords = "newspapers,"
			if(newsSourceTag.newsSourceTag){
				def tmpKeyWords = newsSourceTag.newsSourceTag.split(" ")
				for(word in tmpKeyWords){
					if(word.length() > 3){
						if(keyWords)
							keyWords = keyWords + " " + word + ", "
						else
							keyWords = word + ", "
					}
				}
			}
			if(newsSourceTag.tagDescription){
				def tmpKeyWords = newsSourceTag.tagDescription.split(" ")
				for(word in tmpKeyWords){
					if(word.length() > 3){
						if(keyWords)
							keyWords = keyWords + " " + word + ", "
						else
							keyWords = word + ", "
					}
				}
			}
			def metaData = [:]
			metaData.put("keyword", keyWords+"all newspapers")
			metaData.put("title", "List of newspapers and news sites in "+newsSourceTag.newsSourceTag)
			if(newsSourceTag.tagDescription)
				metaData.put("description", newsSourceTag.tagDescription)
			else
				metaData.put("description", "top newspapers in "+newsSourceTag.newsSourceTag)
			if(newsSourceTag.coverImage)
				metaData.put("image", "http://www.bddesh24.com/newsImages/d690/"+newsSourceTag.coverImage)
			else
				metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultLinkz.jpg")
			metaData.put("url", "http://www.bddesh24.com/hashword/newspapers/"+newsSourceTag.newsSourceTag)
			[metaData:metaData,usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,user:user,tTag:newsSourceTag.newsSourceTag,newsSourceTag:newsSourceTag,newsSourceItems:newsSourceItems,newsSource:newsSource,keyWords:keyWords,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl,isHome:true]
		}
		else{
			redirect(uri:"/newspapers",permanent: true)
			return
		}
	}

	def article() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def articleHashWord
		def tagWord = params.id
		if(tagWord){
			articleHashWord = ArticleHashWord.findByHashWord(tagWord)
		}
		if(articleHashWord){
			def newsArticles = HashwordService.getHashwordNewsArticles(articleHashWord,new Date(),15)
			
			def keyWords
			if(articleHashWord.hashWord){
				def tmpKeyWords = articleHashWord.hashWord.split(" ")
				for(word in tmpKeyWords){
					if(word.length() > 3){
						if(keyWords)
							keyWords = keyWords + " " + word + ", "
						else
							keyWords = word + ", "
					}
				}
			}
			if(articleHashWord.hashWordTitle){
				def tmpKeyWords = articleHashWord.hashWordTitle.split(" ")
				for(word in tmpKeyWords){
					if(word.length() > 3){
						if(keyWords)
							keyWords = keyWords + " " + word + ", "
						else
							keyWords = word + ", "
					}
				}
			}
			def metaData = [:]
			metaData.put("keyword", keyWords+"newspapers, all newspapers")
			metaData.put("title", "Latest news in "+articleHashWord.hashWord)
			if(articleHashWord.hashWordTitle)
				metaData.put("description", articleHashWord.hashWordTitle)
			else
				metaData.put("description", "Top news in "+articleHashWord.hashWord)
			if(articleHashWord.coverImage)
				metaData.put("image", "http://www.bddesh24.com/newsImages/d690/"+articleHashWord.coverImage)
			else
				metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultLinkz.jpg")
			metaData.put("url", "http://www.bddesh24.com/hashword/article/"+articleHashWord.hashWord)
			[metaData:metaData,keyWords:keyWords,user:user,tTag:articleHashWord.hashWord,articleHashWord:articleHashWord,newsArticles:newsArticles,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl,isHome:true]
		}
		else{
			redirect(uri:"/")
			return
		}
	}
	
	def pollz() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def pollTag
		def tagWord = params.id
		if(tagWord){
			pollTag = PollTag.findByPollTag(tagWord)
		}
		if(pollTag){
			def polls = HashwordService.getHashwordPolls(pollTag,new Date())
			def pollItemsMap = polls.groupBy({it[0]})
			
			def newsSourceTags
			def newsHashwords
			def topTenTags
			def pollTags
			def questionTags
			def usaTags
			def hashwordSet = HashwordSet.findByLocation("home")
			if(hashwordSet){
				newsSourceTags = hashwordSet.newsSourceTags
				if(newsSourceTags)
					newsSourceTags = newsSourceTags.replaceAll("\\s+", " ").trim().split(" ")
				newsHashwords = hashwordSet.newsArticleTags
				if(newsHashwords)
					newsHashwords = newsHashwords.replaceAll("\\s+", " ").trim().split(" ")
				topTenTags = hashwordSet.topTenTags
				if(topTenTags)
					topTenTags = topTenTags.replaceAll("\\s+", " ").trim().split(" ")
				pollTags = hashwordSet.pollTags
				if(pollTags)
					pollTags = pollTags.replaceAll("\\s+", " ").trim().split(" ")
				questionTags = hashwordSet.questionTags
				if(questionTags)
					questionTags = questionTags.replaceAll("\\s+", " ").trim().split(" ")
				usaTags = hashwordSet.usaSourceTags
				if(usaTags)
					usaTags = usaTags.replaceAll("\\s+", " ").trim().split(" ")
			}
			def keyWords = "poll,"
			if(pollTag.pollTag){
				def tmpKeyWords = pollTag.pollTag.split(" ")
				for(word in tmpKeyWords){
					if(word.length() > 3){
						if(keyWords)
							keyWords = keyWords + " " + word + ", "
						else
							keyWords = word + ", "
					}
				}
			}
			if(pollTag.tagDescription){
				def tmpKeyWords = pollTag.tagDescription.split(" ")
				for(word in tmpKeyWords){
					if(word.length() > 3){
						if(keyWords)
							keyWords = keyWords + " " + word + ", "
						else
							keyWords = word + ", "
					}
				}
			}
			def metaData = [:]
			metaData.put("keyword", keyWords+"polls, vote")
			metaData.put("title", "Poll and vote in "+pollTag.pollTag)
			if(pollTag.tagDescription)
				metaData.put("description", pollTag.tagDescription)
			else
				metaData.put("description", "Top polls in "+pollTag.pollTag)
			if(pollTag.coverImage)
				metaData.put("image", "http://www.bddesh24.com/newsImages/d690/"+pollTag.coverImage)
			else
				metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultPoll.jpg")
			metaData.put("url", "http://www.bddesh24.com/hashword/pollz/"+pollTag.pollTag)
			[metaData:metaData,usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,keyWords:keyWords,user:user,tTag:pollTag.pollTag,pollTag:pollTag,pollItemsMap:pollItemsMap,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl,isHome:true]
		}
		else{
			redirect(uri:"/")
			return
		}
	}
	
	def toptenz() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def topTenTag
		def tagWord = params.id
		if(tagWord){
			topTenTag = TopTenTag.findByTopTenTag(tagWord)
		}
		if(topTenTag){
			def topTens = HashwordService.getHashwordTopTens(topTenTag,new Date())
			
			def newsSourceTags
			def newsHashwords
			def topTenTags
			def pollTags
			def questionTags
			def usaTags
			def hashwordSet = HashwordSet.findByLocation("home")
			if(hashwordSet){
				newsSourceTags = hashwordSet.newsSourceTags
				if(newsSourceTags)
					newsSourceTags = newsSourceTags.replaceAll("\\s+", " ").trim().split(" ")
				newsHashwords = hashwordSet.newsArticleTags
				if(newsHashwords)
					newsHashwords = newsHashwords.replaceAll("\\s+", " ").trim().split(" ")
				topTenTags = hashwordSet.topTenTags
				if(topTenTags)
					topTenTags = topTenTags.replaceAll("\\s+", " ").trim().split(" ")
				pollTags = hashwordSet.pollTags
				if(pollTags)
					pollTags = pollTags.replaceAll("\\s+", " ").trim().split(" ")
				questionTags = hashwordSet.questionTags
				if(questionTags)
					questionTags = questionTags.replaceAll("\\s+", " ").trim().split(" ")
				usaTags = hashwordSet.usaSourceTags
				if(usaTags)
					usaTags = usaTags.replaceAll("\\s+", " ").trim().split(" ")
			}
			def keyWords
			if(topTenTag.topTenTag){
				def tmpKeyWords = topTenTag.topTenTag.split(" ")
				for(word in tmpKeyWords){
					if(word.length() > 3){
						if(keyWords)
							keyWords = keyWords + " " + word + ", "
						else
							keyWords = word + ", "
					}
				}
			}
			if(topTenTag.tagDescription){
				def tmpKeyWords = topTenTag.tagDescription.split(" ")
				for(word in tmpKeyWords){
					if(word.length() > 3){
						if(keyWords)
							keyWords = keyWords + " " + word + ", "
						else
							keyWords = word + ", "
					}
				}
			}
			def metaData = [:]
			metaData.put("keyword", keyWords+"newspapers, all newspapers")
			metaData.put("title", "Top ten and best list in "+topTenTag.topTenTag)
			if(topTenTag.tagDescription)
				metaData.put("description", topTenTag.tagDescription)
			else
				metaData.put("description", "Top ten list in "+topTenTag.topTenTag)
			if(topTenTag.coverImage)
				metaData.put("image", "http://www.bddesh24.com/newsImages/d690/"+topTenTag.coverImage)
			else
				metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultTopTen.jpg")
			metaData.put("url", "http://www.bddesh24.com/hashword/toptenz/"+topTenTag.topTenTag)
			[metaData:metaData,usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,keyWords:keyWords,user:user,tTag:topTenTag.topTenTag,topTenTag:topTenTag,topTens:topTens,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl,isHome:true]
		}
		else{
			redirect(uri:"/")
			return
		}
	}
	
	def news() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def articleHashWord
		def tagWord = params.id
		if(tagWord){
			articleHashWord = ArticleHashWord.findByHashWord(tagWord)
		}
		if(articleHashWord){
			def newsArticles = HashwordService.getHashwordNewsArticles(articleHashWord,new Date())
			
			def newsSourceTags
			def newsHashwords
			def topTenTags
			def pollTags
			def questionTags
			def usaTags
			def hashwordSet = HashwordSet.findByLocation("home")
			if(hashwordSet){
				newsSourceTags = hashwordSet.newsSourceTags
				if(newsSourceTags)
					newsSourceTags = newsSourceTags.replaceAll("\\s+", " ").trim().split(" ")
				newsHashwords = hashwordSet.newsArticleTags
				if(newsHashwords)
					newsHashwords = newsHashwords.replaceAll("\\s+", " ").trim().split(" ")
				topTenTags = hashwordSet.topTenTags
				if(topTenTags)
					topTenTags = topTenTags.replaceAll("\\s+", " ").trim().split(" ")
				pollTags = hashwordSet.pollTags
				if(pollTags)
					pollTags = pollTags.replaceAll("\\s+", " ").trim().split(" ")
				questionTags = hashwordSet.questionTags
				if(questionTags)
					questionTags = questionTags.replaceAll("\\s+", " ").trim().split(" ")
				usaTags = hashwordSet.usaSourceTags
				if(usaTags)
					usaTags = usaTags.replaceAll("\\s+", " ").trim().split(" ")
			}
			def keyWords
			if(articleHashWord.hashWord){
				def tmpKeyWords = articleHashWord.hashWord.split(" ")
				for(word in tmpKeyWords){
					if(word.length() > 3){
						if(keyWords)
							keyWords = keyWords + " " + word + ", "
						else
							keyWords = word + ", "
					}
				}
			}
			if(articleHashWord.hashWordTitle){
				def tmpKeyWords = articleHashWord.hashWordTitle.split(" ")
				for(word in tmpKeyWords){
					if(word.length() > 3){
						if(keyWords)
							keyWords = keyWords + " " + word + ", "
						else
							keyWords = word + ", "
					}
				}
			}
			def metaData = [:]
			metaData.put("keyword", keyWords+"newspapers, all newspapers")
			metaData.put("title", "Latest news in "+articleHashWord.hashWord)
			if(articleHashWord.hashWordTitle)
				metaData.put("description", articleHashWord.hashWordTitle)
			else
				metaData.put("description", "Top news in "+articleHashWord.hashWord)
			if(articleHashWord.coverImage)
				metaData.put("image", "http://www.bddesh24.com/newsImages/d690/"+articleHashWord.coverImage)
			else
				metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultLinkz.jpg")
			metaData.put("url", "http://www.bddesh24.com/hashword/news/"+articleHashWord.hashWord)
			[metaData:metaData,usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,keyWords:keyWords,user:user,tTag:articleHashWord.hashWord,articleHashWord:articleHashWord,newsArticles:newsArticles,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl,isHome:true]
		}
		else{
			redirect(uri:"/")
			return
		}
	}
	
}
