package com.bddesh24

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

class ProfileController {
	def springSecurityService
	def NewsService
	
    @Secured(['permitAll'])
	def index() {
		redirect(uri:"/")
		return
	}
	
	@Secured(['permitAll'])
	def of() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def profileOwner
		def profile
		def canChange = false
		try {
			profileOwner = User.get(Integer.parseInt(params.id))
		}
		catch(Exception e) {
		}		
		if(profileOwner){
			if((profileOwner == user) || (user && user.isAdmin))
				canChange = true
			profile = profileOwner.profile
			def newsArticles = NewsService.getUserNewsArticles(profileOwner,new Date())
			
			def metaData = [:]
			metaData.put("keyword", "bddesh24, news, bangladesh, bangladesh news, science, technology, sports, cricket, culture, lifestyle, education, entertainment, health, world, asia, europe, africa, usa, middle east, india, UK, south america, north america")
			metaData.put("title", "Bddesh24 | the leading social portal in Bangladesh")
			metaData.put("description", "Bddesh24 latest news, poll, top ten, question, ask, world newspapers and linkz")
			if(profile.coverImage)
				metaData.put("image", "http://www.bddesh24.com/newsImages/d690/"+profile.coverImage)
			else
				metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultArticle.jpg")
			metaData.put("url", "http://www.bddesh24.com/profile/of/"+profileOwner.id+"/"+profileOwner.username)
			[metaData:metaData,user:user,newsArticles:newsArticles,profileOwner:profileOwner,canChange:canChange,profile:profile,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]
		}
		else{
			redirect(uri:"/")
			return
		}
	}
	
	@Secured(['permitAll'])
	def validUsername() {
		def username = request.getParameter("username")
		def result
		User userFound = User.findByUsername(username)
		if(userFound)
			result = [status: "exist"]
		else
			result = [status: "valid"]
		render result as JSON
	}
	
	@Secured(['permitAll'])
	def validEmail() {
		def email = request.getParameter("email")
		def result
		User userFound = User.findByEmail(email)
		if(userFound)
			result = [status: "exist"]
		else
			result = [status: "valid"]
		render result as JSON
	}
	
	@Secured(['permitAll'])
	def accountCreate(){
		def username = params.username
		def email = params.email
		def userFound = User.executeQuery("from User as U where U.username=:username or U.email=:email",[username:username,email:email])
		if(userFound){
			redirect(uri:"/")
			return
		}
		withForm{
			def password = params.password
			def title = params.title
			def displayName = params.displayName
			def phone = params.phone
			def sex = params.sex
			def gender = false
			if(sex.equals("2"))
				gender = true
			User user
			User newUser = new User(username:username,password:password,email:email,displayName:displayName,enabled:true,gender:gender)
			if(newUser.save(flush:true)){
				UserRole.create newUser, Role.findByAuthority('ROLE_USER'), true
				def newUserFound = User.executeQuery("from User as U where U.username=:username",[username:username])
				user = newUserFound[0]
				def profile = user.profile
				profile.title = title
				profile.phone = phone
				profile.save(flush:true)
				springSecurityService.reauthenticate(user.username,user.password)
				redirect(uri:"/")
			}
			else{
				redirect(uri:"/")
			}
		}.invalidToken{
			redirect(uri:"/")
		}
	}
	
}
