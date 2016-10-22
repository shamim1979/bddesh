<div id="quote" class="tab-pane fade <g:if test="${isQuoteActive}">in active</g:if>">
	<g:form onsubmit="return validateForm('quote')" useToken="true" name="quoteRegisterForm" url="[action:'createQuote',controller:'quoteDay']">
		<g:if test="${user && user.isAdmin}">
	  		<div class="cibb">
				<textarea autocomplete="off" onfocus="javascript:hasUser();" onkeyup="urlFetching(this,event,'Quote')" name="quoteLinkFetch" id="quoteLinkFetch" class="form-control cusTxtBx" placeholder="<g:message code="quoteLinkFetch"/>" title="Please enter quote link" rows="1"></textarea>
			</div>
	  	</g:if>	 
	  	<div class="cibb">
			<textarea autocomplete="off" onfocus="javascript:hasUser();" name="aquote" id="aquote" class="form-control cusTxtBx" placeholder="<g:message code="quote"/>" title="Please enter quote" rows="2"></textarea>
		</div>
		<div class="cibb">
			<textarea autocomplete="off" onfocus="javascript:hasUser();" name="quoteDescription" id="quoteDescription" class="form-control cusTxtBx" placeholder="<g:message code="quoteDescription"/>" title="Please enter your opinion" rows="3"></textarea>
		</div>
		<div class="cibb">
			<textarea autocomplete="off" onfocus="javascript:hasUser();" name="quoteAuthor" id="quoteAuthor" class="form-control cusTxtBx" placeholder="<g:message code="quoteAuthor"/>" title="Please enter quoted author name" rows="1"></textarea>
		</div>
		<div class="cibb">
			<textarea autocomplete="off" onfocus="javascript:hasUser();" name="quoteHashtags" id="quoteHashtags" class="form-control cusTxtBx" placeholder="<g:message code="quoteHashtags"/>" title="Please enter quote hashtags" rows="1"></textarea>
		</div>
	  	<div class="sbmt">
			<img id="quotesubmit" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/>
			<button id="regSubmitQuote" name="regSubmitQuote" onclick="javascript:submitPost('quote');" value="<g:message code="createQuote"/>" class="conbor sbbtn" type="button"><g:message code="createQuote"/></button>
		</div>
		<div class="hidden">
			<canvas id="quoteCanvas" class="img-responsive"></canvas>
		</div>
		<div style="clear: both;"></div>
		<div id="quoteImageSubmit" class="hidden"></div>
		<div id="quoteImageLoad" class="hidden"></div>
	</g:form>
</div> 
