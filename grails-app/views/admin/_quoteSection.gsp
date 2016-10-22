<div class="conbor wbg inbx">
	<div class="cbx">
		<g:form useToken="true" name="quoteRegisterForm" url="[action:'createQuotes',controller:'admin']">
			<input name="quoteItemLength" id="quoteItemLength" type="hidden" value="1" autocomplete="off">
			<div id="quoteForm">
			
			</div>
			<div class="sbmt">
				<img id="quoteSubmitLoad" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/>
				<button id="regSubmitQuote" name="regSubmitQuote" onclick="javascript:submitQuotePost();" value="<g:message code="createQuote"/>" class="conbor sbbtn" type="button"><g:message code="createQuote"/></button>
			</div>
		</g:form>
		<div class="cibb">
			<textarea autocomplete="off" name="quoteLinkFetch" id="quoteLinkFetch" class="form-control cusTxtBx" placeholder="<g:message code="quoteLinkFetch"/>" title="Please enter quote link" rows="1"></textarea>
		</div>
		<div class="sbmt">
			<img id="quotesSubmit" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/>
			<button id="regSubmitNewsSource" name="regSubmitNewsSource" onclick="javascript:submitQuotes()" value="<g:message code="createQuote"/>" class="conbor sbbtn" type="button"><g:message code="createQuote"/></button>
		</div>
		<div style="clear: both;"></div>
		<div id="qSuc" class="cibb hidden">
			
		</div>	
	</div>
</div>