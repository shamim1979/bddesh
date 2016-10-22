<%@ page import="com.bddesh24.Poll" %>



<div class="fieldcontain ${hasErrors(bean: pollInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="poll.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="question" maxlength="200" required="" value="${pollInstance?.question}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollInstance, field: 'shortDescription', 'error')} ">
	<label for="shortDescription">
		<g:message code="poll.shortDescription.label" default="Short Description" />
		
	</label>
	<g:textArea name="shortDescription" cols="40" rows="5" maxlength="500" value="${pollInstance?.shortDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollInstance, field: 'pollTags', 'error')} ">
	<label for="pollTags">
		<g:message code="poll.pollTags.label" default="Poll Tags" />
		
	</label>
	<g:textArea name="pollTags" cols="40" rows="5" maxlength="500" value="${pollInstance?.pollTags}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollInstance, field: 'imageName', 'error')} ">
	<label for="imageName">
		<g:message code="poll.imageName.label" default="Image Name" />
		
	</label>
	<g:textField name="imageName" maxlength="150" value="${pollInstance?.imageName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollInstance, field: 'pollItems', 'error')} ">
	<label for="pollItems">
		<g:message code="poll.pollItems.label" default="Poll Items" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${pollInstance?.pollItems?}" var="p">
    <li><g:link controller="pollItem" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="pollItem" action="create" params="['poll.id': pollInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pollItem.label', default: 'PollItem')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: pollInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="poll.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${pollInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: pollInstance, field: 'featured', 'error')} ">
	<label for="featured">
		<g:message code="poll.featured.label" default="Featured" />
		
	</label>
	<g:checkBox name="featured" value="${pollInstance?.featured}" />

</div>

<div class="fieldcontain ${hasErrors(bean: pollInstance, field: 'pollOwner', 'error')} required">
	<label for="pollOwner">
		<g:message code="poll.pollOwner.label" default="Poll Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pollOwner" name="pollOwner.id" from="${com.bddesh24.User.list()}" optionKey="id" required="" value="${pollInstance?.pollOwner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollInstance, field: 'postId', 'error')} required">
	<label for="postId">
		<g:message code="poll.postId.label" default="Post Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="postId" type="number" value="${pollInstance.postId}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollInstance, field: 'totalLike', 'error')} required">
	<label for="totalLike">
		<g:message code="poll.totalLike.label" default="Total Like" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalLike" type="number" value="${pollInstance.totalLike}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollInstance, field: 'totalScore', 'error')} required">
	<label for="totalScore">
		<g:message code="poll.totalScore.label" default="Total Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalScore" type="number" value="${pollInstance.totalScore}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollInstance, field: 'totalView', 'error')} required">
	<label for="totalView">
		<g:message code="poll.totalView.label" default="Total View" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalView" type="number" value="${pollInstance.totalView}" required=""/>

</div>

