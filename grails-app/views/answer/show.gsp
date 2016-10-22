
<%@ page import="com.bddesh24.Answer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'answer.label', default: 'Answer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-answer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-answer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list answer">
			
				<g:if test="${answerInstance?.detailsDescription}">
				<li class="fieldcontain">
					<span id="detailsDescription-label" class="property-label"><g:message code="answer.detailsDescription.label" default="Details Description" /></span>
					
						<span class="property-value" aria-labelledby="detailsDescription-label"><g:fieldValue bean="${answerInstance}" field="detailsDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerInstance?.imageName}">
				<li class="fieldcontain">
					<span id="imageName-label" class="property-label"><g:message code="answer.imageName.label" default="Image Name" /></span>
					
						<span class="property-value" aria-labelledby="imageName-label"><g:fieldValue bean="${answerInstance}" field="imageName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerInstance?.answerComments}">
				<li class="fieldcontain">
					<span id="answerComments-label" class="property-label"><g:message code="answer.answerComments.label" default="Answer Comments" /></span>
					
						<g:each in="${answerInstance.answerComments}" var="a">
						<span class="property-value" aria-labelledby="answerComments-label"><g:link controller="answerComment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${answerInstance?.answerOwner}">
				<li class="fieldcontain">
					<span id="answerOwner-label" class="property-label"><g:message code="answer.answerOwner.label" default="Answer Owner" /></span>
					
						<span class="property-value" aria-labelledby="answerOwner-label"><g:link controller="user" action="show" id="${answerInstance?.answerOwner?.id}">${answerInstance?.answerOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="answer.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${answerInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="answer.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${answerInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerInstance?.isBest}">
				<li class="fieldcontain">
					<span id="isBest-label" class="property-label"><g:message code="answer.isBest.label" default="Is Best" /></span>
					
						<span class="property-value" aria-labelledby="isBest-label"><g:formatBoolean boolean="${answerInstance?.isBest}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="answer.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${answerInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="answer.question.label" default="Question" /></span>
					
						<span class="property-value" aria-labelledby="question-label"><g:link controller="question" action="show" id="${answerInstance?.question?.id}">${answerInstance?.question?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerInstance?.totalComment}">
				<li class="fieldcontain">
					<span id="totalComment-label" class="property-label"><g:message code="answer.totalComment.label" default="Total Comment" /></span>
					
						<span class="property-value" aria-labelledby="totalComment-label"><g:fieldValue bean="${answerInstance}" field="totalComment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerInstance?.totalScore}">
				<li class="fieldcontain">
					<span id="totalScore-label" class="property-label"><g:message code="answer.totalScore.label" default="Total Score" /></span>
					
						<span class="property-value" aria-labelledby="totalScore-label"><g:fieldValue bean="${answerInstance}" field="totalScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerInstance?.totalView}">
				<li class="fieldcontain">
					<span id="totalView-label" class="property-label"><g:message code="answer.totalView.label" default="Total View" /></span>
					
						<span class="property-value" aria-labelledby="totalView-label"><g:fieldValue bean="${answerInstance}" field="totalView"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerInstance?.totalVote}">
				<li class="fieldcontain">
					<span id="totalVote-label" class="property-label"><g:message code="answer.totalVote.label" default="Total Vote" /></span>
					
						<span class="property-value" aria-labelledby="totalVote-label"><g:fieldValue bean="${answerInstance}" field="totalVote"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:answerInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${answerInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
