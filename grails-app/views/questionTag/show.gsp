
<%@ page import="com.bddesh24.QuestionTag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'questionTag.label', default: 'QuestionTag')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-questionTag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-questionTag" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list questionTag">
			
				<g:if test="${questionTagInstance?.questionTag}">
				<li class="fieldcontain">
					<span id="questionTag-label" class="property-label"><g:message code="questionTag.questionTag.label" default="Question Tag" /></span>
					
						<span class="property-value" aria-labelledby="questionTag-label"><g:fieldValue bean="${questionTagInstance}" field="questionTag"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionTagInstance?.coverImage}">
				<li class="fieldcontain">
					<span id="coverImage-label" class="property-label"><g:message code="questionTag.coverImage.label" default="Cover Image" /></span>
					
						<span class="property-value" aria-labelledby="coverImage-label"><g:fieldValue bean="${questionTagInstance}" field="coverImage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionTagInstance?.relatedHashwords}">
				<li class="fieldcontain">
					<span id="relatedHashwords-label" class="property-label"><g:message code="questionTag.relatedHashwords.label" default="Related Hashwords" /></span>
					
						<span class="property-value" aria-labelledby="relatedHashwords-label"><g:fieldValue bean="${questionTagInstance}" field="relatedHashwords"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionTagInstance?.tagDescription}">
				<li class="fieldcontain">
					<span id="tagDescription-label" class="property-label"><g:message code="questionTag.tagDescription.label" default="Tag Description" /></span>
					
						<span class="property-value" aria-labelledby="tagDescription-label"><g:fieldValue bean="${questionTagInstance}" field="tagDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionTagInstance?.questions}">
				<li class="fieldcontain">
					<span id="questions-label" class="property-label"><g:message code="questionTag.questions.label" default="Questions" /></span>
					
						<g:each in="${questionTagInstance.questions}" var="q">
						<span class="property-value" aria-labelledby="questions-label"><g:link controller="question" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${questionTagInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="questionTag.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${questionTagInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionTagInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="questionTag.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${questionTagInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionTagInstance?.featured}">
				<li class="fieldcontain">
					<span id="featured-label" class="property-label"><g:message code="questionTag.featured.label" default="Featured" /></span>
					
						<span class="property-value" aria-labelledby="featured-label"><g:formatBoolean boolean="${questionTagInstance?.featured}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionTagInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="questionTag.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${questionTagInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionTagInstance?.questionTagOwner}">
				<li class="fieldcontain">
					<span id="questionTagOwner-label" class="property-label"><g:message code="questionTag.questionTagOwner.label" default="Question Tag Owner" /></span>
					
						<span class="property-value" aria-labelledby="questionTagOwner-label"><g:link controller="user" action="show" id="${questionTagInstance?.questionTagOwner?.id}">${questionTagInstance?.questionTagOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionTagInstance?.totalQuestion}">
				<li class="fieldcontain">
					<span id="totalQuestion-label" class="property-label"><g:message code="questionTag.totalQuestion.label" default="Total Question" /></span>
					
						<span class="property-value" aria-labelledby="totalQuestion-label"><g:fieldValue bean="${questionTagInstance}" field="totalQuestion"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:questionTagInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${questionTagInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
