<div id="topten" class="tab-pane fade <g:if test="${isTopTenActive}">in active</g:if>">
	<g:form onsubmit="return validateForm('topten')" useToken="true" name="toptenRegisterForm" url="[action:'createTopTen',controller:'topTenz']">
		<div class="phtbx drndbor">
	  		<a class="ihbx" href="javascript:void(0)" onclick="javascript:addPhoto('topten')">
		   		<div class="uppimg text-center">
	   				<span aria-hidden="true" class="glyphicon glyphicon-camera"></span>
	   			</div>
	   			<div  class="upptxt text-center">
	   				<img id="topteniload" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/><span>Add Photo</span>
	   			</div>
	  		</a>
	  	</div>
	  	<input name="toptenImageName" id="toptenImageName" type="hidden" value="" autocomplete="off">
	  	<input name="toptenItemLength" id="toptenItemLength" type="hidden" value="3" autocomplete="off">
		<div class="cibb">
			<textarea autocomplete="off" onfocus="javascript:hasUser();" name="toptenTitle" id="toptenTitle" class="form-control cusTxtBx" placeholder="<g:message code="topTenTitle"/>" title="Please enter top ten title" rows="1"></textarea>
		</div>
		<div class="cibb">
			<textarea autocomplete="off" onfocus="javascript:hasUser();" name="toptenDescription" id="toptenDescription" class="form-control cusTxtBx" placeholder="<g:message code="topTenDescription"/>" title="Please enter top ten description" rows="3"></textarea>
		</div>
		<div class="pside f16 text-center">
			What top ten list items you want to add?
		</div>
	  	<div id="topTenList">
	   		<div class="cibb">
	   			<textarea autocomplete="off" onfocus="javascript:hasUser();" name="item1" id="item1" class="form-control cusTxtBx" placeholder="<g:message code="topTenItem"/>" title="Please enter top ten item" rows="1"></textarea>
	   		</div>
	   		<div class="cibb">
	   			<textarea autocomplete="off" onfocus="javascript:hasUser();" name="item2" id="item2" class="form-control cusTxtBx" placeholder="<g:message code="topTenItem"/>" title="Please enter top ten item" rows="1"></textarea>
	   		</div>
	   		<div class="cibb">
	   			<textarea autocomplete="off" onfocus="javascript:hasUser();" name="item3" id="item3" class="form-control cusTxtBx" placeholder="<g:message code="topTenItem"/>" title="Please enter top ten item" rows="1"></textarea>
	   		</div>
	  	</div>
	 	<div class="mt5">
	 		<button id="moreItem" name="moreItem" onclick="javascript:addMoreItem();" value="<g:message code="addTopTenItem"/>" class="conbor sbbtn atpi" type="button"><span aria-hidden="true" class="glyphicon glyphicon-plus-sign"></span> <g:message code="addTopTenItem"/></button>
	 	</div>
	 	<div class="cibb">
			<textarea autocomplete="off" onfocus="javascript:hasUser();" name="toptenHashtags" id="toptenHashtags" class="form-control cusTxtBx" placeholder="<g:message code="toptenHashtags"/>" title="Please enter top ten hashtags" rows="1"></textarea>
		</div>
	  	<div class="sbmt">
			<img id="toptensubmit" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/>
			<button id="regSubmitTopten" name="regSubmitTopten" onclick="javascript:submitPost('topten');" value="<g:message code="createTopTen"/>" class="conbor sbbtn" type="button"><g:message code="createTopTen"/></button>
		</div>
		<div style="clear: both;"></div> 
		<div id="toptenImageSubmit" class="hidden"></div>
		<div id="toptenImageLoad" class="hidden"></div>
	</g:form>
</div>
						  		