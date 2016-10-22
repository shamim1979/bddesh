<%@ page import="com.bddesh24.PollTag" %>



<div class="fieldcontain ${hasErrors(bean: pollTagInstance, field: 'pollTag', 'error')} required">
	<label for="pollTag">
		<g:message code="pollTag.pollTag.label" default="Poll Tag" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pollTag" maxlength="150" required="" value="${pollTagInstance?.pollTag}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollTagInstance, field: 'coverImage', 'error')} ">
	<label for="coverImage">
		<g:message code="pollTag.coverImage.label" default="Cover Image" />
		
	</label>
	<g:textField name="coverImage" maxlength="150" value="${pollTagInstance?.coverImage}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollTagInstance, field: 'relatedHashwords', 'error')} ">
	<label for="relatedHashwords">
		<g:message code="pollTag.relatedHashwords.label" default="Related Hashwords" />
		
	</label>
	<g:textArea name="relatedHashwords" cols="40" rows="5" maxlength="800" value="${pollTagInstance?.relatedHashwords}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollTagInstance, field: 'tagDescription', 'error')} ">
	<label for="tagDescription">
		<g:message code="pollTag.tagDescription.label" default="Tag Description" />
		
	</label>
	<g:textArea name="tagDescription" cols="40" rows="5" maxlength="300" value="${pollTagInstance?.tagDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollTagInstance, field: 'polls', 'error')} ">
	<label for="polls">
		<g:message code="pollTag.polls.label" default="Polls" />
		
	</label>
	<g:select name="polls" from="${com.bddesh24.Poll.list()}" multiple="multiple" optionKey="id" size="5" value="${pollTagInstance?.polls*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollTagInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="pollTag.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${pollTagInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: pollTagInstance, field: 'featured', 'error')} ">
	<label for="featured">
		<g:message code="pollTag.featured.label" default="Featured" />
		
	</label>
	<g:checkBox name="featured" value="${pollTagInstance?.featured}" />

</div>

<div class="fieldcontain ${hasErrors(bean: pollTagInstance, field: 'pollTagOwner', 'error')} required">
	<label for="pollTagOwner">
		<g:message code="pollTag.pollTagOwner.label" default="Poll Tag Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pollTagOwner" name="pollTagOwner.id" from="${com.bddesh24.User.list()}" optionKey="id" required="" value="${pollTagInstance?.pollTagOwner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollTagInstance, field: 'totalPoll', 'error')} required">
	<label for="totalPoll">
		<g:message code="pollTag.totalPoll.label" default="Total Poll" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalPoll" type="number" value="${pollTagInstance.totalPoll}" required=""/>

</div>

