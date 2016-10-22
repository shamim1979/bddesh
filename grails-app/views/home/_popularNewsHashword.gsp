<g:if test="${newsHashwords}">
	<div class="brd3 nhwd">									
		<div class="cbx text-center">
			Popular news hashword 
		</div>
	</div>
	<div class="cbx">
		<g:each var="word" in="${newsHashwords}"><a class="brd3 hswa" href="<g:createLink uri="/hashword/news/${word}"/>">#${word}</a></g:each>
	</div>
</g:if>	
<g:if test="${pollTags}">
	<div class="brd3 nhwd">									
		<div class="cbx text-center">
			Popular poll hashword 
		</div>
	</div>
	<div class="cbx">
		<g:each var="word" in="${pollTags}"><a class="brd3 hswa" href="<g:createLink uri="/hashword/pollz/${word}"/>">#${word}</a></g:each>
	</div>
</g:if>
<g:if test="${topTenTags}">
	<div class="brd3 nhwd">									
		<div class="cbx text-center">
			Popular top ten hashword 
		</div>
	</div>
	<div class="cbx">
		<g:each var="word" in="${topTenTags}"><a class="brd3 hswa" href="<g:createLink uri="/hashword/toptenz/${word}"/>">#${word}</a></g:each>
	</div>
</g:if>	
<g:if test="${questionTags}">
	<div class="brd3 nhwd">									
		<div class="cbx text-center">
			Popular question hashword 
		</div>
	</div>
	<div class="cbx">
		<g:each var="word" in="${questionTags}"><a class="brd3 hswa" href="<g:createLink uri="/hashword/ask/${word}"/>">#${word}</a></g:each>
	</div>
</g:if>	
<g:if test="${newsSourceTags}">
	<div class="brd3 nhwd">									
		<div class="cbx text-center">
			Popular Newspapers hashword  
		</div>
	</div>
	<g:if test="${usaTags}">
		<div class="mtb5 uTgs">
			<div class="cbx text-center">
				USA News
			</div>
			<div class="cbx">
				<g:each var="word" in="${usaTags}"><a class="brd3 hswa" href="<g:createLink uri="/hashword/newspapers/${word}"/>">#${word}</a></g:each>
			</div>
		</div>
	</g:if>
	<div class="cbx">
		<g:each var="word" in="${newsSourceTags}"><a class="brd3 hswa" href="<g:createLink uri="/hashword/newspapers/${word}"/>">#${word}</a></g:each>
	</div>
</g:if>						



