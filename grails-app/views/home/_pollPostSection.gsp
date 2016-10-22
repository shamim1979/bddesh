<div id="poll" class="tab-pane fade <g:if test="${isPollActive}">in active</g:if>">
	<g:form onsubmit="return validateForm('poll')" useToken="true" name="pollRegisterForm" url="[action:'createPoll',controller:'pollz']">
		<div class="phtbx drndbor">
	  		<a class="ihbx" href="javascript:void(0)" onclick="javascript:addPhoto('poll')">
	   			<div class="uppimg text-center">
	   				<span aria-hidden="true" class="glyphicon glyphicon-camera"></span>
	   			</div>
	   			<div  class="upptxt text-center">
	   				<img id="polliload" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/><span>Add Photo</span>
	   			</div>
	  		</a>
	  	</div>
	  	<input name="pollImageName" id="pollImageName" type="hidden" value="" autocomplete="off">
		<div class="cibb">
			<textarea autocomplete="off" onfocus="javascript:hasUser();" name="pollQuestion" id="pollQuestion" class="form-control cusTxtBx" placeholder="<g:message code="pollQuestion"/>" title="Please enter the poll question" rows="1"></textarea>
		</div>
		<div class="pside f18 text-center">
			What two answers will voters have to pick from?
		</div>
	    <div class="row">
	    	<div class="col-sm-6 col-md-6 col-lg-6 cbpd">
	  			<div class="pside f16 text-center">
	    			Option 1
	    		</div>
	  				<div class="cibb">
	    			<textarea autocomplete="off" onfocus="javascript:hasUser();" name="positiveTitle" id="positiveTitle" class="form-control cusTxtBx" placeholder="<g:message code="positiveTitle"/>" title="Please enter positive side title" rows="1"></textarea>
	    		</div>
	    		<div class="pside text-center">
	    			Defend Side 1
	    		</div>
	    		<div class="cibb">
	    			<textarea autocomplete="off" onfocus="javascript:hasUser();" name="positiveDeffence" id="positiveDeffence" class="form-control cusTxtBx" placeholder="<g:message code="positiveDeffence"/>" title="Please enter positive side positive side deffence" rows="3"></textarea>
	    		</div>
	    	</div>
	    	<div class="col-sm-6 col-md-6 col-lg-6 cbpd">
	  			<div class="pside f16 text-center">
	    			Option 2
	    		</div>
	  				<div class="cibb">
	    			<textarea autocomplete="off" onfocus="javascript:hasUser();" name="oppositeTitle" id="oppositeTitle" class="form-control cusTxtBx" placeholder="<g:message code="oppositeTitle"/>" title="Please enter opposite side title" rows="1"></textarea>
	    		</div>
	    		<div class="pside text-center">
	    			Defend Side 2
	    		</div>
	    		<div class="cibb">
	    			<textarea autocomplete="off" onfocus="javascript:hasUser();" name="oppositeDeffence" id="oppositeDeffence" class="form-control cusTxtBx" placeholder="<g:message code="oppositeDeffence"/>" title="Please enter opposite side deffence" rows="3"></textarea>
	    		</div>
	    	</div>
	    </div>
	    <div class="cibb">
			<textarea autocomplete="off" onfocus="javascript:hasUser();" name="pollHashtags" id="pollHashtags" class="form-control cusTxtBx" placeholder="<g:message code="pollHashtags"/>" title="Please enter poll hashtags" rows="1"></textarea>
		</div>
	  	<div class="sbmt">
			<img id="pollsubmit" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/>
			<button id="regSubmitPoll" name="regSubmitPoll" onclick="javascript:submitPost('poll');" value="<g:message code="createPoll"/>" class="conbor sbbtn" type="button"><g:message code="createPoll"/></button>
		</div>
		<div style="clear: both;"></div> 
		<div id="pollImageSubmit" class="hidden"></div>
		<div id="pollImageLoad" class="hidden"></div>
	</g:form>
</div>
						  		