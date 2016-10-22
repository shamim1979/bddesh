<g:if test="${newsSourceTags}">
	<div class="brd3 nhwd">									
		<div class="cbx text-center">
			Newspapers sorted by country
		</div>
	</div>
	<g:if test="${usaTags}">
		<div class="mtb5 uTgs">
			<div class="cbx text-center">
				USA News
			</div>
			<div class="cbx">
				<g:each var="word" in="${usaTags}"><a class="brd3 hswa" title="Newspapers in ${word}" href="<g:createLink uri="/hashword/newspapers/${word}"/>">${word}</a></g:each>
			</div>
		</div>
	</g:if>
	<div class="cbx">
		<g:each var="word" in="${newsSourceTags}"><a class="brd3 hswa" title="Newspapers in ${word}" href="<g:createLink uri="/hashword/newspapers/${word}"/>">${word}</a></g:each>
	</div>
</g:if>	
