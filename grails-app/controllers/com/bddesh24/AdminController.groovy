package com.bddesh24

import org.apache.commons.lang.WordUtils
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU
import grails.plugin.springsecurity.annotation.Secured
import grails.util.GrailsUtil
import groovyx.net.http.*
import static groovyx.net.http.Method.*
import static groovyx.net.http.ContentType.*
import groovyx.net.http.HTTPBuilder
import javax.servlet.http.HttpServletResponse
import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.*
import org.apache.http.entity.mime.content.FileBody
import org.apache.http.entity.mime.MultipartEntity
import org.apache.http.entity.mime.HttpMultipartMode
import org.apache.http.entity.mime.content.InputStreamBody
import org.apache.http.entity.mime.content.StringBody
import grails.plugin.springsecurity.annotation.Secured
import groovy.sql.Sql
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import java.io.File;
import java.util.Iterator
import javax.imageio.*
import javax.imageio.stream.*
import com.sun.org.apache.xpath.internal.operations.String
import com.sun.xml.internal.ws.encoding.ContentType
import grails.converters.*

@Secured(['ROLE_ADMIN'])
class AdminController {
	
	def springSecurityService
	
	def index() { 
		def user = springSecurityService.currentUser
		[user:user]
	}
	
	def newQuoteGen() {
		def user = springSecurityService.currentUser
		[user:user]
	}
	
	def newTopTenGen() {
		def user = springSecurityService.currentUser
		[user:user]
	}
	
