
<%@ page import="com.bddesh24.Quote" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'quote.label', default: 'Quote')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-quote" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-quote" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list quote">
			
				<g:if test="${quoteInstance?.quote}">
				<li class="fieldcontain">
					<span id="quote-label" class="property-label"><g:message code="quote.quote.label" default="Quote" /></span>
					
						<span class="property-value" aria-labelledby="quote-label"><g:fieldValue bean="${quoteInstance}" field="quote"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="quote.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${quoteInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteInstance?.imageName}">
				<li class="fieldcontain">
					<span id="imageName-label" class="property-label"><g:message code="quote.imageName.label" default="Image Name" /></span>
					
						<span class="property-value" aria-labelledby="imageName-label"><g:fieldValue bean="${quoteInstance}" field="imageName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteInstance?.topicHashword}">
				<li class="fieldcontain">
					<span id="topicHashword-label" class="property-label"><g:message code="quote.topicHashword.label" default="Topic Hashword" /></span>
					
						<span class="property-value" aria-labelledby="topicHashword-label"><g:fieldValue bean="${quoteInstance}" field="topicHashword"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteInstance?.quoteComments}">
				<li class="fieldcontain">
					<span id="quoteComments-label" class="property-label"><g:message code="quote.quoteComments.label" default="Quote Comments" /></span>
					
						<g:each in="${quoteInstance.quoteComments}" var="q">
						<span class="property-value" aria-labelledby="quoteComments-label"><g:link controller="quoteComment" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${quoteInstance?.quoteAuthor}">
				<li class="fieldcontain">
					<span id="quoteAuthor-label" class="property-label"><g:message code="quote.quoteAuthor.label" default="Quote Author" /></span>
					
						<span class="property-value" aria-labelledby="quoteAuthor-label"><g:fieldValue bean="${quoteInstance}" field="quoteAuthor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteInstance?.quoteAuthorName}">
				<li class="fieldcontain">
					<span id="quoteAuthorName-label" class="property-label"><g:message code="quote.quoteAuthorName.label" default="Quote Author Name" /></span>
					
						<span class="property-value" aria-labelledby="quoteAuthorName-label"><g:fieldValue bean="${quoteInstance}" field="quoteAuthorName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="quote.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${quoteInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="quote.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${quoteInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteInstance?.featured}">
				<li class="fieldcontain">
					<span id="featured-label" class="property-label"><g:message code="quote.featured.label" default="Featured" /></span>
					
						<span class="property-value" aria-labelledby="featured-label"><g:formatBoolean boolean="${quoteInstance?.featured}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="quote.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${quoteInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteInstance?.postId}">
				<li class="fieldcontain">
					<span id="postId-label" class="property-label"><g:message code="quote.postId.label" default="Post Id" /></span>
					
						<span class="property-value" aria-labelledby="postId-label"><g:fieldValue bean="${quoteInstance}" field="postId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteInstance?.quoteOwner}">
				<li class="fieldcontain">
					<span id="quoteOwner-label" class="property-label"><g:message code="quote.quoteOwner.label" default="Quote Owner" /></span>
					
						<span class="property-value" aria-labelledby="quoteOwner-label"><g:link controller="user" action="show" id="${quoteInstance?.quoteOwner?.id}">${quoteInstance?.quoteOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteInstance?.totalComment}">
				<li class="fieldcontain">
					<span id="totalComment-label" class="property-label"><g:message code="quote.totalComment.label" default="Total Comment" /></span>
					
						<span class="property-value" aria-labelledby="totalComment-label"><g:fieldValue bean="${quoteInstance}" field="totalComment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteInstance?.totalLike}">
				<li class="fieldcontain">
					<span id="totalLike-label" class="property-label"><g:message code="quote.totalLike.label" default="Total Like" /></span>
					
						<span class="property-value" aria-labelledby="totalLike-label"><g:fieldValue bean="${quoteInstance}" field="totalLike"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quoteInstance?.totalView}">
				<li class="fieldcontain">
					<span id="totalView-label" class="property-label"><g:message code="quote.totalView.label" default="Total View" /></span>
					
						<span class="property-value" aria-labelledby="totalView-label"><g:fieldValue bean="${quoteInstance}" field="totalView"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:quoteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${quoteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
