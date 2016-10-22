<div class="conbor wbg inbx">
	<div class="cbx">
		<div class="cibb">
			<textarea autocomplete="off" name="topTenLinkFetch" id="topTenLinkFetch" class="form-control cusTxtBx" placeholder="<g:message code="topTenLinkFetch"/>" title="Please enter quote link" rows="1"></textarea>
		</div>
		<div class="sbmt">
			<img id="toptenLink" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/>
			<button id="regSubmitTopten" name="regSubmitTopten" onclick="javascript:submitLink();" value="<g:message code="fetchTopTen"/>" class="conbor sbbtn" type="button"><g:message code="fetchTopTen"/></button>
		</div>
		<g:form useToken="true" name="topTenRegisterForm" url="[action:'createTopten',controller:'admin']">
			<input name="toptenItemLength" id="toptenItemLength" type="hidden" value="3" autocomplete="off">
			<div class="cibb">
				<textarea autocomplete="off" onfocus="javascript:hasUser();" name="toptenTitle" id="toptenTitle" class="form-control cusTxtBx" placeholder="<g:message code="topTenTitle"/>" title="Please enter top ten title" rows="1"></textarea>
			</div>
			<div class="cibb">
				<textarea autocomplete="off" onfocus="javascript:hasUser();" name="toptenDescription" id="toptenDescription" class="form-control cusTxtBx" placeholder="<g:message code="topTenDescription"/>" title="Please enter top ten description" rows="3"></textarea>
			</div>
			<div id="topTenList">
			
			</div>
			<div class="cibb">
				<textarea autocomplete="off" onfocus="javascript:hasUser();" name="toptenHashtags" id="toptenHashtags" class="form-control cusTxtBx" placeholder="<g:message code="toptenHashtags"/>" title="Please enter top ten hashtags" rows="1"></textarea>
			</div>
			<div class="sbmt">
				<img id="toptensubmit" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/>
				<button id="regSubmitTopten" name="regSubmitTopten" onclick="javascript:submitPost('topten');" value="<g:message code="createTopTen"/>" class="conbor sbbtn" type="button"><g:message code="createTopTen"/></button>
			</div>
		</g:form>
		<div style="clear: both;"></div>
		<div id="topTenSuc" class="cibb hidden">
			
		</div>
	</div>
</div>