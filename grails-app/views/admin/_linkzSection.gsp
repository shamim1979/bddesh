<div class="conbor wbg inbx">
	<div class="cbx">
		<g:form onsubmit="return validateForm('newsSource')" useToken="true" name="newsSourceRegisterForm" url="[action:'createNewsSource',controller:'admin']">
			<div class="nwsSrc">
				News Source
			</div>
			<input name="newsSourceItemLength" id="newsSourceItemLength" type="hidden" value="1" autocomplete="off">
			<div class="cibb">
				<textarea autocomplete="off" name="title" id="title" class="form-control cusTxtBx" placeholder="<g:message code="title"/>" title="Please enter news source title" rows="1"></textarea>
			</div>
			<div class="cibb">
				<textarea autocomplete="off" name="shortDescription" id="shortDescription" class="form-control cusTxtBx" placeholder="<g:message code="shortDescription"/>" title="Please enter news source short description" rows="4"></textarea>
			</div>
			<div class="cibb">
				<textarea autocomplete="off" name="newsSourceTag" id="newsSourceTag" class="form-control cusTxtBx" placeholder="<g:message code="newsSourceRooTag"/>" title="Please enter news source tag" rows="1"></textarea>
			</div>
			<div class="nwsSrc">
				News Source Item
			</div>
			<div id="newsSourceList">
				<div class="cibb">
					<textarea autocomplete="off" name="title1" id="title1" class="form-control cusTxtBx" placeholder="<g:message code="title"/>" title="Please enter news source item title" rows="1"></textarea>
				</div>
				<div class="cibb">
					<textarea autocomplete="off" name="shortDescription1" id="shortDescription1" class="form-control cusTxtBx" placeholder="<g:message code="shortDescription"/>" title="Please enter news source item short description" rows="4"></textarea>
				</div>
				<div class="cibb">
					<textarea autocomplete="off" name="newsLinks1" id="newsLinks1" class="form-control cusTxtBx" placeholder="<g:message code="newsLinks"/>" title="Please enter news source item newsLinks1" rows="15"></textarea>
				</div>
				<div class="cibb">
					<textarea autocomplete="off" name="newsSourceTag1" id="newsSourceTag1" class="form-control cusTxtBx" placeholder="<g:message code="newsSourceTag"/>" title="Please enter news source item tag" rows="1"></textarea>
				</div>
			</div>
			<div class="mt5">
		 		<button id="moreItem" name="moreItem" onclick="javascript:addMoreItem();" value="<g:message code="addNewsSourceItem"/>" class="conbor sbbtn atpi" type="button"><span aria-hidden="true" class="glyphicon glyphicon-plus-sign"></span> <g:message code="addNewsSourceItem"/></button>
		 	</div>
			<div class="sbmt">
				<img id="newsSourcesubmit" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/>
				<button id="regSubmitNewsSource" name="regSubmitNewsSource" onclick="javascript:submitPost('newsSource');" value="<g:message code="createNewsSource"/>" class="conbor sbbtn" type="button"><g:message code="createNewsSource"/></button>
			</div>
			<div style="clear: both;"></div> 
		</g:form>
	</div>
</div>