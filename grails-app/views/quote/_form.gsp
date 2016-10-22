<%@ page import="com.bddesh24.Quote" %>



<div class="fieldcontain ${hasErrors(bean: quoteInstance, field: 'quote', 'error')} required">
	<label for="quote">
		<g:message code="quote.quote.label" default="Quote" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="quote" cols="40" rows="5" maxlength="600" required="" value="${quoteInstance?.quote}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: quoteInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="quote.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${quoteInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: quoteInstance, field: 'imageName', 'error')} ">
	<label for="imageName">
		<g:message code="quote.imageName.label" default="Image Name" />
		
	</label>
	<g:textField name="imageName" value="${quoteInstance?.imageName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: quoteInstance, field: 'topicHashword', 'error')} ">
	<label for="topicHashword">
		<g:message code="quote.topicHashword.label" default="Topic Hashword" />
		
	</label>
	<g:textArea name="topicHashword" cols="40" rows="5" maxlength="500" value="${quoteInstance?.topicHashword}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: quoteInstance, field: 'quoteComments', 'error')} ">
	<label for="quoteComments">
		<g:message code="quote.quoteComments.label" default="Quote Comments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${quoteInstance?.quoteComments?}" var="q">
    <li><g:link controller="quoteComment" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="quoteComment" action="create" params="['quote.id': quoteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'quoteComment.label', default: 'QuoteComment')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: quoteInstance, field: 'quoteAuthor', 'error')} ">
	<label for="quoteAuthor">
		<g:message code="quote.quoteAuthor.label" default="Quote Author" />
		
	</label>
	<g:textField name="quoteAuthor" maxlength="150" value="${quoteInstance?.quoteAuthor}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: quoteInstance, field: 'quoteAuthorName', 'error')} ">
	<label for="quoteAuthorName">
		<g:message code="quote.quoteAuthorName.label" default="Quote Author Name" />
		
	</label>
	<g:textField name="quoteAuthorName" maxlength="150" value="${quoteInstance?.quoteAuthorName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: quoteInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="quote.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${quoteInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: quoteInstance, field: 'featured', 'error')} ">
	<label for="featured">
		<g:message code="quote.featured.label" default="Featured" />
		
	</label>
	<g:checkBox name="featured" value="${quoteInstance?.featured}" />

</div>

<div class="fieldcontain ${hasErrors(bean: quoteInstance, field: 'postId', 'error')} required">
	<label for="postId">
		<g:message code="quote.postId.label" default="Post Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="postId" type="number" value="${quoteInstance.postId}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: quoteInstance, field: 'quoteOwner', 'error')} required">
	<label for="quoteOwner">
		<g:message code="quote.quoteOwner.label" default="Quote Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="quoteOwner" name="quoteOwner.id" from="${com.bddesh24.User.list()}" optionKey="id" required="" value="${quoteInstance?.quoteOwner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: quoteInstance, field: 'totalComment', 'error')} required">
	<label for="totalComment">
		<g:message code="quote.totalComment.label" default="Total Comment" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalComment" type="number" value="${quoteInstance.totalComment}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: quoteInstance, field: 'totalLike', 'error')} required">
	<label for="totalLike">
		<g:message code="quote.totalLike.label" default="Total Like" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalLike" type="number" value="${quoteInstance.totalLike}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: quoteInstance, field: 'totalView', 'error')} required">
	<label for="totalView">
		<g:message code="quote.totalView.label" default="Total View" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalView" type="number" value="${quoteInstance.totalView}" required=""/>

</div>

