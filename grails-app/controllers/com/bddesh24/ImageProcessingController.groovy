package com.bddesh24

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

class ImageProcessingController {
	def springSecurityService
	
    def index() { 
		redirect(uri:"/")
		return
	}
	
	@Secured(['ROLE_USER'])
	def linkDataFetching(){
		def user = springSecurityService.currentUser
		def URLTitle
		def urlDescription
		def urlImage
		def urlLink = request.getParameter('urlLink')
		def hasImage = request.getParameter('hasImage')		
		def http
		def uri
		def domainName
		def uploadSuccess = false
				
		try{
			uri = new java.net.URI(request.getHeader("referer"))
			domainName = uri.getHost()
			if(domainName == "localhost"){				
				if(hasImage.equals("Quote"))
					domainName = "http://"+domainName+"/newsiws/socialQuoteHtmlParser.php"
				else
					domainName = "http://"+domainName+"/newsiws/socialHtmlParser.php"
				
			}
			else{
				if(hasImage.equals("Quote"))
					domainName = "http://"+domainName+":8081/newsiws/socialQuoteHtmlParser.php"
				else
					domainName = "http://"+domainName+":8081/newsiws/socialHtmlParser.php"
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
			multiPartContent.addPart("hasImage", new StringBody(hasImage))			
			req.setEntity(multiPartContent)
			response.success = { resp,json ->
				if (resp.statusLine.statusCode == 200) {
					def real = JSON.parse(json.toString());
					if(real.success.equals("done")){	
						if(hasImage.equals("Quote")){
							uploadSuccess = true
							URLTitle = real.quote
							urlDescription = real.author
						}
						else{
							uploadSuccess = true
							URLTitle = real.urlTitle
							urlDescription = real.urlDescription
							urlImage = real.urlImage
						}						
					}
				}
			}
		}
		if(uploadSuccess){
			if(hasImage.equals("Quote")){
				render(contentType: 'text/json') {['URLTitle': URLTitle,'urlDescription':urlDescription]}
			}
			else{
				render(contentType: 'text/json') {['URLTitle': URLTitle,'urlDescription':urlDescription,'urlImage':urlImage,'userId':"u"+user.id]}
			}
		}
		else{
			render "bad"
		}
	}
	
	@Secured(['ROLE_USER'])
	def socialImageUpload(){
		def user = springSecurityService.currentUser
		def image = request.getParameter('image')
		def imageWidth = request.getParameter('imageWidth')
		def imageHeight = request.getParameter('imageHeight')
		def posX = request.getParameter('posX')
		def posY = request.getParameter('posY')
		
		def imageName
		def uploadSuccess = false
		def http
		def uri
		def domainName
		try{
			uri = new java.net.URI(request.getHeader("referer"))
			domainName = uri.getHost()
			if(domainName == "localhost")
				domainName = "http://"+domainName+"/newsiws/socialImageCrop.php"
			else
				domainName = "http://"+domainName+":8081/newsiws/socialImageCrop.php"
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
			multiPartContent.addPart("myPicture", new StringBody(image))
			def userId = "u"+user.id
			multiPartContent.addPart("userId", new StringBody(userId))
			multiPartContent.addPart("ImageType", new StringBody("jpeg"))
			multiPartContent.addPart("imageWidth", new StringBody(imageWidth))
			multiPartContent.addPart("imageHeight", new StringBody(imageHeight))
			multiPartContent.addPart("posX", new StringBody(posX))
			multiPartContent.addPart("posY", new StringBody(posY))
			
			req.setEntity(multiPartContent)
			response.success = { resp,json ->
				if (resp.statusLine.statusCode == 200) {
					def real = JSON.parse(json.toString());
					if(real.success.equals("done")){
						uploadSuccess = true
						imageName = real.imageName
					}
					else if(real.success.equals("imageTypeFailed")){
						//imageTypeNotMached=true
					}
				}
			}
		}
		if(uploadSuccess){
			render(contentType: 'text/json') {[
				'imageName': imageName,
				'userId':"u"+user.id
			]}
		}
		else{
			render "bad"
		}
	}
	
	@Secured(['ROLE_USER'])
	def socialQuoteImageUpload(){
		def user = springSecurityService.currentUser
		def image = request.getParameter('image')
		def imageWidth = request.getParameter('imageWidth')
		def imageHeight = request.getParameter('imageHeight')
		def posX = request.getParameter('posX')
		def posY = request.getParameter('posY')
		
		def imageName
		def uploadSuccess = false
		def http
		def uri
		def domainName
		try{
			uri = new java.net.URI(request.getHeader("referer"))
			domainName = uri.getHost()
			if(domainName == "localhost")
				domainName = "http://"+domainName+"/newsiws/socialQuoteImageCrop.php"
			else
				domainName = "http://"+domainName+":8081/newsiws/socialQuoteImageCrop.php"
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
			multiPartContent.addPart("myPicture", new StringBody(image))
			def userId = "u"+user.id
			multiPartContent.addPart("userId", new StringBody(userId))
			multiPartContent.addPart("ImageType", new StringBody("jpeg"))
			multiPartContent.addPart("imageWidth", new StringBody(imageWidth))
			multiPartContent.addPart("imageHeight", new StringBody(imageHeight))
			multiPartContent.addPart("posX", new StringBody(posX))
			multiPartContent.addPart("posY", new StringBody(posY))
			
			req.setEntity(multiPartContent)
			response.success = { resp,json ->
				if (resp.statusLine.statusCode == 200) {
					def real = JSON.parse(json.toString());
					if(real.success.equals("done")){
						uploadSuccess = true
						imageName = real.imageName
					}
					else if(real.success.equals("imageTypeFailed")){
						//imageTypeNotMached=true
					}
				}
			}
		}
		if(uploadSuccess){
			render(contentType: 'text/json') {[
				'imageName': imageName,
				'userId':"u"+user.id
			]}
		}
		else{
			render "bad"
		}
	}
		
	@Secured(['ROLE_USER'])
	def topItemImageUpload(){
		def user = springSecurityService.currentUser
		def image = request.getParameter('image')
		def imageWidth = request.getParameter('imageWidth')
		def imageHeight = request.getParameter('imageHeight')
		def posX = request.getParameter('posX')
		def posY = request.getParameter('posY')
		
		def imageName
		def uploadSuccess = false
		def http
		def uri
		def domainName
		def topTenItem
		try{
			topTenItem = TopTenItem.get(Integer.parseInt(request.getParameter('cpTTItemId')))
			uri = new java.net.URI(request.getHeader("referer"))
			domainName = uri.getHost()
			if(domainName == "localhost")
				domainName = "http://"+domainName+"/newsiws/socialTopItemImageCrop.php"
			else
				domainName = "http://"+domainName+":8081/newsiws/socialTopItemImageCrop.php"
		}catch(Exception e){
		}
		if(GrailsUtil.isDevelopmentEnv()){
			http = new HTTPBuilder(domainName)
		}
		else{
			http = new HTTPBuilder(domainName)
		}
		if(topTenItem){
			http.request(Method.POST) { req ->
				requestContentType: "multipart/form-data"
				MultipartEntity multiPartContent = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE)
				multiPartContent.addPart("myPicture", new StringBody(image))
				def userId = "u"+user.id
				multiPartContent.addPart("userId", new StringBody(userId))
				multiPartContent.addPart("ImageType", new StringBody("jpeg"))
				multiPartContent.addPart("imageWidth", new StringBody(imageWidth))
				multiPartContent.addPart("imageHeight", new StringBody(imageHeight))
				multiPartContent.addPart("posX", new StringBody(posX))
				multiPartContent.addPart("posY", new StringBody(posY))
				
				req.setEntity(multiPartContent)
				response.success = { resp,json ->
					if (resp.statusLine.statusCode == 200) {
						def real = JSON.parse(json.toString());
						if(real.success.equals("done")){
							uploadSuccess = true
							imageName = real.imageName
						}
						else if(real.success.equals("imageTypeFailed")){
							//imageTypeNotMached=true
						}
					}
				}
			}
			if(uploadSuccess){
				topTenItem.imageName = "u"+user.id+"/"+imageName
				topTenItem.save(flush:true)
				render(contentType: 'text/json') {[
					'imageName': imageName,
					'userId':"u"+user.id
				]}
			}
			else{
				render "bad"
			}
		}
		else{
			render "bad"
			return
		}
	}
	
