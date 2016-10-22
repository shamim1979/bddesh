<%@ page import="com.bddesh24.PollItem" %>



<div class="fieldcontain ${hasErrors(bean: pollItemInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="pollItem.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" maxlength="50" required="" value="${pollItemInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollItemInstance, field: 'deffence', 'error')} ">
	<label for="deffence">
		<g:message code="pollItem.deffence.label" default="Deffence" />
		
	</label>
	<g:textArea name="deffence" cols="40" rows="5" maxlength="500" value="${pollItemInstance?.deffence}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollItemInstance, field: 'imageName', 'error')} ">
	<label for="imageName">
		<g:message code="pollItem.imageName.label" default="Image Name" />
		
	</label>
	<g:textField name="imageName" maxlength="150" value="${pollItemInstance?.imageName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollItemInstance, field: 'pollItemOpinions', 'error')} ">
	<label for="pollItemOpinions">
		<g:message code="pollItem.pollItemOpinions.label" default="Poll Item Opinions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${pollItemInstance?.pollItemOpinions?}" var="p">
    <li><g:link controller="pollItemOpinion" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="pollItemOpinion" action="create" params="['pollItem.id': pollItemInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pollItemOpinion.label', default: 'PollItemOpinion')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: pollItemInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="pollItem.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${pollItemInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: pollItemInstance, field: 'isPositive', 'error')} ">
	<label for="isPositive">
		<g:message code="pollItem.isPositive.label" default="Is Positive" />
		
	</label>
	<g:checkBox name="isPositive" value="${pollItemInstance?.isPositive}" />

</div>

<div class="fieldcontain ${hasErrors(bean: pollItemInstance, field: 'poll', 'error')} required">
	<label for="poll">
		<g:message code="pollItem.poll.label" default="Poll" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="poll" name="poll.id" from="${com.bddesh24.Poll.list()}" optionKey="id" required="" value="${pollItemInstance?.poll?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollItemInstance, field: 'pollItemOwner', 'error')} required">
	<label for="pollItemOwner">
		<g:message code="pollItem.pollItemOwner.label" default="Poll Item Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pollItemOwner" name="pollItemOwner.id" from="${com.bddesh24.User.list()}" optionKey="id" required="" value="${pollItemInstance?.pollItemOwner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollItemInstance, field: 'totalOpinion', 'error')} required">
	<label for="totalOpinion">
		<g:message code="pollItem.totalOpinion.label" default="Total Opinion" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalOpinion" type="number" value="${pollItemInstance.totalOpinion}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pollItemInstance, field: 'totalVote', 'error')} required">
	<label for="totalVote">
		<g:message code="pollItem.totalVote.label" default="Total Vote" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalVote" type="number" value="${pollItemInstance.totalVote}" required=""/>

</div>

