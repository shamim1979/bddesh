<%@ page import="com.bddesh24.NewsSourceTag" %>



<div class="fieldcontain ${hasErrors(bean: newsSourceTagInstance, field: 'newsSourceTag', 'error')} required">
	<label for="newsSourceTag">
		<g:message code="newsSourceTag.newsSourceTag.label" default="News Source Tag" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="newsSourceTag" maxlength="150" required="" value="${newsSourceTagInstance?.newsSourceTag}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceTagInstance, field: 'tagDescription', 'error')} ">
	<label for="tagDescription">
		<g:message code="newsSourceTag.tagDescription.label" default="Tag Description" />
		
	</label>
	<g:textArea name="tagDescription" cols="40" rows="5" maxlength="300" value="${newsSourceTagInstance?.tagDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceTagInstance, field: 'relatedHashwords', 'error')} ">
	<label for="relatedHashwords">
		<g:message code="newsSourceTag.relatedHashwords.label" default="Related Hashwords" />
		
	</label>
	<g:textArea name="relatedHashwords" cols="40" rows="5" maxlength="800" value="${newsSourceTagInstance?.relatedHashwords}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceTagInstance, field: 'coverImage', 'error')} ">
	<label for="coverImage">
		<g:message code="newsSourceTag.coverImage.label" default="Cover Image" />
		
	</label>
	<g:textField name="coverImage" maxlength="150" value="${newsSourceTagInstance?.coverImage}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceTagInstance, field: 'newsSourceItems', 'error')} ">
	<label for="newsSourceItems">
		<g:message code="newsSourceTag.newsSourceItems.label" default="News Source Items" />
		
	</label>
	<g:select name="newsSourceItems" from="${com.bddesh24.NewsSourceItem.list()}" multiple="multiple" optionKey="id" size="5" value="${newsSourceTagInstance?.newsSourceItems*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceTagInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="newsSourceTag.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${newsSourceTagInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceTagInstance, field: 'featured', 'error')} ">
	<label for="featured">
		<g:message code="newsSourceTag.featured.label" default="Featured" />
		
	</label>
	<g:checkBox name="featured" value="${newsSourceTagInstance?.featured}" />

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceTagInstance, field: 'totalNewsSourceItem', 'error')} required">
	<label for="totalNewsSourceItem">
		<g:message code="newsSourceTag.totalNewsSourceItem.label" default="Total News Source Item" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalNewsSourceItem" type="number" value="${newsSourceTagInstance.totalNewsSourceItem}" required=""/>

</div>

