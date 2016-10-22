<%@ page import="com.bddesh24.TopTenTag" %>



<div class="fieldcontain ${hasErrors(bean: topTenTagInstance, field: 'topTenTag', 'error')} required">
	<label for="topTenTag">
		<g:message code="topTenTag.topTenTag.label" default="Top Ten Tag" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="topTenTag" maxlength="150" required="" value="${topTenTagInstance?.topTenTag}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenTagInstance, field: 'coverImage', 'error')} ">
	<label for="coverImage">
		<g:message code="topTenTag.coverImage.label" default="Cover Image" />
		
	</label>
	<g:textField name="coverImage" maxlength="150" value="${topTenTagInstance?.coverImage}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenTagInstance, field: 'relatedHashwords', 'error')} ">
	<label for="relatedHashwords">
		<g:message code="topTenTag.relatedHashwords.label" default="Related Hashwords" />
		
	</label>
	<g:textArea name="relatedHashwords" cols="40" rows="5" maxlength="800" value="${topTenTagInstance?.relatedHashwords}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenTagInstance, field: 'tagDescription', 'error')} ">
	<label for="tagDescription">
		<g:message code="topTenTag.tagDescription.label" default="Tag Description" />
		
	</label>
	<g:textArea name="tagDescription" cols="40" rows="5" maxlength="300" value="${topTenTagInstance?.tagDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenTagInstance, field: 'topTens', 'error')} ">
	<label for="topTens">
		<g:message code="topTenTag.topTens.label" default="Top Tens" />
		
	</label>
	<g:select name="topTens" from="${com.bddesh24.TopTen.list()}" multiple="multiple" optionKey="id" size="5" value="${topTenTagInstance?.topTens*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenTagInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="topTenTag.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${topTenTagInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: topTenTagInstance, field: 'featured', 'error')} ">
	<label for="featured">
		<g:message code="topTenTag.featured.label" default="Featured" />
		
	</label>
	<g:checkBox name="featured" value="${topTenTagInstance?.featured}" />

</div>

<div class="fieldcontain ${hasErrors(bean: topTenTagInstance, field: 'topTenTagOwner', 'error')} required">
	<label for="topTenTagOwner">
		<g:message code="topTenTag.topTenTagOwner.label" default="Top Ten Tag Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topTenTagOwner" name="topTenTagOwner.id" from="${com.bddesh24.User.list()}" optionKey="id" required="" value="${topTenTagInstance?.topTenTagOwner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenTagInstance, field: 'totalTopTen', 'error')} required">
	<label for="totalTopTen">
		<g:message code="topTenTag.totalTopTen.label" default="Total Top Ten" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalTopTen" type="number" value="${topTenTagInstance.totalTopTen}" required=""/>

</div>

