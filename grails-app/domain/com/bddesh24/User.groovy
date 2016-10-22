package com.bddesh24

class User {
	transient springSecurityService
	String username
	String password
	String email
	String displayName
	String profileImage
	
	UserProfile profile
	
	boolean enabled = true
	boolean gender = false
	boolean isAdmin = false
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false

	static transients = ['springSecurityService']
		
	static constraints = {
		username blank:false, unique:true
		email nullable:true
		password blank:false
		displayName nullable:true
		profileImage nullable:true
		profile nullable:true
	}
	
	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role }
	}
	
	def beforeInsert() {
		if(!displayName){
			def name = username
			displayName = name.replaceAll("facebook", "FB")			
		}
		encodePassword()
		profile = new UserProfile().save()
	}
	
	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
}
