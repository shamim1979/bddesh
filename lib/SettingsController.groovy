package com.beshto

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

import grails.plugins.springsecurity.Secured
import groovy.sql.Sql
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import org.imgscalr.Scalr
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import java.io.File;
import java.util.Iterator;
import javax.imageio.*;
import javax.imageio.stream.*;

import com.sun.org.apache.xpath.internal.operations.String;
import com.sun.xml.internal.ws.encoding.ContentType;

import grails.converters.*


class SettingsController {
	static defaultAction = 'index'
	def CustomDateService
	def ImageService
	def TrimService
	User user = getAuthenticatedUser()

	def dataSource

	@Secured(['ROLE_USER'])
	def indexother = {
		if(params.submitted == 'update'){
			user.displayName = params.user.displayName.trim()
			user.title = params.user.title.trim()
			user.expartise = params.user.expartise
			user.email = params.user.email

			if(user.validate()){
				user.save()
				flash.message = 'সফলভাবে আপডেট করা হয়াছে!'
				flash.type = 'success'
				redirect(uri:"/settings/index")
			}
		}
		[user: user]
	}
	
	@Secured(['ROLE_USER'])
	def index = {
		if(params.submitted == 'updateDisName'){					
			def ddisplayName = params.user.displayName.trim()
			user.displayName = TrimService.stripHTMLTags(ddisplayName)
			//user.displayName = ddisplayName
			if(user.save()){				
				flash.message = 'সফলভাবে আপডেট করা হয়াছে!'
				flash.type = 'success'
				redirect(uri:"/settings/index")
			}
			else{
				flash.message = 'আপডেট হয়নি, আবার চেষ্টা কর ! '
				flash.type = 'error'
				redirect(uri:"/settings/index")
			}
		}		
		if(params.submitted == 'updateDisTitle'){			
			def dtitleName = params.user.title.trim()
			user.title = TrimService.stripHTMLTags(dtitleName)
			if(user.save()){				
				flash.message = 'সফলভাবে আপডেট করা হয়াছে!'
				flash.type = 'success'
				redirect(uri:"/settings/index")
			}
			else{
				flash.message = 'আপডেট হয়নি, আবার চেষ্টা কর ! '
				flash.type = 'error'
				redirect(uri:"/settings/index")
			}			
		}
		if(params.submitted == 'updateDisEmail'){			
			def demailName = params.user.email.trim()
			user.email = demailName
			user.profile.varificationCode = null
			user.profile.emailStatus=false
			user.profile.save()
			if(user.save()){				
				flash.message = 'সফলভাবে আপডেট করা হয়াছে!'
				flash.type = 'success'
				redirect(uri:"/settings/index")
			}
			else{
				flash.message = 'আপডেট হয়নি, আবার চেষ্টা কর ! '
				flash.type = 'error'
				redirect(uri:"/settings/index")
			}
		}
		if(params.submitted == 'updateDisPass'){
			def oldpass = params.oldpassword.trim()
			def newpass = params.password.trim()
			def conpass = params.againpassword.trim()
			def correctPassword=user.checkPassword(oldpass)			
			if(correctPassword && newpass==conpass){
				user.password = conpass
				if(user.save()){					
					flash.message = 'সফলভাবে আপডেট করা হয়াছে!'
					flash.type = 'success'
					redirect(uri:"/settings/index")
				}
				else{
					flash.message = 'আপডেট হয়নি, আবার চেষ্টা কর ! '
					flash.type = 'error'
					redirect(uri:"/settings/index")
				}				
			}
			else{
				flash.message = 'আপডেট হয়নি, আবার চেষ্টা কর ! '
				flash.type = 'error'
				redirect(uri:"/settings/index")
			}
			
		}
		[user: user]
	}
	
