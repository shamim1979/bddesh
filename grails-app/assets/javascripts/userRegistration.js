var validUsername = false;
var validEmail = false;
var usernameZeroError='What\'s your name?';
var usernameLengthError='Please enter atleast 3 characters';
var usernameNotValidError='Only';
var usernameExistError='User name is already used';
var emailZeroError='Please enter email address';
var emailNotValidError='Please enter valid email address';
var emailExistError='E-mail address is already used';
var passwordZeroError='Please enter password';
var passwordLengthSixError='Please enter atleast six characters password';
var displayNameZeroError='Please enter user display name';
var titleZeroError='What\' your title';
var phoneZeroError='Please enter your phone number';
var phoneValidError='Please enter valid phone number';
var genderZeroError='Please enter gender';

function setValidUserEmail(){
	validUsername = false;
	validEmail = false;
}

function validateForm(){
	var valid = true;
	if(!validEmail){
		valid=false;
		$("#email").prop('title',emailZeroError);	
		$("#registerForm #email").tipsy('show');
		$('#email').focus();
		return valid;
	}	
	valid = validateText('#password');
	if(!valid){
		$('#password').focus();
		return valid;
	}	
	valid = validateText('#displayName');
	if(!valid){
		$('#displayName').focus();
		return valid;
	}
	valid = validateText('#title');
	if(!valid){
		$('#title').focus();
		return valid;
	}		
	return valid;
}

function clearTipsy(obj){
	$(obj).tipsy("hide");
}

function validateText(eleid){
	switch(eleid){	
		case '#username':
			var username=$("#username").val();
			username = username.trim();			
			var filter = /^[a-z0-9]+$/i;
			if(username.length==0){				
				$("#username").prop('title',usernameZeroError);	
				$("#registerForm #username").tipsy('show');
				return false;
			}
			else if(username.length<3){
				$("#username").prop('title',usernameLengthError);	
				$("#registerForm #username").tipsy("show");		
				return false;
			}
			else if(!filter.test(username)){
				$("#username").prop('title',usernameNotValidError);	
				$("#registerForm #username").tipsy("show");		
				return false;
			}			
			else{
				var bddeshUserUrl = rootDirectoy+"profile/validUsername";
				if(!validUsername){					
					$.ajax({
					 	type: "POST",		 	
						url: bddeshUserUrl,		
						dataType: "json",
						data: {security:"sha3i3",username:username},
						success: function(data) {
							if(data.status == "valid"){
								validUsername = true;
								$("#registerForm #username").tipsy("hide");
							}								
							else if(data.status == "exist"){
								validUsername = false;
								$("#username").prop('title',usernameExistError);	
								$("#registerForm #username").tipsy("show");
							}	
						},
						error: function () {
								            
				        }	
				  	});
				}
			}
			break;
		case '#email':
			var email=$("#email").val();
			email = email.trim();
			var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			if(email.length==0){
				$("#email").prop('title',emailZeroError);	
				$("#registerForm #email").tipsy('show');				
				return false;
			}
			else if(!filter.test(email)){
				$("#email").prop('title',emailNotValidError);	
				$("#registerForm #email").tipsy("show");		
				return false;
			}			
			else{
				var bddeshUserUrl = rootDirectoy+"profile/validEmail";
				if(!validEmail){					
					$.ajax({
					 	type: "POST",		 	
						url: bddeshUserUrl,		
						dataType: "json",
						data: {security:"sha3i3",email:email},
						success: function(data) {
							if(data.status == "valid"){
								validEmail = true;
								$("#registerForm #email").tipsy("hide");
							}								
							else if(data.status == "exist"){
								validEmail = false;
								$("#email").prop('title',emailExistError);	
								$("#registerForm #email").tipsy("show");
							}	
						},
						error: function () {
								            
				        }	
				  	});
				}
			}
			break;			
		case '#password':
			var password=$("#password").val();
			if(password.length==0){				
				$("#password").prop('title',passwordZeroError);	
				$("#registerForm #password").tipsy("show");			
				return false;
			}
			else if(password.length<6){
				$("#password").prop('title',passwordLengthSixError);	
				$("#registerForm #password").tipsy("show");		
				return false;
			}			
			else{
				$("#registerForm #password").tipsy("hide");
				return true;
			}
			break;
		case '#displayName':
			var displayName=$("#displayName").val();
			if(displayName.length==0){				
				$("#displayName").prop('title',displayNameZeroError);	
				$("#registerForm #displayName").tipsy("show");			
				return false;
			}		
			else{
				$("#registerForm #displayName").tipsy("hide");
				return true;
			}
			break;
		case '#title':
			var title=$("#title").val();
			title = title.trim();
			if(title.length==0){	
				$("#title").prop('title',titleZeroError);	
				$("#registerForm #title").tipsy("show");			
				return false;
			}
			else{
				$("#registerForm #title").tipsy("hide");
				return true;
			}
			break;
		case '#phone':
			var ckphone = /^([0-9-])+$/;
			var phone = $("#phone").val();
			phone = phone.trim();
			if(phone.length==0){	
				$("#phone").prop('title',phoneZeroError);	
				$("#registerForm #phone").tipsy("show");			
				return false;
			}
			else if(!ckphone.test(phone)){				
				$("#phone").prop('title',phoneValidError);	
				$("#registerForm #phone").tipsy("show");	
				return false;
			}
			else{
				$("#registerForm #phone").tipsy("hide");
				return true;
			}
			break;
	}
}

	
	
	
	