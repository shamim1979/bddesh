
<%@ page import="com.bddesh24.Poll" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'poll.label', default: 'Poll')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-poll" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-poll" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list poll">
			
				<g:if test="${pollInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="poll.question.label" default="Question" /></span>
					
						<span class="property-value" aria-labelledby="question-label"><g:fieldValue bean="${pollInstance}" field="question"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollInstance?.shortDescription}">
				<li class="fieldcontain">
					<span id="shortDescription-label" class="property-label"><g:message code="poll.shortDescription.label" default="Short Description" /></span>
					
						<span class="property-value" aria-labelledby="shortDescription-label"><g:fieldValue bean="${pollInstance}" field="shortDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollInstance?.pollTags}">
				<li class="fieldcontain">
					<span id="pollTags-label" class="property-label"><g:message code="poll.pollTags.label" default="Poll Tags" /></span>
					
						<span class="property-value" aria-labelledby="pollTags-label"><g:fieldValue bean="${pollInstance}" field="pollTags"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollInstance?.imageName}">
				<li class="fieldcontain">
					<span id="imageName-label" class="property-label"><g:message code="poll.imageName.label" default="Image Name" /></span>
					
						<span class="property-value" aria-labelledby="imageName-label"><g:fieldValue bean="${pollInstance}" field="imageName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollInstance?.pollItems}">
				<li class="fieldcontain">
					<span id="pollItems-label" class="property-label"><g:message code="poll.pollItems.label" default="Poll Items" /></span>
					
						<g:each in="${pollInstance.pollItems}" var="p">
						<span class="property-value" aria-labelledby="pollItems-label"><g:link controller="pollItem" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${pollInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="poll.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${pollInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="poll.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${pollInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollInstance?.featured}">
				<li class="fieldcontain">
					<span id="featured-label" class="property-label"><g:message code="poll.featured.label" default="Featured" /></span>
					
						<span class="property-value" aria-labelledby="featured-label"><g:formatBoolean boolean="${pollInstance?.featured}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="poll.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${pollInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollInstance?.pollOwner}">
				<li class="fieldcontain">
					<span id="pollOwner-label" class="property-label"><g:message code="poll.pollOwner.label" default="Poll Owner" /></span>
					
						<span class="property-value" aria-labelledby="pollOwner-label"><g:link controller="user" action="show" id="${pollInstance?.pollOwner?.id}">${pollInstance?.pollOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollInstance?.postId}">
				<li class="fieldcontain">
					<span id="postId-label" class="property-label"><g:message code="poll.postId.label" default="Post Id" /></span>
					
						<span class="property-value" aria-labelledby="postId-label"><g:fieldValue bean="${pollInstance}" field="postId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollInstance?.totalLike}">
				<li class="fieldcontain">
					<span id="totalLike-label" class="property-label"><g:message code="poll.totalLike.label" default="Total Like" /></span>
					
						<span class="property-value" aria-labelledby="totalLike-label"><g:fieldValue bean="${pollInstance}" field="totalLike"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollInstance?.totalScore}">
				<li class="fieldcontain">
					<span id="totalScore-label" class="property-label"><g:message code="poll.totalScore.label" default="Total Score" /></span>
					
						<span class="property-value" aria-labelledby="totalScore-label"><g:fieldValue bean="${pollInstance}" field="totalScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollInstance?.totalView}">
				<li class="fieldcontain">
					<span id="totalView-label" class="property-label"><g:message code="poll.totalView.label" default="Total View" /></span>
					
						<span class="property-value" aria-labelledby="totalView-label"><g:fieldValue bean="${pollInstance}" field="totalView"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:pollInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${pollInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
