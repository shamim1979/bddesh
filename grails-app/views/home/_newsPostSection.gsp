<div id="news" class="tab-pane fade <g:if test="${isNewsActive}">in active</g:if>">
	<g:form onsubmit="return validateForm('news')" useToken="true" name="newsRegisterForm" url="[action:'createArticle',controller:'news']">
		<g:if test="${user}">
			<div class="phtbx drndbor">
				<a class="ihbx" href="javascript:void(0)" onclick="javascript:addPhoto('news')">
		   			<div class="uppimg text-center">
						<span aria-hidden="true" class="glyphicon glyphicon-camera"></span>
					</div>
					<div  class="upptxt text-center">
						<img id="newsiload" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/><span>Add Photo</span>
					</div>
		  		</a>
		  	</div>
	  	</g:if>
	  	<input name="newsImageName" id="newsImageName" type="hidden" value="" autocomplete="off">
	  	<input name="newsLink" id="newsLink" type="hidden" value="" autocomplete="off">
	  	<g:if test="${user && user.isAdmin}">
	  		<div class="cibb">
				<textarea autocomplete="off" onfocus="javascript:hasUser();" onkeyup="urlFetching(this,event,'No')" name="articleLinkNoImage" id="articleLinkNoImage" class="form-control cusTxtBx" placeholder="<g:message code="articleLinkNoImage"/>" title="Please enter article link" rows="1"></textarea>
			</div>
			<div class="cibb">
				<textarea autocomplete="off" onfocus="javascript:hasUser();" onkeyup="urlFetching(this,event,'Yes')" name="articleLink" id="articleLink" class="form-control cusTxtBx" placeholder="<g:message code="articleLinkImage"/>" title="Please enter article link" rows="1"></textarea>
			</div>
			<select name="newsCategory" id="newsCategory">
				<option value="0" selected="selected">News Category</option>
				<option value="1">Latest top news</option>
				<option value="2">Latest news</option>
				<option value="11">National</option>
				<option value="3">World</option>
				<option value="4">Business</option>
				<option value="5">Cricket</option>	
				<option value="12">Football</option>							
				<option value="6">Food</option>				
				<option value="7">Health</option>
				<option value="10">Entertainment</option>
				<option value="8">Education</option>
				<option value="9">Technology</option>
			</select>
	  	</g:if>	  	
	  	<g:if test="${user}">
			<div class="cibb">
				<textarea autocomplete="off" onfocus="javascript:hasUser();" name="articleTitle" id="articleTitle" class="form-control cusTxtBx" placeholder="<g:message code="articleTitle"/>" title="Please enter article title" rows="1"></textarea>
			</div>
		</g:if>
		<div class="cibb">
			<textarea autocomplete="off" onfocus="javascript:hasUser();" name="articleDescription" id="articleDescription" class="form-control cusTxtBx" placeholder="<g:message code="articleDescription"/>" title="Please enter article description" rows="<g:if test="${user}">5</g:if><g:else>3</g:else>"></textarea>
		</div>
		<g:if test="${user}">
			<div class="cibb">
				<textarea autocomplete="off" onfocus="javascript:hasUser();" name="articleHashtags" id="articleHashtags" class="form-control cusTxtBx" placeholder="<g:message code="articleHashtags"/>" title="Please enter article hashtags" rows="1"></textarea>
			</div>
		</g:if>
	  	<div class="sbmt">
			<img id="newssubmit" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/>
			<button id="regSubmitNews" name="regSubmitNews" onclick="javascript:submitPost('news');" value="<g:message code="createArticle"/>" class="conbor sbbtn" type="button"><g:message code="createArticle"/></button>
		</div>
		<div style="clear: both;"></div>
		<div id="newsImageSubmit" class="hidden"></div>
		<div id="newsImageLoad" class="hidden"></div> 
	</g:form>
</div> 