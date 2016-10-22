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
        </div>
	</div>
</nav>
	