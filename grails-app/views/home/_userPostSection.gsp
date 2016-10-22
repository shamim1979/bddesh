<div class="conbor wbg inbx">
	<div class="cbx">
		<ul class="nav nav-tabs nav-justified">
	  		<li class="<g:if test="${isNewsActive}">active</g:if>"><a onclick="javascript:hideAllTipsy()" data-toggle="tab" href="#news">Post</a></li>
	  		<li class="<g:if test="${isTopTenActive}">active</g:if>"><a onclick="javascript:hideAllTipsy()" data-toggle="tab" href="#topten">TopTen</a></li>
	  		<li class="<g:if test="${isPollActive}">active</g:if>"><a onclick="javascript:hideAllTipsy()" data-toggle="tab" href="#poll">Vote</a></li>
	  		<li class="<g:if test="${isQuestionActive}">active</g:if>"><a onclick="javascript:hideAllTipsy()" data-toggle="tab" href="#question">Question</a></li>
	  		<li class="<g:if test="${isQuoteActive}">active</g:if>"><a onclick="javascript:hideAllTipsy()" data-toggle="tab" href="#quote">Quote</a></li>
		</ul>
		<div class="tab-content tbbx">
			<g:render template="/home/newsPostSection" model="[isNewsActive:isNewsActive]"></g:render>
			<g:render template="/home/toptenPostSection" model="[isTopTenActive:isTopTenActive]"></g:render>
			<g:render template="/home/pollPostSection" model="[isPollActive:isPollActive]"></g:render>
			<g:render template="/home/questionPostSection" model="[isQuestionActive:isQuestionActive]"></g:render>
			<g:render template="/home/quotePostSection" model="[isQuoteActive:isQuoteActive]"></g:render>
		</div>
		<div id="articleUploadImage">
			
		</div>
		<div class="hidden">
			<input type="file" id="uploadImageFile" name="uploadImageFile">
			<div class="canvas-containter">
	        	<canvas id="dst-pica" class="img-responsive"></canvas>
	        </div>
			<div class="canvas-containter">
	        	<canvas id="src" class="img-responsive"></canvas>
	        </div>
		</div>
	</div>
</div>
