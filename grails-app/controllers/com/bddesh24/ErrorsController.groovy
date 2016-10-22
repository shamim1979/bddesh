package com.bddesh24

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU
import grails.util.Environment

@Secured(['permitAll'])
class ErrorsController {

	def index() {
		redirect(uri:"/")
		return
	}
	
	def serverError = {	
		if (Environment.current == Environment.PRODUCTION) {
			redirect(uri:"/")
			return
		}
		else{
			render(view:'error')			
		}
			
	}

	def notFound = {
		redirect(uri:"/newspapers",permanent: true)
		return
	}
}
