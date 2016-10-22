<%@ page import="com.bddesh24.QuoteAuthor" %>



<div class="fieldcontain ${hasErrors(bean: quoteAuthorInstance, field: 'authorName', 'error')} required">
	<label for="authorName">
		<g:message code="quoteAuthor.authorName.label" default="Author Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="authorName" maxlength="150" required="" value="${quoteAuthorInstance?.authorName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: quoteAuthorInstance, field: 'displayName', 'error')} ">
	<label for="displayName">
		<g:message code="quoteAuthor.displayName.label" default="Display Name" />
		
	</label>
	<g:textField name="displayName" maxlength="150" value="${quoteAuthorInstance?.displayName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: quoteAuthorInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="quoteAuthor.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${quoteAuthorInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: quoteAuthorInstance, field: 'profileImage', 'error')} ">
	<label for="profileImage">
		<g:message code="quoteAuthor.profileImage.label" default="Profile Image" />
		
	</label>
	<g:textField name="profileImage" value="${quoteAuthorInstance?.profileImage}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: quoteAuthorInstance, field: 'coverImage', 'error')} ">
	<label for="coverImage">
		<g:message code="quoteAuthor.coverImage.label" default="Cover Image" />
		
	</label>
	<g:textField name="coverImage" value="${quoteAuthorInstance?.coverImage}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: quoteAuthorInstance, field: 'dob', 'error')} ">
	<label for="dob">
		<g:message code="quoteAuthor.dob.label" default="Dob" />
		
	</label>
	<g:datePicker name="dob" precision="day"  value="${quoteAuthorInstance?.dob}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: quoteAuthorInstance, field: 'dod', 'error')} ">
	<label for="dod">
		<g:message code="quoteAuthor.dod.label" default="Dod" />
		
	</label>
	<g:datePicker name="dod" precision="day"  value="${quoteAuthorInstance?.dod}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: quoteAuthorInstance, field: 'quotes', 'error')} ">
	<label for="quotes">
		<g:message code="quoteAuthor.quotes.label" default="Quotes" />
		
	</label>
	<g:select name="quotes" from="${com.bddesh24.Quote.list()}" multiple="multiple" optionKey="id" size="5" value="${quoteAuthorInstance?.quotes*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: quoteAuthorInstance, field: 'totalQuote', 'error')} required">
	<label for="totalQuote">
		<g:message code="quoteAuthor.totalQuote.label" default="Total Quote" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalQuote" type="number" value="${quoteAuthorInstance.totalQuote}" required=""/>

</div>

