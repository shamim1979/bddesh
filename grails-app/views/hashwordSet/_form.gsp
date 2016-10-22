<%@ page import="com.bddesh24.HashwordSet" %>



<div class="fieldcontain ${hasErrors(bean: hashwordSetInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="hashwordSet.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="location" maxlength="50" required="" value="${hashwordSetInstance?.location}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: hashwordSetInstance, field: 'newsArticleTags', 'error')} ">
	<label for="newsArticleTags">
		<g:message code="hashwordSet.newsArticleTags.label" default="News Article Tags" />
		
	</label>
	<g:textArea name="newsArticleTags" cols="40" rows="5" maxlength="2000" value="${hashwordSetInstance?.newsArticleTags}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: hashwordSetInstance, field: 'pollTags', 'error')} ">
	<label for="pollTags">
		<g:message code="hashwordSet.pollTags.label" default="Poll Tags" />
		
	</label>
	<g:textArea name="pollTags" cols="40" rows="5" maxlength="2000" value="${hashwordSetInstance?.pollTags}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: hashwordSetInstance, field: 'questionTags', 'error')} ">
	<label for="questionTags">
		<g:message code="hashwordSet.questionTags.label" default="Question Tags" />
		
	</label>
	<g:textArea name="questionTags" cols="40" rows="5" maxlength="2000" value="${hashwordSetInstance?.questionTags}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: hashwordSetInstance, field: 'topTenTags', 'error')} ">
	<label for="topTenTags">
		<g:message code="hashwordSet.topTenTags.label" default="Top Ten Tags" />
		
	</label>
	<g:textArea name="topTenTags" cols="40" rows="5" maxlength="2000" value="${hashwordSetInstance?.topTenTags}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: hashwordSetInstance, field: 'newsSourceTags', 'error')} ">
	<label for="newsSourceTags">
		<g:message code="hashwordSet.newsSourceTags.label" default="News Source Tags" />
		
	</label>
	<g:textArea name="newsSourceTags" cols="40" rows="5" maxlength="8000" value="${hashwordSetInstance?.newsSourceTags}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: hashwordSetInstance, field: 'usaSourceTags', 'error')} ">
	<label for="usaSourceTags">
		<g:message code="hashwordSet.usaSourceTags.label" default="Usa Source Tags" />
		
	</label>
	<g:textArea name="usaSourceTags" cols="40" rows="5" maxlength="1000" value="${hashwordSetInstance?.usaSourceTags}"/>

</div>

