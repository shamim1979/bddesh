<%@ page import="com.bddesh24.TopTenItem" %>



<div class="fieldcontain ${hasErrors(bean: topTenItemInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="topTenItem.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" maxlength="200" required="" value="${topTenItemInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenItemInstance, field: 'shortDescription', 'error')} ">
	<label for="shortDescription">
		<g:message code="topTenItem.shortDescription.label" default="Short Description" />
		
	</label>
	<g:textArea name="shortDescription" cols="40" rows="5" maxlength="500" value="${topTenItemInstance?.shortDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenItemInstance, field: 'imageName', 'error')} ">
	<label for="imageName">
		<g:message code="topTenItem.imageName.label" default="Image Name" />
		
	</label>
	<g:textField name="imageName" maxlength="150" value="${topTenItemInstance?.imageName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenItemInstance, field: 'topTenOpinions', 'error')} ">
	<label for="topTenOpinions">
		<g:message code="topTenItem.topTenOpinions.label" default="Top Ten Opinions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${topTenItemInstance?.topTenOpinions?}" var="t">
    <li><g:link controller="topTenOpinion" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="topTenOpinion" action="create" params="['topTenItem.id': topTenItemInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'topTenOpinion.label', default: 'TopTenOpinion')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: topTenItemInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="topTenItem.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${topTenItemInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: topTenItemInstance, field: 'topTen', 'error')} required">
	<label for="topTen">
		<g:message code="topTenItem.topTen.label" default="Top Ten" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topTen" name="topTen.id" from="${com.bddesh24.TopTen.list()}" optionKey="id" required="" value="${topTenItemInstance?.topTen?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenItemInstance, field: 'topTenItemOwner', 'error')} required">
	<label for="topTenItemOwner">
		<g:message code="topTenItem.topTenItemOwner.label" default="Top Ten Item Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topTenItemOwner" name="topTenItemOwner.id" from="${com.bddesh24.User.list()}" optionKey="id" required="" value="${topTenItemInstance?.topTenItemOwner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenItemInstance, field: 'totalOpinion', 'error')} required">
	<label for="totalOpinion">
		<g:message code="topTenItem.totalOpinion.label" default="Total Opinion" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalOpinion" type="number" value="${topTenItemInstance.totalOpinion}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenItemInstance, field: 'totalVote', 'error')} required">
	<label for="totalVote">
		<g:message code="topTenItem.totalVote.label" default="Total Vote" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalVote" type="number" value="${topTenItemInstance.totalVote}" required=""/>

</div>

