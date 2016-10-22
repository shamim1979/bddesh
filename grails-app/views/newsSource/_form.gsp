<%@ page import="com.bddesh24.NewsSource" %>



<div class="fieldcontain ${hasErrors(bean: newsSourceInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="newsSource.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="title" cols="40" rows="5" maxlength="300" required="" value="${newsSourceInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceInstance, field: 'newsSourceTag', 'error')} ">
	<label for="newsSourceTag">
		<g:message code="newsSource.newsSourceTag.label" default="News Source Tag" />
		
	</label>
	<g:textArea name="newsSourceTag" cols="40" rows="5" maxlength="500" value="${newsSourceInstance?.newsSourceTag}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceInstance, field: 'shortDescription', 'error')} ">
	<label for="shortDescription">
		<g:message code="newsSource.shortDescription.label" default="Short Description" />
		
	</label>
	<g:textArea name="shortDescription" cols="40" rows="5" maxlength="500" value="${newsSourceInstance?.shortDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceInstance, field: 'imageName', 'error')} ">
	<label for="imageName">
		<g:message code="newsSource.imageName.label" default="Image Name" />
		
	</label>
	<g:textField name="imageName" maxlength="150" value="${newsSourceInstance?.imageName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceInstance, field: 'newsSourceComments', 'error')} ">
	<label for="newsSourceComments">
		<g:message code="newsSource.newsSourceComments.label" default="News Source Comments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${newsSourceInstance?.newsSourceComments?}" var="n">
    <li><g:link controller="newsSourceComment" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="newsSourceComment" action="create" params="['newsSource.id': newsSourceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'newsSourceComment.label', default: 'NewsSourceComment')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="newsSource.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${newsSourceInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceInstance, field: 'newsSourceItems', 'error')} ">
	<label for="newsSourceItems">
		<g:message code="newsSource.newsSourceItems.label" default="News Source Items" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${newsSourceInstance?.newsSourceItems?}" var="n">
    <li><g:link controller="newsSourceItem" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="newsSourceItem" action="create" params="['newsSource.id': newsSourceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'newsSourceItem.label', default: 'NewsSourceItem')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceInstance, field: 'totalComment', 'error')} required">
	<label for="totalComment">
		<g:message code="newsSource.totalComment.label" default="Total Comment" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalComment" type="number" value="${newsSourceInstance.totalComment}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceInstance, field: 'totalVote', 'error')} required">
	<label for="totalVote">
		<g:message code="newsSource.totalVote.label" default="Total Vote" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalVote" type="number" value="${newsSourceInstance.totalVote}" required=""/>

</div>

