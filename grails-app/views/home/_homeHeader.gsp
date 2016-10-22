<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
        <div class="navbar-header">
			<button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
            	<span class="sr-only">Toggle navigation</span>
            	<span class="icon-bar"></span>
            	<span class="icon-bar"></span>
            	<span class="icon-bar"></span>
          	</button>
          	<a class="navbar-brand" href="<g:createLink uri="/"/>"><img src="<g:createLink uri="/images/bddeshdefault/defaultLogo.png"/>" class="resimg"></a>
        </div>
       	<div class="navbar-collapse collapse" id="navbar">
         	<ul class="nav navbar-nav">
           		<li class="<g:if test="${isNewsActive}">active</g:if>"><a href="<g:createLink uri="/news"/>" class="">News</a></li>
           		<li class="<g:if test="${isTopTenActive}">active</g:if>"><a href="<g:createLink uri="/topTenz"/>" class="">TopTenz</a></li>
           		<li class="<g:if test="${isPollActive}">active</g:if>"><a href="<g:createLink uri="/pollz"/>" class="">Poll</a></li>
           		<li class="<g:if test="${isQuestionActive}">active</g:if>"><a href="<g:createLink uri="/ask"/>" class="">Ask</a></li>
           		<li class="<g:if test="${isQuoteActive}">active</g:if>"><a href="<g:createLink uri="/quoteDay"/>" class="">Quote</a></li>
           		<li class="<g:if test="${isLinkActive}">active</g:if>"><a href="<g:createLink uri="/newspapers"/>" class="">Newspapers</a></li>
       		</ul>
       		<ul class="nav navbar-nav navbar-right">
         		<li class="dropdown">
	          		<a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
	          			<g:if test="${user}">
          					<g:if test="${user.profileImage}"><img src="<g:createLink uri="/newsImages/d50/${user.profileImage}"/>" class="s30 s18 rndImg"></g:if>
		          			<g:else><g:if test="${user.gender}"><img src="<g:createLink uri="/images/bddeshdefault/femaleProfileSmall.jpeg"/>" class="s30 s18 rndImg"></g:if><g:else><img src="<g:createLink uri="/images/bddeshdefault/maleProfileSmall.jpeg"/>" class="s30 s18 rndImg"></g:else></g:else>
          					<span class="sgb"><g:if test="${user.displayName}">${user.displayName}</g:if><g:else>${user.username}</g:else> </span><span class="caret"></span>
          				</g:if>
          				<g:else>
          					<span aria-hidden="true" class="glyphicon glyphicon-user"></span>
          					<span class="sgb"><g:message code="registration"/></span> <span class="caret"></span>
          				</g:else>
	          		</a>
	          		<ul class="dropdown-menu">
	          			<sec:ifLoggedIn>
	          				<g:if test="${user}">
		          				<li>
		          					<a href="<g:createLink uri="/profile/of/${user.id}/${user.username}"/>">
		          						<g:if test="${user.profileImage}"><img src="<g:createLink uri="/newsImages/d50/${user.profileImage}"/>" class="s30 rndImg"></g:if>
		          						<g:else><g:if test="${user.gender}"><img src="<g:createLink uri="/images/bddeshdefault/femaleProfileSmall.jpeg"/>" class="s30 rndImg"></g:if><g:else><img src="<g:createLink uri="/images/bddeshdefault/maleProfileSmall.jpeg"/>" class="s30 rndImg"></g:else></g:else> <g:message code="viewProfile"/>
									</a>
								</li>
							</g:if>
	          				<li class="hidden">
								<form class="logout" name="logoutSubmitForm" method="POST" action="${createLink(controller: 'logout')}">
									<input type="hidden" name="" value="">
								</form>							    
							</li>
							<li>
								<a class="logout" href="javascript:document.logoutSubmitForm.submit()"><span aria-hidden="true" class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;<span><g:message code="userLogout"/></span></a>
							</li>
						</sec:ifLoggedIn>
						<sec:ifNotLoggedIn>
							<li><a href="<g:createLink uri="/login/auth"/>"><span aria-hidden="true" class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;<span><g:message code="userLoginKorun"/></span></a></li>
							<li><a href="<g:createLink uri="/login/auth"/>"><span aria-hidden="true" class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<span><g:message code="freeRegistration"/></span></a></li>
						</sec:ifNotLoggedIn>
		          	</ul>
				</li>
       		</ul>
        </div>
	</div>
</nav>
	