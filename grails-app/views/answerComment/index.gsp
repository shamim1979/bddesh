
<%@ page import="com.bddesh24.AnswerComment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'answerComment.label', default: 'AnswerComment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-answerComment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-answerComment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="comment" title="${message(code: 'answerComment.comment.label', default: 'Comment')}" />
					
						<th><g:message code="answerComment.answer.label" default="Answer" /></th>
					
						<th><g:message code="answerComment.commentOwner.label" default="Comment Owner" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'answerComment.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'answerComment.enabled.label', default: 'Enabled')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'answerComment.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${answerCommentInstanceList}" status="i" var="answerCommentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${answerCommentInstance.id}">${fieldValue(bean: answerCommentInstance, field: "comment")}</g:link></td>
					
						<td>${fieldValue(bean: answerCommentInstance, field: "answer")}</td>
					
						<td>${fieldValue(bean: answerCommentInstance, field: "commentOwner")}</td>
					
						<td><g:formatDate date="${answerCommentInstance.dateCreated}" /></td>
					
						<td><g:formatBoolean boolean="${answerCommentInstance.enabled}" /></td>
					
						<td><g:formatDate date="${answerCommentInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${answerCommentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
