
<%@ page import="com.bddesh24.AnswerComment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'answerComment.label', default: 'AnswerComment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-answerComment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-answerComment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list answerComment">
			
				<g:if test="${answerCommentInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="answerComment.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${answerCommentInstance}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerCommentInstance?.answer}">
				<li class="fieldcontain">
					<span id="answer-label" class="property-label"><g:message code="answerComment.answer.label" default="Answer" /></span>
					
						<span class="property-value" aria-labelledby="answer-label"><g:link controller="answer" action="show" id="${answerCommentInstance?.answer?.id}">${answerCommentInstance?.answer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerCommentInstance?.commentOwner}">
				<li class="fieldcontain">
					<span id="commentOwner-label" class="property-label"><g:message code="answerComment.commentOwner.label" default="Comment Owner" /></span>
					
						<span class="property-value" aria-labelledby="commentOwner-label"><g:link controller="user" action="show" id="${answerCommentInstance?.commentOwner?.id}">${answerCommentInstance?.commentOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerCommentInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="answerComment.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${answerCommentInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerCommentInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="answerComment.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${answerCommentInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerCommentInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="answerComment.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${answerCommentInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerCommentInstance?.totalLike}">
				<li class="fieldcontain">
					<span id="totalLike-label" class="property-label"><g:message code="answerComment.totalLike.label" default="Total Like" /></span>
					
						<span class="property-value" aria-labelledby="totalLike-label"><g:fieldValue bean="${answerCommentInstance}" field="totalLike"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:answerCommentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${answerCommentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
