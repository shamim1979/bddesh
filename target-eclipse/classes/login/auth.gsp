<html>
	<head>
		<meta name='layout' content='authWeb'/>
		<script type="text/javascript">
			$(function(){
				$('#registerForm [title]').tipsy({trigger: 'manual', gravity: 's'});
			});
		</script>
	</head>
	<body>
		<g:render template="/login/authHeader" model="[]"></g:render>
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-6 col-lg-6 cbpd">
					<div class="lgbxhl brd3">
						<div class="lgH text-center">
							Login
						</div>
						<div class="cbx">
							<div class="row">
								<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>	
									<div class="col-sm-6 col-md-4 col-lg-4 cbpd">
										<div class="lblip">
											<g:message code="springSecurity.login.username.label"/>:
										</div>
									</div>
									<div class="col-sm-6 col-md-8 col-lg-8 cbpd">
										<div class="mt10">
											<input autocomplete="off" type='text' class='form-control cusTxt' name='j_username' id='j_username' placeholder="<g:message code="springSecurity.login.username.label"/>" title="<g:message code="springSecurity.login.username.label"/>" />
										</div>
									</div>
									<div class="col-sm-6 col-md-4 col-lg-4 cbpd">
										<div class="lblip">
											<g:message code="springSecurity.login.password.label"/>:
										</div>
									</div>
									<div class="col-sm-6 col-md-8 col-lg-8 cbpd">
										<div class="mt10">
											<input autocomplete="off" type='password' class='form-control cusTxt' name='j_password' id='j_password' placeholder="<g:message code="springSecurity.login.password.label"/>" title="<g:message code="springSecurity.login.password.label"/>"/>
										</div>
									</div>
									<div style="clear: both;"></div>								
									<div class="mt20">
										<div class="col-sm-6 col-md-4 col-lg-4 cbpd">
											<div id="remember_me_holder" class="rlbl">													
												<label class="lbllog" for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
												<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
											</div>
										</div>
										<div class="col-sm-6 col-md-8 col-lg-8 cbpd">
											<input class="conbor sbbtn lgbtn" type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
										</div>
									</div>
								</form>
								<div style="clear: both;"></div>
								<div class="mtb10">
									<div class="lgor lgcen mtb10">
										or 
									</div>
									<div class="fbLogBtn lgcen mt20">
										<facebookAuth:connect /> 
									</div>
									<div class="fbLogBtn lgcen mt20">
										<twitterAuth:button />
									</div>							
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-6 col-lg-6 cbpd">
					<div class="lgbxhr brd3">
						<div class="lgH text-center">
							Registration
						</div>
						<div class="cbx">
							<div class="row">
								<g:form onsubmit="return validateForm()" useToken="true" name="registerForm" url="[action:'accountCreate',controller:'profile']">
									<div class="col-sm-6 col-md-4 col-lg-4 cbpd">
										<div class="lblip">
											<g:message code="userName"/>:
										</div>
									</div>
									<div class="col-sm-6 col-md-8 col-lg-8 cbpd">
										<div class="mt10">
											<input autocomplete="off" name="username" id="username" onfocus="javascript:setValidUserEmail()" onblur="javascript:validateText('#username')" type="text" class="form-control" placeholder="<g:message code="userName"/>" title="<g:message code="userName"/>">
										</div>
									</div>
									<div class="col-sm-6 col-md-4 col-lg-4 cbpd">
										<div class="lblip">
											<g:message code="email"/>:
										</div>
									</div>
									<div class="col-sm-6 col-md-8 col-lg-8 cbpd">
										<div class="mt10">
											<input autocomplete="off" name="email" id="email" onfocus="javascript:setValidUserEmail()" onblur="javascript:validateText('#email')" type="text" class="form-control" placeholder="<g:message code="email"/>" title="<g:message code="email"/>">
										</div>
									</div>
									<div class="col-sm-6 col-md-4 col-lg-4 cbpd">
										<div class="lblip">
											<g:message code="password"/>:
										</div>
									</div>
									<div class="col-sm-6 col-md-8 col-lg-8 cbpd">
										<div class="mt10">
											<input autocomplete="off" name="password" id="password" onblur="javascript:validateText('#password')" type="password" class="form-control" placeholder="<g:message code="password"/>" title="<g:message code="password"/>">
										</div>
									</div>
									<div class="col-sm-6 col-md-4 col-lg-4 cbpd">
										<div class="lblip">
											<g:message code="displayName"/>:
										</div>
									</div>
									<div class="col-sm-6 col-md-8 col-lg-8 cbpd">
										<div class="mt10">
											<input autocomplete="off" name="displayName" id="displayName" onblur="javascript:validateText('#displayName')" type="text" class="form-control" placeholder="<g:message code="displayName"/>" title="<g:message code="displayName"/>">
										</div>
									</div>									
									<div class="col-sm-6 col-md-4 col-lg-4 cbpd">
										<div class="lblip mbnd">
											&nbsp;
										</div>
									</div>
									<div class="col-sm-6 col-md-8 col-lg-8 cbpd">
										<div class="mt10">
											<label class="radio-inline"><input autocomplete="off" id="male" type="radio" value="1" name="sex" checked="checked"><g:message code="male"/></label>
											<label class="radio-inline"><input autocomplete="off" id="female" type="radio" value="2" name="sex"><g:message code="female"/></label>
											<span id="genderTypeError" title="Please select user type"></span>
										</div>
									</div>
									<div style="clear: both;"></div>								
									<div class="mt10">
										<div class="col-sm-6 col-md-4 col-lg-4 cbpd">
											<div class="lblip mbnd">
												&nbsp;
											</div>
										</div>
										<div class="col-sm-6 col-md-8 col-lg-8 cbpd">
											<input class="conbor sbbtn lgbtn" type='submit' id="regSubmit" value='${message(code: "createUser")}'/>
										</div>
									</div>
								</g:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<g:render template="/login/authFooter" model="[]"></g:render>
	</body>
</html>