	def linkFetchTopten() {
		def user = springSecurityService.currentUser
		def URLData
		def urlLink = request.getParameter('urlLink')
		def http
		def uri
		def domainName
		def uploadSuccess = false
				
		try{
			uri = new java.net.URI(request.getHeader("referer"))
			domainName = uri.getHost()
			if(domainName == "localhost"){
				domainName = "http://"+domainName+"/newsiws/socialTopTenLstHtmlParser.php"
			}
			else{
				domainName = "http://"+domainName+":8081/newsiws/socialTopTenLstHtmlParser.php"
			}
		}catch(Exception e){
		}
		if(GrailsUtil.isDevelopmentEnv()){
			http = new HTTPBuilder(domainName)
		}
		else{
			http = new HTTPBuilder(domainName)
		}
				
		http.request(Method.POST) { req ->
			requestContentType: "multipart/form-data"
			MultipartEntity multiPartContent = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE)
			multiPartContent.addPart("urlLink", new StringBody(urlLink))
			def userId = "u"+user.id
			multiPartContent.addPart("userId", new StringBody(userId))
			req.setEntity(multiPartContent)
			response.success = { resp,json ->
				if (resp.statusLine.statusCode == 200) {
					def real = json.toString();
					uploadSuccess = true
					URLData = real
					
				}
			}
		}
		if(uploadSuccess){
			render URLData
		}
		else{
			render "bad"
		}
		
	
	}
	
	def createTopten() {
		def user = springSecurityService.currentUser
		withForm{
			def quoteItemLength
			try {
				quoteItemLength = Integer.parseInt(params.quoteItemLength)
			}
			catch(Exception e) {
			}
			if(quoteItemLength>0){
				for(int j = 1; j <= quoteItemLength; j++){
					def tQuote = params."quote${j}"
					def tAuthor = params."quoteAuthor${j}"
					def fQuote = Quote.executeQuery("from Quote as Q where Q.quote=:tQuote and Q.enabled=true",[tQuote:tQuote])
					if(!fQuote)
						createQuote(tQuote,tAuthor)
				}
				redirect(uri:"/admin/newQuoteGen")
				return
			}
			else{
				redirect(uri:"/admin/newQuoteGen")
				return
			}
			
		}.invalidToken{
			redirect(uri:"/admin/newQuoteGen")
			return
		}
	}
	
	
	def linkFetchQuote() {
		def user = springSecurityService.currentUser
		def URLData
		def urlLink = request.getParameter('urlLink')		
		def http
		def uri
		def domainName
		def uploadSuccess = false
				
		try{
			uri = new java.net.URI(request.getHeader("referer"))
			domainName = uri.getHost()
			if(domainName == "localhost"){
				domainName = "http://"+domainName+"/newsiws/socialQuoteLstHtmlParser.php"				
			}
			else{
				domainName = "http://"+domainName+":8081/newsiws/socialQuoteLstHtmlParser.php"
			}
		}catch(Exception e){
		}
		if(GrailsUtil.isDevelopmentEnv()){
			http = new HTTPBuilder(domainName)
		}
		else{
			http = new HTTPBuilder(domainName)
		}
				
		http.request(Method.POST) { req ->
			requestContentType: "multipart/form-data"
			MultipartEntity multiPartContent = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE)
			multiPartContent.addPart("urlLink", new StringBody(urlLink))
			def userId = "u"+user.id
			multiPartContent.addPart("userId", new StringBody(userId))
			req.setEntity(multiPartContent)
			response.success = { resp,json ->
				if (resp.statusLine.statusCode == 200) {					
					def real = json.toString();
					uploadSuccess = true
					URLData = real
					
				}
			}
		}
		if(uploadSuccess){
			render URLData			
		}
		else{
			render "bad"
		}
		
	
	}
	
	def createQuotes() {
		def user = springSecurityService.currentUser
		withForm{
			def quoteItemLength
			try {
				quoteItemLength = Integer.parseInt(params.quoteItemLength)				
			}
			catch(Exception e) {
			}
			if(quoteItemLength>0){
				for(int j = 1; j <= quoteItemLength; j++){
					def tQuote = params."quote${j}"
					def tAuthor = params."quoteAuthor${j}"
					def fQuote = Quote.executeQuery("from Quote as Q where Q.quote=:tQuote and Q.enabled=true",[tQuote:tQuote])
					if(!fQuote)
						createQuote(tQuote,tAuthor)
				}
				redirect(uri:"/admin/newQuoteGen")
				return
			}
			else{
				redirect(uri:"/admin/newQuoteGen")
				return
			}
			
		}.invalidToken{
			redirect(uri:"/admin/newQuoteGen")
			return
		}
	}
	
	def createQuote(def fquote, def fauthor) {
		def user = springSecurityService.currentUser
		def dateCreated 
		def newsTitle
		def newsShortDescription
		def newsDetailsDescription
		def quote = fquote
		def description
		def imageName
		def topicHashword
		def displayName  = fauthor
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
		dateCreated = new Date() - random.nextInt(30)
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
		
		if(imageName)
			imageName = "u"+user.id+"/"+imageName
		if(hashWords)
			hashWords = new LinkedHashSet<String>(Arrays.asList(hashWords.split(" "))).toString().replaceAll("[^\\u0100-\\uFFFFa-zA-Z0-9#]", " ")
		def newQuote = new Quote(quote:quote,description:description,imageName:imageName,topicHashword:hashWords,quoteOwner:author,quoteAuthor:authorName,quoteAuthorName:displayName)
		if(newQuote.save(flush:true)){
			newQuote.dateCreated = dateCreated
			newQuote.save(flush:true)
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
				newNewsArticle.dateCreated = dateCreated
				newNewsArticle.save(flush:true)
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
		}
	}
	
	def createNewsSource() {
		withForm{
			def title = params.title
			def shortDescription = params.shortDescription
			def newsSourceTag = params.newsSourceTag
			def newsSourceItemLength = params.newsSourceItemLength
			def newsSourceHashTags
			def itemsLength
			try{
				if(newsSourceItemLength)
					itemsLength = Integer.parseInt(newsSourceItemLength)
			}
			catch(Exception e){
				itemsLength = 1
			}
			
			if(newsSourceTag){
				def words = newsSourceTag.split(" ");
				for(word in words){
					if(word.length() > 2){
						if(word.substring(0,1) == "#"){
							if(newsSourceHashTags)
								newsSourceHashTags = newsSourceHashTags + " " + word
							else
								newsSourceHashTags = word
						}
						else{
							if(newsSourceHashTags)
								newsSourceHashTags = newsSourceHashTags + " #" + word
							else
								newsSourceHashTags = "#" + word
						}
					}
				}
			}
			
			def rootTags = newsSourceTag.replaceAll("#", "")
			
			if(title){
				if(title.length() > 240)
					title = title.substring(0,240)
				title = title.replaceAll("#", "")
			}
			if(shortDescription){
				if(shortDescription.length() > 450)
					shortDescription = shortDescription.substring(0,450)
				shortDescription = shortDescription.replaceAll("#", "")
			}
			
			def newNewsSource = new NewsSource(title:title,shortDescription:shortDescription)
			
			for(int j = 1; j <= itemsLength; j++){
				def ititle = params."title${j}"
				def ishortDescription = params."shortDescription${j}"
				def inewsLinks = params."newsLinks${j}"
				def inewsSourceTag = params."newsSourceTag${j}"
				inewsSourceTag = inewsSourceTag.replaceAll("#", "")
				def hashInewsSourceTag
				if(inewsSourceTag){
					def words = inewsSourceTag.split(" ");
					for(word in words){
						if(word.length() > 2){
							if(hashInewsSourceTag)
								hashInewsSourceTag = hashInewsSourceTag + " #" + word
							else
								hashInewsSourceTag = "#" + word
						}
					}
				}
				
				if(ititle){
					if(ititle.length() > 240)
						ititle = ititle.substring(0,240)
					ititle = ititle.replaceAll("#", "")
				}
				if(ishortDescription){
					if(ishortDescription.length() > 450)
						ishortDescription = ishortDescription.substring(0,450)
					ishortDescription = ishortDescription.replaceAll("#", "")
				}
				if(inewsLinks){
					if(inewsLinks.length() > 7800)
						inewsLinks = inewsLinks.substring(0,7800)
					inewsLinks = inewsLinks.replaceAll("#", "")
				}
				
				def newNewsSourceItem = new NewsSourceItem(title:ititle,shortDescription:ishortDescription,newsLinks:inewsLinks,newsSourceTag:hashInewsSourceTag)
				newNewsSource.addToNewsSourceItems(newNewsSourceItem)
				if(newNewsSource.save(flush:true)){
					if(inewsSourceTag){
						def newHashWords = inewsSourceTag.replaceAll("#", "")
						def words = newHashWords.split(" ");
						for(word in words){
							if(word && word.length() > 2){
								def foundHashWord = NewsSourceTag.findByNewsSourceTag(word)
								if(foundHashWord){
									foundHashWord.totalNewsSourceItem = foundHashWord.totalNewsSourceItem + 1
									foundHashWord.addToNewsSourceItems(newNewsSourceItem)
									if(foundHashWord.save(flush:true)){
										if(newsSourceHashTags)
											newsSourceHashTags = newsSourceHashTags + " #" + word
										else
											newsSourceHashTags = word
									}
									
								}
								else{
									def hashWordTitle = word + " news"
									def newHashWord = new NewsSourceTag(newsSourceTag:word,tagDescription:hashWordTitle)
									newHashWord.addToNewsSourceItems(newNewsSourceItem)
									if(newHashWord.save(flush:true)){
										if(newsSourceHashTags)
											newsSourceHashTags = newsSourceHashTags + " #" + word
										else
											newsSourceHashTags = word
									}
								}
							}
						}
					}
					
					if(rootTags){
						def newHashWords = rootTags.replaceAll("#", "")
						def words = newHashWords.split(" ");
						for(word in words){
							if(word && word.length() > 2){
								def foundHashWord = NewsSourceTag.findByNewsSourceTag(word)
								if(foundHashWord){
									foundHashWord.totalNewsSourceItem = foundHashWord.totalNewsSourceItem + 1
									foundHashWord.addToNewsSourceItems(newNewsSourceItem)
									foundHashWord.save(flush:true)
								}
								else{
									def hashWordTitle = word + " news"
									def newHashWord = new NewsSourceTag(newsSourceTag:word,tagDescription:hashWordTitle)
									newHashWord.addToNewsSourceItems(newNewsSourceItem)
									newHashWord.save(flush:true)
								}
							}
						}
					}
				}
			}
			newNewsSource.newsSourceTag = newsSourceHashTags
			newNewsSource.save(flush:true)
			redirect(uri:"/admin/newNewsSource")
			return			
		}.invalidToken{
			redirect(uri:"/admin/newNewsSource")
			return
		}
	}
	
	def newNewsSource() {
		def user = springSecurityService.currentUser
		[user:user]
	}
}