	@Secured(['ROLE_USER'])
	def pollAnswerImageUpload(){
		def user = springSecurityService.currentUser
		def image = request.getParameter('image')
		def imageWidth = request.getParameter('imageWidth')
		def imageHeight = request.getParameter('imageHeight')
		def posX = request.getParameter('posX')
		def posY = request.getParameter('posY')
		def isPollAnswer = request.getParameter('isPollAnswer')
		def imageName
		def uploadSuccess = false
		def http
		def uri
		def domainName
		def pollAnswer
		try{
			if(isPollAnswer.equals("dpoll")){
				pollAnswer = Poll.get(Integer.parseInt(request.getParameter('cpTTItemId')))
			}
			else if(isPollAnswer.equals("danswer")){
				pollAnswer = Answer.get(Integer.parseInt(request.getParameter('cpTTItemId')))
			}			
			uri = new java.net.URI(request.getHeader("referer"))
			domainName = uri.getHost()
			if(domainName == "localhost")
				domainName = "http://"+domainName+"/newsiws/socialImageCrop.php"
			else
				domainName = "http://"+domainName+":8081/newsiws/socialImageCrop.php"
		}catch(Exception e){
		}
		if(GrailsUtil.isDevelopmentEnv()){
			http = new HTTPBuilder(domainName)
		}
		else{
			http = new HTTPBuilder(domainName)
		}
		if(pollAnswer){
			http.request(Method.POST) { req ->
				requestContentType: "multipart/form-data"
				MultipartEntity multiPartContent = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE)
				multiPartContent.addPart("myPicture", new StringBody(image))
				def userId = "u"+user.id
				multiPartContent.addPart("userId", new StringBody(userId))
				multiPartContent.addPart("ImageType", new StringBody("jpeg"))
				multiPartContent.addPart("imageWidth", new StringBody(imageWidth))
				multiPartContent.addPart("imageHeight", new StringBody(imageHeight))
				multiPartContent.addPart("posX", new StringBody(posX))
				multiPartContent.addPart("posY", new StringBody(posY))
				
				req.setEntity(multiPartContent)
				response.success = { resp,json ->
					if (resp.statusLine.statusCode == 200) {
						def real = JSON.parse(json.toString());
						if(real.success.equals("done")){
							uploadSuccess = true
							imageName = real.imageName
						}
						else if(real.success.equals("imageTypeFailed")){
							//imageTypeNotMached=true
						}
					}
				}
			}
			if(uploadSuccess){
				pollAnswer.imageName = "u"+user.id+"/"+imageName
				pollAnswer.save(flush:true)
				render(contentType: 'text/json') {[
					'imageName': imageName,
					'userId':"u"+user.id
				]}
			}
			else{
				render "bad"
			}
		}
		else{
			render "bad"
			return
		}
	}
	
	@Secured(['ROLE_USER'])
	def profileCoverImageUpload(){
		def user = springSecurityService.currentUser
		def image = request.getParameter('image')
		def imageWidth = request.getParameter('imageWidth')
		def imageHeight = request.getParameter('imageHeight')
		def posX = request.getParameter('posX')
		def posY = request.getParameter('posY')
		def upImagefor = request.getParameter('upImagefor')		
		def imageName
		def uploadSuccess = false
		def http
		def uri
		def domainName
		def profileUser
		try{
			if(upImagefor.equals("apCover"))
				profileUser = QuoteAuthor.get(Integer.parseInt(request.getParameter('pUser')))
			else
				profileUser = User.get(Integer.parseInt(request.getParameter('pUser')))
			uri = new java.net.URI(request.getHeader("referer"))
			domainName = uri.getHost()
			if(domainName == "localhost")
				domainName = "http://"+domainName+"/newsiws/socialCoverImageCrop.php"
			else
				domainName = "http://"+domainName+":8081/newsiws/socialCoverImageCrop.php"
		}catch(Exception e){
		}
		if(GrailsUtil.isDevelopmentEnv()){
			http = new HTTPBuilder(domainName)
		}
		else{
			http = new HTTPBuilder(domainName)
		}
		if(profileUser){
			http.request(Method.POST) { req ->
				requestContentType: "multipart/form-data"
				MultipartEntity multiPartContent = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE)
				multiPartContent.addPart("myPicture", new StringBody(image))
				def userId
				if(upImagefor.equals("apCover"))
					userId = "u"+user.id
				else
					userId = "u"+profileUser.id
				multiPartContent.addPart("userId", new StringBody(userId))
				multiPartContent.addPart("ImageType", new StringBody("jpeg"))
				multiPartContent.addPart("imageWidth", new StringBody(imageWidth))
				multiPartContent.addPart("imageHeight", new StringBody(imageHeight))
				multiPartContent.addPart("posX", new StringBody(posX))
				multiPartContent.addPart("posY", new StringBody(posY))
				
				req.setEntity(multiPartContent)
				response.success = { resp,json ->
					if (resp.statusLine.statusCode == 200) {
						def real = JSON.parse(json.toString());
						if(real.success.equals("done")){
							uploadSuccess = true
							imageName = real.imageName
						}
						else if(real.success.equals("imageTypeFailed")){
							//imageTypeNotMached=true
						}
					}
				}
			}
			if(uploadSuccess){
				if(upImagefor.equals("apCover")){
					profileUser.coverImage = "u"+user.id+"/"+imageName
					profileUser.save(flush:true)
					render(contentType: 'text/json') {[
						'imageName': imageName,
						'userId':"u"+user.id
					]}
				}
				else{
					def profile = profileUser.profile
					profile.coverImage = "u"+profileUser.id+"/"+imageName
					profile.save(flush:true)
					render(contentType: 'text/json') {[
						'imageName': imageName,
						'userId':"u"+profileUser.id
					]}
				}				
			}
			else{
				render "bad"
			}
		}
		else{
			render "bad"
			return
		}
	}
	
	@Secured(['ROLE_USER'])
	def hashwordCoverImageUpload(){
		def user = springSecurityService.currentUser
		def image = request.getParameter('image')
		def imageWidth = request.getParameter('imageWidth')
		def imageHeight = request.getParameter('imageHeight')
		def posX = request.getParameter('posX')
		def posY = request.getParameter('posY')
		def hashwordId = request.getParameter('tag')
		def hashwordType = request.getParameter('hwType')
		def hashword
		def imageName
		def uploadSuccess = false
		def http
		def uri
		def domainName
		try{
			if(hashwordType.equals("hwask")){
				hashword = QuestionTag.get(Integer.parseInt(hashwordId))
			}
			else if(hashwordType.equals("hwlinkz")){
				hashword = NewsSourceTag.get(Integer.parseInt(hashwordId))
			}
			else if(hashwordType.equals("hwnews")){
				hashword = ArticleHashWord.get(Integer.parseInt(hashwordId))
			}
			else if(hashwordType.equals("hwpollz")){
				hashword = PollTag.get(Integer.parseInt(hashwordId))
			}
			else if(hashwordType.equals("hwtoptenz")){
				hashword = TopTenTag.get(Integer.parseInt(hashwordId))
			}		
			else if(hashwordType.equals("hwquote")){
				hashword = QuoteTopic.get(Integer.parseInt(hashwordId))
			}
			uri = new java.net.URI(request.getHeader("referer"))
			domainName = uri.getHost()
			if(domainName == "localhost")
				domainName = "http://"+domainName+"/newsiws/socialCoverImageCrop.php"
			else
				domainName = "http://"+domainName+":8081/newsiws/socialCoverImageCrop.php"
		}catch(Exception e){
		}
		if(GrailsUtil.isDevelopmentEnv()){
			http = new HTTPBuilder(domainName)
		}
		else{
			http = new HTTPBuilder(domainName)
		}
		if(hashword){
			http.request(Method.POST) { req ->
				requestContentType: "multipart/form-data"
				MultipartEntity multiPartContent = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE)
				multiPartContent.addPart("myPicture", new StringBody(image))
				def userId = "u"+user.id
				multiPartContent.addPart("userId", new StringBody(userId))
				multiPartContent.addPart("ImageType", new StringBody("jpeg"))
				multiPartContent.addPart("imageWidth", new StringBody(imageWidth))
				multiPartContent.addPart("imageHeight", new StringBody(imageHeight))
				multiPartContent.addPart("posX", new StringBody(posX))
				multiPartContent.addPart("posY", new StringBody(posY))
				
				req.setEntity(multiPartContent)
				response.success = { resp,json ->
					if (resp.statusLine.statusCode == 200) {
						def real = JSON.parse(json.toString());
						if(real.success.equals("done")){
							uploadSuccess = true
							imageName = real.imageName
						}
						else if(real.success.equals("imageTypeFailed")){
							//imageTypeNotMached=true
						}
					}
				}
			}
			if(uploadSuccess){
				hashword.coverImage = "u"+user.id+"/"+imageName
				hashword.save(flush:true)
				render(contentType: 'text/json') {[
					'imageName': imageName,
					'userId':"u"+user.id
				]}
			}
			else{
				render "bad"
				return
			}
		}
		else{
			render "bad"
			return
		}
	}
	
	@Secured(['ROLE_USER'])
	def profileImageUpload(){
		def user = springSecurityService.currentUser
		def image = request.getParameter('image')
		def imageWidth = request.getParameter('imageWidth')
		def imageHeight = request.getParameter('imageHeight')
		def posX = request.getParameter('posX')
		def posY = request.getParameter('posY')
		def upImagefor = request.getParameter('upImagefor')
		def imageName
		def uploadSuccess = false
		def http
		def uri
		def domainName
		def profileUser
		try{
			if(upImagefor.equals("apProfile"))
				profileUser = QuoteAuthor.get(Integer.parseInt(request.getParameter('pUser')))
			else
				profileUser = User.get(Integer.parseInt(request.getParameter('pUser')))
			uri = new java.net.URI(request.getHeader("referer"))
			domainName = uri.getHost()
			if(domainName == "localhost")
				domainName = "http://"+domainName+"/newsiws/socialProfileImageCrop.php"
			else
				domainName = "http://"+domainName+":8081/newsiws/socialProfileImageCrop.php"
		}catch(Exception e){
		}
		if(GrailsUtil.isDevelopmentEnv()){
			http = new HTTPBuilder(domainName)
		}
		else{
			http = new HTTPBuilder(domainName)
		}
		if(profileUser){
			http.request(Method.POST) { req ->
				requestContentType: "multipart/form-data"
				MultipartEntity multiPartContent = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE)
				multiPartContent.addPart("myPicture", new StringBody(image))
				def userId
				if(upImagefor.equals("apProfile"))
					userId = "u"+user.id
				else
					userId = "u"+profileUser.id
				multiPartContent.addPart("userId", new StringBody(userId))
				multiPartContent.addPart("ImageType", new StringBody("jpeg"))
				multiPartContent.addPart("imageWidth", new StringBody(imageWidth))
				multiPartContent.addPart("imageHeight", new StringBody(imageHeight))
				multiPartContent.addPart("posX", new StringBody(posX))
				multiPartContent.addPart("posY", new StringBody(posY))
				
				req.setEntity(multiPartContent)
				response.success = { resp,json ->
					if (resp.statusLine.statusCode == 200) {
						def real = JSON.parse(json.toString());
						if(real.success.equals("done")){
							uploadSuccess = true
							imageName = real.imageName
						}
						else if(real.success.equals("imageTypeFailed")){
							//imageTypeNotMached=true
						}
					}
				}
			}
			if(uploadSuccess){
				if(upImagefor.equals("apProfile")){
					profileUser.profileImage = "u"+user.id+"/"+imageName
					profileUser.save(flush:true)
					render(contentType: 'text/json') {[
						'imageName': imageName,
						'userId':"u"+user.id
					]}
				}
				else{
					profileUser.profileImage = "u"+profileUser.id+"/"+imageName
					profileUser.save(flush:true)
					render(contentType: 'text/json') {[
						'imageName': imageName,
						'userId':"u"+profileUser.id
					]}
				}				
			}
			else{
				render "bad"
			}
		}
		else{
			render "bad"
		}
	}
	
}
