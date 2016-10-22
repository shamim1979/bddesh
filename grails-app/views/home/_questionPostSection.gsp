<div id="question" class="tab-pane fade <g:if test="${isQuestionActive}">in active</g:if>">
	<g:form onsubmit="return validateForm('question')" useToken="true" name="questionRegisterForm" url="[action:'createQuestion',controller:'ask']">
		<div class="phtbx drndbor">
		  	<a class="ihbx" href="javascript:void(0)" onclick="javascript:addPhoto('question')">
		   		<div class="uppimg text-center">
	   				<span aria-hidden="true" class="glyphicon glyphicon-camera"></span>
	   			</div>
	   			<div  class="upptxt text-center">
	   				<img id="questioniload" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/><span>Add Photo</span>
	   			</div>
		  	</a>
	  	</div>
	  	<input name="questionImageName" id="questionImageName" type="hidden" value="" autocomplete="off">
	  	<div class="cibb">
	  		<textarea autocomplete="off" onfocus="javascript:hasUser();" name="questionTitle" id="questionTitle" class="form-control cusTxtBx" placeholder="<g:message code="questiontitle"/>" title="Please enter question" rows="3"></textarea>
	  	</div>
	  	<div class="cibb">
			<textarea autocomplete="off" onfocus="javascript:hasUser();" name="questionHashtags" id="questionHashtags" class="form-control cusTxtBx" placeholder="<g:message code="questionHashtags"/>" title="Please enter question hashtags" rows="1"></textarea>
		</div>
	  	<div class="sbmt">
			<img id="questionsubmit" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/>
			<button id="regSubmitQuestion" name="regSubmitQuestion" onclick="javascript:submitPost('question');" value="<g:message code="createQuestion"/>" class="conbor sbbtn" type="button"><g:message code="createQuestion"/></button>
		</div>
		<div style="clear: both;"></div>
		<div id="questionImageSubmit" class="hidden"></div>
		<div id="questionImageLoad" class="hidden"></div>
	</g:form>
</div>