	@Secured(['ROLE_USER'])
	def avatar = {
		def avatarDatabase
		def beshtoAvatar
		def avatarList
		
		Random randValue = new Random()
		def randNumber = randValue.nextInt(999999).toString();
		
		if(params.id == "beshtoPic"){
			def authority = User.findByUsername("admin") 
			beshtoAvatar = UploadAvatar.findAllByAvatarOwnerAndActive(authority,1,[sort:"dateCreated", order:"desc"])
		}
		else if(params.id == "selectedPic"){
			avatarList = UploadAvatar.findAllByAvatarOwnerAndActive(user,2,[sort:"dateCreated", order:"desc"])
		}		
		else if(params.id == "beshtoIcon")
			avatarDatabase = Avatar.findAllByStatusAndAvatarType("show","icon",[sort:"id",order:"DESC"])
		else
			avatarList = UploadAvatar.findAllByAvatarOwnerAndActive(user,1,[sort:"dateCreated", order:"desc"])
			
		def avatarListShow = UploadAvatar.findAllByAvatarOwnerAndActive(user,1,[sort:"dateCreated", order:"desc"])
		
		def avatarListSize=avatarListShow.size()
		def ImageShow=false		
		if(avatarListSize<=5)
			ImageShow=true
			
		[user: user, avatarList: avatarList,avatarDatabase:avatarDatabase,beshtoAvatar:beshtoAvatar,randNumber:randNumber,ImageShow:ImageShow]
	}
	
	def getInt(str) {
		def intVal = false
		try {
			//Double.parseDouble(str);
			intVal = (int) Double.parseDouble(str)
			
		} catch (NumberFormatException e) {
			intVal = Integer.parseInt(str)
			
		}
		return intVal;
	}

