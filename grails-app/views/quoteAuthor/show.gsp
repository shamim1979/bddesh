
<%@ page import="com.bddesh24.QuoteAuthor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'quoteAuthor.label', default: 'QuoteAuthor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-quoteAuthor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-quoteAuthor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list quoteAuthor">
			
				<g:if test="${quoteAuthorInstance?.authorName}">
				<li class="fieldcontain">
					<span id="authorName-label" class="property-label"><g:message code="quoteAuthor.authorName.label" default="Author Name" /></span>
					
						<span class="property-value" aria-labelledby="authorName-label"><g:fieldValue bean="${quoteAuthorInstance}" field="authorName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteAuthorInstance?.displayName}">
				<li class="fieldcontain">
					<span id="displayName-label" class="property-label"><g:message code="quoteAuthor.displayName.label" default="Display Name" /></span>
					
						<span class="property-value" aria-labelledby="displayName-label"><g:fieldValue bean="${quoteAuthorInstance}" field="displayName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteAuthorInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="quoteAuthor.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${quoteAuthorInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteAuthorInstance?.profileImage}">
				<li class="fieldcontain">
					<span id="profileImage-label" class="property-label"><g:message code="quoteAuthor.profileImage.label" default="Profile Image" /></span>
					
						<span class="property-value" aria-labelledby="profileImage-label"><g:fieldValue bean="${quoteAuthorInstance}" field="profileImage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteAuthorInstance?.coverImage}">
				<li class="fieldcontain">
					<span id="coverImage-label" class="property-label"><g:message code="quoteAuthor.coverImage.label" default="Cover Image" /></span>
					
						<span class="property-value" aria-labelledby="coverImage-label"><g:fieldValue bean="${quoteAuthorInstance}" field="coverImage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteAuthorInstance?.dob}">
				<li class="fieldcontain">
					<span id="dob-label" class="property-label"><g:message code="quoteAuthor.dob.label" default="Dob" /></span>
					
						<span class="property-value" aria-labelledby="dob-label"><g:formatDate date="${quoteAuthorInstance?.dob}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteAuthorInstance?.dod}">
				<li class="fieldcontain">
					<span id="dod-label" class="property-label"><g:message code="quoteAuthor.dod.label" default="Dod" /></span>
					
						<span class="property-value" aria-labelledby="dod-label"><g:formatDate date="${quoteAuthorInstance?.dod}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteAuthorInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="quoteAuthor.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${quoteAuthorInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteAuthorInstance?.quotes}">
				<li class="fieldcontain">
					<span id="quotes-label" class="property-label"><g:message code="quoteAuthor.quotes.label" default="Quotes" /></span>
					
						<g:each in="${quoteAuthorInstance.quotes}" var="q">
						<span class="property-value" aria-labelledby="quotes-label"><g:link controller="quote" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${quoteAuthorInstance?.totalQuote}">
				<li class="fieldcontain">
					<span id="totalQuote-label" class="property-label"><g:message code="quoteAuthor.totalQuote.label" default="Total Quote" /></span>
					
						<span class="property-value" aria-labelledby="totalQuote-label"><g:fieldValue bean="${quoteAuthorInstance}" field="totalQuote"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:quoteAuthorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${quoteAuthorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
