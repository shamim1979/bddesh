<%@ page import="com.bddesh24.NewsSourceItem" %>



<div class="fieldcontain ${hasErrors(bean: newsSourceItemInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="newsSourceItem.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="title" cols="40" rows="5" maxlength="300" required="" value="${newsSourceItemInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceItemInstance, field: 'shortDescription', 'error')} ">
	<label for="shortDescription">
		<g:message code="newsSourceItem.shortDescription.label" default="Short Description" />
		
	</label>
	<g:textArea name="shortDescription" cols="40" rows="5" maxlength="500" value="${newsSourceItemInstance?.shortDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceItemInstance, field: 'newsSourceTag', 'error')} ">
	<label for="newsSourceTag">
		<g:message code="newsSourceItem.newsSourceTag.label" default="News Source Tag" />
		
	</label>
	<g:textArea name="newsSourceTag" cols="40" rows="5" maxlength="500" value="${newsSourceItemInstance?.newsSourceTag}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceItemInstance, field: 'newsLinks', 'error')} required">
	<label for="newsLinks">
		<g:message code="newsSourceItem.newsLinks.label" default="News Links" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="newsLinks" cols="40" rows="5" maxlength="14000" required="" value="${newsSourceItemInstance?.newsLinks}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceItemInstance, field: 'newsSourceItemComment', 'error')} ">
	<label for="newsSourceItemComment">
		<g:message code="newsSourceItem.newsSourceItemComment.label" default="News Source Item Comment" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${newsSourceItemInstance?.newsSourceItemComment?}" var="n">
    <li><g:link controller="newsSourceItemComment" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="newsSourceItemComment" action="create" params="['newsSourceItem.id': newsSourceItemInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'newsSourceItemComment.label', default: 'NewsSourceItemComment')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceItemInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="newsSourceItem.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${newsSourceItemInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceItemInstance, field: 'newsSource', 'error')} required">
	<label for="newsSource">
		<g:message code="newsSourceItem.newsSource.label" default="News Source" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="newsSource" name="newsSource.id" from="${com.bddesh24.NewsSource.list()}" optionKey="id" required="" value="${newsSourceItemInstance?.newsSource?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceItemInstance, field: 'totalComment', 'error')} required">
	<label for="totalComment">
		<g:message code="newsSourceItem.totalComment.label" default="Total Comment" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalComment" type="number" value="${newsSourceItemInstance.totalComment}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsSourceItemInstance, field: 'totalVote', 'error')} required">
	<label for="totalVote">
		<g:message code="newsSourceItem.totalVote.label" default="Total Vote" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalVote" type="number" value="${newsSourceItemInstance.totalVote}" required=""/>

</div>