	def avatar2 = {	
		if(params.x1 && params.y1 && params.w ){
			def http
			if(GrailsUtil.isDevelopmentEnv()){
				http = new HTTPBuilder("http://localhost/imageWebService/profileImageSave.php")				
			}
			else{
				http = new HTTPBuilder("http://www.beshto.com:8080/ws/iws/profileImageSave.php")
			}
			http.request(Method.POST) { req ->
				requestContentType: "multipart/form-data"
				MultipartEntity multiPartContent = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE)				 
				def imageName = session.imageName
				multiPartContent.addPart("imageName", new StringBody(imageName))				
				multiPartContent.addPart("X", new StringBody(params.x1))				
				multiPartContent.addPart("Y", new StringBody(params.y1))
				multiPartContent.addPart("width", new StringBody(params.w))
				def userId="u"+user.id
				multiPartContent.addPart("userId", new StringBody(userId))
				req.setEntity(multiPartContent)
				 
				response.success = { resp,json ->
					if(resp.statusLine.statusCode == 200) {
						session.imageName = null
						def real = JSON.parse(json.toString());
						if(real.success.equals("done")){							
							def avatarUrl = imageName							 
							def avatarName = "Image Description"							
							UploadAvatar upAvatar = new UploadAvatar(avatarName: avatarName, avatarUrl: avatarUrl, avatarOwner: user)
							if(upAvatar.save())
								flash.message = 'success'
							user.profilePicture = imageName
							user.proPicVersion += 1
							if(user.save())
								flash.message = 'success'						 				 
							redirect(uri:"/settings/avatar")
							
						}
						else if(real.success.equals("imageTypeFailed")){
							redirect(uri:"/settings/avatar")
						}						 
					}					 
				}
			}
		}
		else if(session.imageName){
			[user:user,imageName:session.imageName]
		}
		else {
			flash.message = 'error'
			redirect(uri:"/settings/avatar")
		}
	}

	@Secured(['ROLE_USER'])
	def upload = {		
		def imageName
		def uploadSuccess=false
		MultipartHttpServletRequest mpr
		CommonsMultipartFile upFile
		if(request instanceof MultipartHttpServletRequest)	{
			mpr = (MultipartHttpServletRequest)request;
			upFile = (CommonsMultipartFile) mpr.getFile("myFile");
			if(!upFile.empty){
				def fileSize=upFile.getSize()				
				if(fileSize>1593180){
					redirect(uri:"/settings/avatar")
				}
				else{
					def http
					if(GrailsUtil.isDevelopmentEnv()){												
						http = new HTTPBuilder("http://localhost/imageWebService/profileImage.php")						
					}
					else{
						http = new HTTPBuilder("http://www.beshto.com:8080/ws/iws/profileImage.php")
					}
					http.request(Method.POST) { req ->
						requestContentType: "multipart/form-data"
						MultipartEntity multiPartContent = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE)
						multiPartContent.addPart("myPicture", new InputStreamBody(upFile.inputStream, upFile.contentType, upFile.originalFilename))
						def userId="u"+user.id
						multiPartContent.addPart("userId", new StringBody(userId))
						multiPartContent.addPart("ImageType", new StringBody(upFile.contentType))
						req.setEntity(multiPartContent)
						
						response.success = { resp,json ->
							if(resp.statusLine.statusCode == 200) {
								def real = JSON.parse(json.toString());
								if(real.success.equals("done")){									 									 	
									session.imageName = real.imageName									 
									redirect(uri:"/settings/avatar2")
								}
								else if(real.success.equals("imageTypeFailed")){
									redirect(uri:"/settings/avatar")
								}
								 
							}
							else{
								redirect(uri:"/settings/avatar")
							}
						}
					}
				}
				
			}
			
		}
				
		
	}
	
	@Secured(['ROLE_USER'])
	def photoUpload = {
		def uploadSuccess=false
		def fileSizeLimitExceed=false
		def imageTypeNotMached=false
		def imageName
		MultipartHttpServletRequest mpr
		CommonsMultipartFile upFile
		def imgageFrom =params.id
		def postFrom="post"	
		
		if(request instanceof MultipartHttpServletRequest)	{
			mpr = (MultipartHttpServletRequest)request;			
			if(imgageFrom){				
				if(imgageFrom=="picture"){					
					upFile = (CommonsMultipartFile) mpr.getFile("myFileImage[]");
					postFrom="multiimage"
				}
				if(imgageFrom=="witness"){
					upFile = (CommonsMultipartFile) mpr.getFile("myFileImageDuniti[]");
					postFrom="witness"
				}
				if(imgageFrom=="jokes"){
					upFile = (CommonsMultipartFile) mpr.getFile("myFileImageJokes[]");
					postFrom="jokes"
				}
				if(imgageFrom=="shopping"){
					upFile = (CommonsMultipartFile) mpr.getFile("myFileImageshopping[]");
					postFrom="shopping"
				}
				if(imgageFrom=="gurupost"){
					upFile = (CommonsMultipartFile) mpr.getFile("myFileImagePost[]");
					postFrom="gurupost"
				}
			}
			else{			
				upFile = (CommonsMultipartFile) mpr.getFile("myFile");
			}
			if(!upFile.empty){								
				def fileSize=upFile.getSize()
				if(fileSize>1593180){
					fileSizeLimitExceed=true
					uploadSuccess=false
				}
				else{
					def http
					def uri
					def domainName
					try{
						uri = new java.net.URI(request.getHeader("referer"))
						domainName = uri.getHost()
						if(domainName == "localhost")
						 domainName = "http://"+domainName+"/guruActivityImageMobile.php"
						else
						domainName = "http://"+domainName+":8080/ws/iws/guruActivityImageMobile.php"
						
					}catch(Exception e){
					 println "uri detection problem: "+ e
					}
					if(GrailsUtil.isDevelopmentEnv()){	
						http = new HTTPBuilder(domainName)
						//http = new HTTPBuilder("http://localhost/guruActivityImageMobile.php")
					}
					else{		
						http = new HTTPBuilder(domainName)
						//http = new HTTPBuilder("http://www.beshto.com:8080/ws/iws/guruActivityImageMobile.php")
					}
					
					http.request(Method.POST) { req ->						
						 requestContentType: "multipart/form-data"
						 MultipartEntity multiPartContent = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE)
						 multiPartContent.addPart("myPicture", new InputStreamBody(upFile.inputStream, upFile.contentType, upFile.originalFilename))
						 def userId="u"+user.id
						 multiPartContent.addPart("userId", new StringBody(userId))						 
						 multiPartContent.addPart("ImageType", new StringBody(upFile.contentType))
						 
						 req.setEntity(multiPartContent)
						 
						 response.success = { resp,json ->
							 if (resp.statusLine.statusCode == 200) {
								 def real = JSON.parse(json.toString());
								 //println real
								 if(real.success.equals("done")){
									 uploadSuccess=true
									 imageName=real.imageName
								 }
								 else if(real.success.equals("imageTypeFailed")){
									 imageTypeNotMached=true
								 }								 
							 }
						 }
					 }
				}
								
				
				[user:user,imageName:imageName,uploadSuccess:uploadSuccess,fileSizeLimitExceed:fileSizeLimitExceed,imageTypeNotMached:imageTypeNotMached,postFrom:postFrom]
				
			}
			
		}
	}

	@Secured(['ROLE_USER'])
	def multiPhotoUpload = {
		def image=request.getParameter('image')
		def imageType=request.getParameter('fileType')
		if(imageType=='png')
			imageType='jpg'
		def imageName
		def uploadSuccess=false
		
		def http
		def uri
		def domainName
		try{
			uri = new java.net.URI(request.getHeader("referer"))
			domainName = uri.getHost()
			if(domainName == "localhost")
			 domainName = "http://"+domainName+"/guruActivityMultiImageMobile.php"
			else	
			domainName = "http://"+domainName+":8080/ws/iws/guruActivityMultiImageMobile.php"
			
		}catch(Exception e){
		 println "uri detection problem: "+ e
		}
		
		if(GrailsUtil.isDevelopmentEnv()){
			println domainName
			http = new HTTPBuilder(domainName)
			//http = new HTTPBuilder("http://localhost/guruActivityMultiImageMobile.php")
			//http = new HTTPBuilder("http://www.beshto.com:8080/ws/iws/guruActivityMultiImageMobile.php")
			//http = new HTTPBuilder("http://ec2-107-22-114-19.compute-1.amazonaws.com:8080/ws/iws/guruActivityMultiImageMobile.php")
		}
		else{			
			http = new HTTPBuilder(domainName)
			//http = new HTTPBuilder("http://www.beshto.com:8080/ws/iws/guruActivityMultiImageMobile.php")
			//http = new HTTPBuilder("http://ec2-107-22-114-19.compute-1.amazonaws.com:8080/ws/iws/guruActivityMultiImageMobile.php")
		}
		
		http.request(Method.POST) { req ->
			 requestContentType: "multipart/form-data"
			 MultipartEntity multiPartContent = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE)
			 multiPartContent.addPart("myPicture", new StringBody(image))
			 def userId="u"+user.id
			 multiPartContent.addPart("userId", new StringBody(userId))			 
			 multiPartContent.addPart("ImageType", new StringBody(imageType))
			 req.setEntity(multiPartContent)
			 
			 response.success = { resp,json ->
				 if (resp.statusLine.statusCode == 200) {					 
					 def real = JSON.parse(json.toString());					  
					 if(real.success.equals("done")){
						 uploadSuccess=true
						 imageName=real.imageName
					 }
					 else if(real.success.equals("imageTypeFailed")){
						 //imageTypeNotMached=true
					 }					 
				 }
			 }
		 }
		
		if(uploadSuccess)
			render imageName
		else
			render "bad"
		
		
		
		
	}
	@Secured(['ROLE_USER'])
	def getUrlDetails = {
		def urlText=request.getParameter('urlText')	
		if(urlText.indexOf("http://") < 0)
			urlText = "http://"+urlText
		def http
		def uploadSuccess=false
		
		def uri
		def domainName
		try{
			uri = new java.net.URI(request.getHeader("referer"))
			domainName = uri.getHost()
			if(domainName == "localhost")
			 domainName = "http://"+domainName+"/htmlParser.php"
			else
			domainName = "http://"+domainName+":8080/ws/pws/htmlParser.php"
			
		}catch(Exception e){
		 println "uri detection problem: "+ e
		}
		
		if(GrailsUtil.isDevelopmentEnv()){
			println domainName
			http = new HTTPBuilder(domainName)
			//http = new HTTPBuilder("http://localhost/htmlParser.php")
			//http = new HTTPBuilder("http://www.beshto.com:8080/ws/pws/htmlParser.php")
		}
		else{
			http = new HTTPBuilder(domainName)
			//http = new HTTPBuilder("http://www.beshto.com:8080/ws/pws/htmlParser.php")
		}
		
		def URLTitle
		def urlDescription
		def imageName
		def userId="u"+user.id
		try{
			http.request(Method.POST) { req ->
				requestContentType: "multipart/form-data"
				MultipartEntity multiPartContent = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE)
				multiPartContent.addPart("urlText", new StringBody(urlText))				
				multiPartContent.addPart("userId", new StringBody(userId))
				req.setEntity(multiPartContent)
				
				response.success = { resp,json ->
					if (resp.statusLine.statusCode == 200) {
						def real = JSON.parse(json.toString());						 						 
						if(real.success.equals("done")){
							uploadSuccess=true
							URLTitle=real.urlTitle
							urlDescription=real.urlDescription
							imageName=real.imageName							 
						}
						else if(real.success.equals("imageTypeFailed")){
							//imageTypeNotMached=true
						}
					}
				}
			}
			
			if(uploadSuccess)
				render(contentType: 'text/json') {[
					'URLTitle': URLTitle,'urlDescription':urlDescription,'imageName':imageName,'userid':userId
				]}
			else
				render "bad"
		}catch(Exception e)	{
		 
		}
			
	}
	
	
	@Secured(['ROLE_USER'])
	def starpic = {
		def uploadSuccess=false
		def imageName
		def upFile = request.getFile("myFile")
		def okcontents = ['image/jpeg']
		if(okcontents.contains(upFile.contentType)){
			if(!upFile.empty) {								
				try{
					InputStream inn = new ByteArrayInputStream(upFile.getBytes());
					BufferedImage bImageFromConvert = ImageIO.read(inn);
					int type = bImageFromConvert.getType()
					imageName = "StarPicture.jpg"
					def imgLocation="images"
					def webRootDir = servletContext.getRealPath("/")
					def OUTPUTFILE = "${webRootDir}/images/${imageName}"
					ImageService.pictureUpload(bImageFromConvert,OUTPUTFILE,300,false)					
					uploadSuccess=true
				}
				catch(Exception  e){
					uploadSuccess=false
				}
			}
		}
		[user:user,imageName:imageName,uploadSuccess:uploadSuccess]
	}
		
		
	def resizeImage(originalImage, type,height,weight){
		BufferedImage resizedImg = Scalr.resize(originalImage, height);			

		
		//BufferedImage croppedImg = Scalr.crop(originalImage,100,100,500,500)
		//BufferedImage resizedImg = Scalr.resize(croppedImg, height);
		
		return resizedImg;
	}
	
	def starPicCreate(originalImage,imageName,width){
		def webRootDir = servletContext.getRealPath("/")
		def OUTPUTFILE = "${webRootDir}/images/${imageName}"
		
		def originalWidth =  originalImage.getWidth()
		def originalHeight =  originalImage.getHeight()
				
		BufferedImage resizedImg = Scalr.resize(originalImage, originalWidth,originalHeight);
		
		Iterator iter = ImageIO.getImageWritersByFormatName("jpeg");
		ImageWriter writer = (ImageWriter)iter.next();
		ImageWriteParam iwp = writer.getDefaultWriteParam();
		iwp.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
		iwp.setCompressionQuality(1);  // an integer between 0 and 1	// 1 specifies minimum compression and maximum quality
		
		
		File file = new File(OUTPUTFILE);
		FileImageOutputStream output = new FileImageOutputStream(file);
		writer.setOutput(output);
		IIOImage image = new IIOImage(resizedImg, null, null);
		writer.write(null, image, iwp);
		writer.dispose();
		return true;
	}
	
	
	
	
	def chobiCreate(originalImage,imageName,width){
		def webRootDir = servletContext.getRealPath("/")

		//def lowerCaseUser = user.username.toLowerCase()	// important line
		def lowerCaseUser = "u"+user.id	// important line
		
		def userDir = new File(webRootDir, "/beshtoImages/photoShare/d${width}/${lowerCaseUser}")
		if(!userDir.exists())	userDir.mkdirs()
		
		def OUTPUTFILE = "${webRootDir}/beshtoImages/photoShare/d${width}/${lowerCaseUser}/${imageName}"
		
		def originalWidth =  originalImage.getWidth()			
		def originalHeight =  originalImage.getHeight()
		def oH
		def oW
		if(originalWidth>=width || originalHeight>=width){
			if(originalWidth>originalHeight){
				oW=(int)(originalWidth/originalWidth)*width
				oH=(int)(originalHeight/originalWidth)*width
			}
			else{
				oW=(int)(originalWidth/originalHeight)*width
				oH=(int)(originalHeight/originalHeight)*width
			}
		}
		else{
			oW=originalWidth
			oH=originalWidth
		}
		
		BufferedImage resizedImg = Scalr.resize(originalImage, oW,oH);
		
		Iterator iter = ImageIO.getImageWritersByFormatName("jpeg");
		ImageWriter writer = (ImageWriter)iter.next();
		ImageWriteParam iwp = writer.getDefaultWriteParam();
		iwp.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
		iwp.setCompressionQuality(1);  // an integer between 0 and 1	// 1 specifies minimum compression and maximum quality
		
		
		File file = new File(OUTPUTFILE);
		FileImageOutputStream output = new FileImageOutputStream(file);
		writer.setOutput(output);
		IIOImage image = new IIOImage(resizedImg, null, null);
		writer.write(null, image, iwp);
		writer.dispose();
		return true;
	}
	
	def CreateImage(originalImage,imageName,width){
		def webRootDir = servletContext.getRealPath("/")		

		//def lowerCaseUser = user.username.toLowerCase()	// important line
		def lowerCaseUser = "u"+user.id	// important line
		
		def userDir = new File(webRootDir, "/beshtoImages/d${width}/${lowerCaseUser}")		
		if(!userDir.exists())	userDir.mkdirs()
		
		def OUTPUTFILE = "${webRootDir}/beshtoImages/d${width}/${lowerCaseUser}/${imageName}"
		
		def originalWidth =  originalImage.getWidth()
			if( originalWidth < width & width == 600 ) width = originalWidth
		
		BufferedImage resizedImg = Scalr.resize(originalImage, width);
		
		Iterator iter = ImageIO.getImageWritersByFormatName("jpeg");
		ImageWriter writer = (ImageWriter)iter.next();
		ImageWriteParam iwp = writer.getDefaultWriteParam();
		iwp.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
		iwp.setCompressionQuality(1);  // an integer between 0 and 1	// 1 specifies minimum compression and maximum quality
		
		
		File file = new File(OUTPUTFILE);
		FileImageOutputStream output = new FileImageOutputStream(file);
		writer.setOutput(output);
		IIOImage image = new IIOImage(resizedImg, null, null);
		writer.write(null, image, iwp);
		writer.dispose();
		return true;
	}
	
	

	def profileImage = {
		def imageName = request.getParameter('imageName')
		def imageId = request.getParameter('imageId')		
		if(request.getParameter('id') == "delete"){			
			redirect(uri:"/settings/deleteImage?imageName=${imageName}&imageId=${imageId}")
		}
		else{	
			try{
				user.profilePicture = imageName
				user.proPicVersion += 1
				if(user.save()){
					flash.message = 'success'
				}
				else flash.message = 'error'
			}catch(Exception e){
				println "Error: saving profilePicture,proPicVersion (profileImage); user: " + user.username
			}
			redirect(uri:"/settings/avatar")
		}
	}
	def selectImage = {
		def imageName = request.getParameter('imageName')		
		if(imageName){
			def isExist = UploadAvatar.findByAvatarOwnerAndAvatarUrl(user,imageName)
			if(isExist == null){
				try {
					def webRootDir = servletContext.getRealPath("/")
					def openFile = new File(webRootDir, "/beshtoImages/d600/u1/${imageName}")	// this is a very important line
					def originalImage = ImageIO.read(openFile);
					
					CreateImage(originalImage,imageName,30)
					CreateImage(originalImage,imageName,50)
					CreateImage(originalImage,imageName,80)
					CreateImage(originalImage,imageName,120)
					CreateImage(originalImage,imageName,250)
					CreateImage(originalImage,imageName,600)
					
					def avatarUrl = imageName
					def avatarName = "Image Description"				
					UploadAvatar upAvatar = new UploadAvatar(avatarName: avatarName, avatarUrl: avatarUrl, avatarOwner: user,active:2)
					if(upAvatar.save())	flash.message = 'success'
				}
				
				catch(Exception  e){					
					println "selecting image exception"
					//render "problem"
				}
			}
			else{
				isExist.active = 2
				isExist.save()
				//flash.message = 'You already Selected this images'
			}
			try{
				user.profilePicture = imageName
				user.proPicVersion += 1
				if(user.save()){
					flash.message = 'success'
				}
				else flash.message = 'error'
			}catch(Exception e){
				println "Error: saving profilePicture,proPicVersion (selectImage); user: " + user.username
			}
			redirect(uri:"/settings/avatar/selectedPic")
		}
		
	}
	def profileImageDatabase = {
		def avatar = Avatar.get(params.id)
		
		if(user.profile.savedAvatars.contains(avatar)) {
			user.profile.photo = avatar
		} else if(user.profile.coin < avatar.price) {
			flash.message = 'যথেষ্ট  কড়ি নেই! রিচার্জ করতে পার অথবা অন্য কোনটা নিতে পার'
			flash.type = 'error'
			redirect uri:'/avatarShop/index'
			return
		} else {
			user.profile.photo = avatar
			if(avatar.price) {
				user.profile.addToSavedAvatars(avatar)
				coinService.reduceCoin(user, avatar.price, "(- ${avatar.price}) # Started using avatar: avatar.id")
			}
		}
		
		if(user.profile.save(failOnError: true, flush:true)) {
			user.profilePicture = ""
			//user.proPicVersion += 1
			user.save()
			
			flash.message = 'তোমার চেহারা বদলে গেছে!'
			flash.type = 'success'
			redirect(uri:"/settings/avatar")
		} else {
			flash.message = 'কোথাও একটা ভুল হয়ে গেছে! চেহারা বদলায়নি.'
			flash.type = 'error'
			redirect uri:'/settings/avatar'
		}
		
	}

	def deleteImage = {
		try{
			def imageName = request.getParameter('imageName')
			def imageId = request.getParameter('imageId')
	
			def deleteItem = UploadAvatar.get(Integer.parseInt(imageId))
			deleteItem.active = 0
	
			if(deleteItem.save()){
				flash.message = 'success'
				redirect(uri:"/settings/avatar")
				}
		}catch(Exception e){
		   render "Invalid Request" + " ("+user+")"
			}
	}

	def makeUrl = {
		def imageSize = request.getParameter('imgSize')
		def imageName = params.id

		if(imageName != null || imageSize !=null){
			def imgLocation
			if(imageSize.equals("large")){
				imgLocation = "/payload/180X180/"+user.username+"/"+imageName
			}else if(imageSize.equals("mediam")){
				imgLocation = "/payload/100X100/"+user.username+"/"+imageName
			}else{
				imgLocation = "/payload/50X50/"+user.username+"/"+imageName
			}
			redirect uri: imgLocation
		} else {
			redirect uri:'/images/avatars/default.jpg'
		}
	}

	def recharge = {
		if(params.submitted == 'recharge'){
			if(params?.code){
				def rechargeCode = RechargeCode.findByCode(params.code)
				if(rechargeCode){
					def earned = rechargeCode.value
					user.profile.coin += earned
					user.profile.save()
					rechargeCode.delete()

					flash.message = 'সফলভাবে আপডেট করা হয়াছে!'
					flash.type = 'success'

					// @TODO : keep recharge log

					//redirect(uri: "/recharge/success/" + earned)
				} else {
					flash.message = 'কার্ড কোডটি ভুল অথবা মেয়াদোত্তীর্ণ, সঠিক নম্বর দিয়ে আবার চেষ্টা করো'
					flash.type = 'error'
				}
				redirect(uri:"/settings/recharge")
			}
		}
		[user: user]
	}

}
