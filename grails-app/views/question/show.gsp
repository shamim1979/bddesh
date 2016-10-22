
<%@ page import="com.bddesh24.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-question" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list question">
			
				<g:if test="${questionInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="question.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${questionInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.shortDescription}">
				<li class="fieldcontain">
					<span id="shortDescription-label" class="property-label"><g:message code="question.shortDescription.label" default="Short Description" /></span>
					
						<span class="property-value" aria-labelledby="shortDescription-label"><g:fieldValue bean="${questionInstance}" field="shortDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.questionTags}">
				<li class="fieldcontain">
					<span id="questionTags-label" class="property-label"><g:message code="question.questionTags.label" default="Question Tags" /></span>
					
						<span class="property-value" aria-labelledby="questionTags-label"><g:fieldValue bean="${questionInstance}" field="questionTags"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.imageName}">
				<li class="fieldcontain">
					<span id="imageName-label" class="property-label"><g:message code="question.imageName.label" default="Image Name" /></span>
					
						<span class="property-value" aria-labelledby="imageName-label"><g:fieldValue bean="${questionInstance}" field="imageName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.answers}">
				<li class="fieldcontain">
					<span id="answers-label" class="property-label"><g:message code="question.answers.label" default="Answers" /></span>
					
						<g:each in="${questionInstance.answers}" var="a">
						<span class="property-value" aria-labelledby="answers-label"><g:link controller="answer" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.bestAnswer}">
				<li class="fieldcontain">
					<span id="bestAnswer-label" class="property-label"><g:message code="question.bestAnswer.label" default="Best Answer" /></span>
					
						<span class="property-value" aria-labelledby="bestAnswer-label"><g:link controller="answer" action="show" id="${questionInstance?.bestAnswer?.id}">${questionInstance?.bestAnswer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="question.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${questionInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="question.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${questionInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.featured}">
				<li class="fieldcontain">
					<span id="featured-label" class="property-label"><g:message code="question.featured.label" default="Featured" /></span>
					
						<span class="property-value" aria-labelledby="featured-label"><g:formatBoolean boolean="${questionInstance?.featured}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="question.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${questionInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.postId}">
				<li class="fieldcontain">
					<span id="postId-label" class="property-label"><g:message code="question.postId.label" default="Post Id" /></span>
					
						<span class="property-value" aria-labelledby="postId-label"><g:fieldValue bean="${questionInstance}" field="postId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.questionOwner}">
				<li class="fieldcontain">
					<span id="questionOwner-label" class="property-label"><g:message code="question.questionOwner.label" default="Question Owner" /></span>
					
						<span class="property-value" aria-labelledby="questionOwner-label"><g:link controller="user" action="show" id="${questionInstance?.questionOwner?.id}">${questionInstance?.questionOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.totalAnswer}">
				<li class="fieldcontain">
					<span id="totalAnswer-label" class="property-label"><g:message code="question.totalAnswer.label" default="Total Answer" /></span>
					
						<span class="property-value" aria-labelledby="totalAnswer-label"><g:fieldValue bean="${questionInstance}" field="totalAnswer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.totalScore}">
				<li class="fieldcontain">
					<span id="totalScore-label" class="property-label"><g:message code="question.totalScore.label" default="Total Score" /></span>
					
						<span class="property-value" aria-labelledby="totalScore-label"><g:fieldValue bean="${questionInstance}" field="totalScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.totalView}">
				<li class="fieldcontain">
					<span id="totalView-label" class="property-label"><g:message code="question.totalView.label" default="Total View" /></span>
					
						<span class="property-value" aria-labelledby="totalView-label"><g:fieldValue bean="${questionInstance}" field="totalView"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.totalVote}">
				<li class="fieldcontain">
					<span id="totalVote-label" class="property-label"><g:message code="question.totalVote.label" default="Total Vote" /></span>
					
						<span class="property-value" aria-labelledby="totalVote-label"><g:fieldValue bean="${questionInstance}" field="totalVote"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:questionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${questionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
