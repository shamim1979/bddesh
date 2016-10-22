package com.bddesh24

import grails.plugin.springsecurity.annotation.Secured
import org.apache.commons.lang.WordUtils
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

class QuoteDayController {
	def springSecurityService
	def QuoteService
	
	@Secured(['permitAll'])
    def index() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def quotes = QuoteService.getQuotes(new Date())
		def metaData = [:]
		metaData.put("keyword", "bddesh24, quote, quotes, famous quotes, famous quote, motivational, inspiration, motivational quote, quote day")
		metaData.put("title", "Motivational, inspirational and famous quotes quoted by famous author")
		metaData.put("description", "Top list of motivational, inspirational and famous quotes quoted by famous author in the world")
		metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultQuote.jpg")
		metaData.put("url", "http://www.bddesh24.com/quoteDay")
		[metaData:metaData,quotes:quotes,user:user,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]
	}
	
	@Secured(['permitAll'])
	def author() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def quoteAuthor = QuoteAuthor.findByAuthorName(params.id)
		def canChange = false
		if(quoteAuthor){
			if(user && user.isAdmin)
				canChange = true	
			def quotes = QuoteService.getAuthorQuotes(quoteAuthor,new Date(),20)
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
			def metaData = [:]
			metaData.put("keyword", "bddesh24, motivational, inspirational, famous, quotes, quoted, author,"+quoteAuthor.displayName)
			metaData.put("title", "Top list of quotes quoted by "+quoteAuthor.displayName)
			metaData.put("description", "Top list of motivational, inspirational and famous quotes quoted by author "+quoteAuthor.displayName)
			if(quoteAuthor.coverImage)
				metaData.put("image", "http://www.bddesh24.com/newsImages/d690/"+quoteAuthor.coverImage)
			else
				metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultQuote.jpg")
			metaData.put("url", "http://www.bddesh24.com/quoteDay/author/"+quoteAuthor.authorName)
			[metaData:metaData,usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,tTag:quoteAuthor.authorName,quotes:quotes,quoteAuthor:quoteAuthor,canChange:canChange,user:user,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]
		}
		else{
			redirect(uri:"/newspapers")
			return
		}
	}
	
	@Secured(['permitAll'])
	def hashword() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def quoteTag = QuoteTopic.findByTopic(params.id)
		if(quoteTag){
			def quotes = QuoteService.getHashwordQuotes(quoteTag,new Date(),20)
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
			def metaData = [:]
			metaData.put("keyword", "bddesh24, motivational, inspirational, famous, quotes, author, hashword, "+quoteTag.topic)
			metaData.put("title", "Top list of "+quoteTag.topic+" quotes")
			metaData.put("description", "Top list of motivational, inspirational and famous quotes on "+quoteTag.topic)
			if(quoteTag.coverImage)
				metaData.put("image", "http://www.bddesh24.com/newsImages/d690/"+quoteTag.coverImage)
			else
				metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultQuote.jpg")
			metaData.put("url", "http://www.bddesh24.com/quoteDay/hashword/"+quoteTag.topic)
			[metaData:metaData,usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,tTag:quoteTag.topic,quoteTag:quoteTag,quotes:quotes,user:user,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]
		}
		else{
			redirect(uri:"/newspapers")
			return
		}
	}
	
	@Secured(['permitAll'])
	def quote() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def quoteView
		try {
			quoteView = Quote.get(Integer.parseInt(params.id))
		}
		catch(Exception e) {
		}
		if(quoteView){
			def quoteViewAuthor = QuoteAuthor.findByAuthorName(quoteView.quoteAuthor)
			def quoteComments = Quote.executeQuery("select QC,QCU from Quote as Q inner join Q.quoteComments as QC inner join QC.commentOwner as QCU where Q=:quote and QC.enabled=true order by QC.totalLike desc",[quote:quoteView,max:30])
			def authorQuotes = QuoteService.getNewAuthorQuotes(quoteViewAuthor,quoteView)
			def metaData = [:]
			def qKeywords
			if(quoteView.topicHashword){
				qKeywords = quoteView.topicHashword.replaceAll("#", ",")
				qKeywords = WordUtils.uncapitalize(qKeywords)
			}
			qKeywords = "quote, "+quoteView.quoteAuthorName+",author,famous,famous quotes"+qKeywords
			metaData.put("keyword", qKeywords)
			metaData.put("title", quoteView.quote)
			metaData.put("description", "Motivational, inspirational and famous quote by author "+quoteViewAuthor.displayName)
			if(quoteView.imageName)
				metaData.put("image", "http://www.bddesh24.com/newsImages/d490/"+quoteView.imageName)
			else
				metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultQuote.jpg")
			metaData.put("url", "http://www.bddesh24.com/quoteDay/quote/"+quoteView.id+"/"+seoCovert(title:quoteView.quoteAuthorName))
			[metaData:metaData,authorQuotes:authorQuotes,quoteViewAuthor:quoteViewAuthor,quoteView:quoteView,quoteComments:quoteComments,user:user,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]
		}
		else{
			redirect(uri:"/newspapers")
			return
		}		
	}
	
	@Secured(['ROLE_USER'])
	def createQuote(){
		def user = springSecurityService.currentUser
		withForm{
			def newsTitle
			def newsShortDescription
			def newsDetailsDescription
			def quote = params.aquote
			def description = params.quoteDescription
			def imageName = params.quoteImageName
			def topicHashword = params.quoteHashtags
			def displayName  = params.quoteAuthor	
			def authorName			
			if(displayName)
				authorName = displayName.replaceAll("[^\\u0100-\\uFFFFa-zA-Z0-9]", "")
			def quoteAuthor = QuoteAuthor.findByAuthorName(authorName)
			if(!quoteAuthor){
				quoteAuthor = new QuoteAuthor(authorName:authorName,displayName:displayName)
			}
						
			def hashWords
			def hasDetails = false
			Random random = new Random()
			def author
			def adminSize
			def adminUsers
			if(user.isAdmin){
				adminUsers = User.executeQuery("from User as U where U.enabled=true and U.isAdmin=true")
				adminSize = adminUsers.size()
				author = adminUsers[random.nextInt(adminSize)]
			}
			else{
				author = user
			}
			if(topicHashword){
				topicHashword = topicHashword.replaceAll("#", "")
				def words = topicHashword.split(" ");
				for(word in words){
					if(word.length() > 2){
						if(hashWords)
							hashWords = hashWords + " #" + WordUtils.capitalize(word)
						else
							hashWords = "#" + WordUtils.capitalize(word)
					}
				}
			}
			if(quote){
				if(quote.length() > 590)
					quote = quote.substring(0,590)
				def quoteWords = quote.replaceAll("[^\\u0100-\\uFFFFa-zA-Z0-9]", " ")
				def words = quoteWords.split(" ");
				for(word in words){
					if(word.length() > 3){
						if(hashWords)
							hashWords = hashWords + " #" + WordUtils.capitalize(word)
						else
							hashWords = "#" + WordUtils.capitalize(word)
					}
				}		
				if(quote.length() > 350)
					newsShortDescription = quote.substring(0,350)
				else
					newsShortDescription = quote
				newsDetailsDescription = quote
				newsTitle = "Quote by author: "+ displayName			
			}			
			if(description){
				if(description.length() > 950)
					description = description.substring(0,950)
				def words = description.split(" ");
				for(word in words){
					if(word.length() > 2 && word.substring(0,1) == "#"){
						if(hashWords)
							hashWords = hashWords + " #" + WordUtils.capitalize(word)
						else
							hashWords = "#" + WordUtils.capitalize(word)
					}
				}
				description = description.replaceAll("#", "")
				if(description.length() > 350)
					newsShortDescription = description.substring(0,350)
				else
					newsShortDescription = description
				newsDetailsDescription = description				
			}
			if(imageName)
				imageName = "u"+user.id+"/"+imageName
			if(hashWords)
				hashWords = new LinkedHashSet<String>(Arrays.asList(hashWords.split(" "))).toString().replaceAll("[^\\u0100-\\uFFFFa-zA-Z0-9#]", " ")
			def newQuote = new Quote(quote:quote,description:description,imageName:imageName,topicHashword:hashWords,quoteOwner:author,quoteAuthor:authorName,quoteAuthorName:displayName)
			if(newQuote.save(flush:true)){
				if(hashWords){
					def newHashWords = hashWords.replaceAll("#", "")
					def words = newHashWords.split(" ");
					for(word in words){
						if(word && word.length() > 2){
							def foundHashWord = QuoteTopic.findByTopic(word)
							if(foundHashWord){
								foundHashWord.totalQuote = foundHashWord.totalQuote + 1
								foundHashWord.addToQuotes(newQuote)
								foundHashWord.save(flush:true)
							}
							else{
								def hashWordTitle = word + " quote"
								def newHashWord = new QuoteTopic(topic:word,topicDescription:hashWordTitle,quoteTopicOwner:author)
								newHashWord.addToQuotes(newQuote)
								newHashWord.save(flush:true)
							}
						}
					}
				}
				quoteAuthor.addToQuotes(newQuote)
				quoteAuthor.totalQuote = quoteAuthor.totalQuote + 1
				quoteAuthor.save(flush:true)
				def newNewsArticle = new NewsArticle(title:newsTitle,hashWords:hashWords,shortDescription:newsShortDescription,detailsDescription:newsDetailsDescription,imageName:imageName,articleOwner:author,postType:5,postId:newQuote.id)
				if(newNewsArticle.save(flush:true)){
					newQuote.postId = newNewsArticle.id
					newQuote.save(flush:true)
					if(hashWords){
						def newHashWords = hashWords.replaceAll("#", "")
						def words = newHashWords.split(" ");
						for(word in words){
							if(word && word.length() > 2){
								def foundHashWord = ArticleHashWord.findByHashWord(word)
								if(foundHashWord){
									foundHashWord.totalArticle = foundHashWord.totalArticle + 1
									foundHashWord.addToNewsArticles(newNewsArticle)
									foundHashWord.save(flush:true)
								}
								else{
									def hashWordTitle = word + " news"
									def newHashWord = new ArticleHashWord(hashWord:word,hashWordTitle:hashWordTitle,articleHashWordOwner:author)
									newHashWord.addToNewsArticles(newNewsArticle)
									newHashWord.save(flush:true)
								}
							}
						}
					}
				}
				if(user.isAdmin){
					def latestNews = LatestNews.executeQuery("from LatestNews as LN where LN.postType=:postType order by LN.dateCreated",[postType:33])
					if(latestNews.size() == 5){
						latestNews[0].delete()
					}
					def newLatestNews = new LatestNews(title:newsTitle,shortDescription:newsShortDescription,imageName:imageName,postType:33,postId:newQuote.id)
					newLatestNews.save(flush:true)
				}
				flash.message = "Well done! You successfully created a quote. Thanks for staying with us."
				redirect(uri:"/quoteDay/quote/"+newQuote.id+"/"+seoCovert(title:newQuote.quote))
				return
			}
			else{
				redirect(uri:"/")
				return
			}
			
		}.invalidToken{
			redirect(uri:"/")
			return
		}
	}
}
