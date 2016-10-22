
<%@ page import="com.bddesh24.ArticleComment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'articleComment.label', default: 'ArticleComment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-articleComment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-articleComment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="comment" title="${message(code: 'articleComment.comment.label', default: 'Comment')}" />
					
						<th><g:message code="articleComment.commentOwner.label" default="Comment Owner" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'articleComment.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'articleComment.enabled.label', default: 'Enabled')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'articleComment.lastUpdated.label', default: 'Last Updated')}" />
					
						<th><g:message code="articleComment.newsArticle.label" default="News Article" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${articleCommentInstanceList}" status="i" var="articleCommentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${articleCommentInstance.id}">${fieldValue(bean: articleCommentInstance, field: "comment")}</g:link></td>
					
						<td>${fieldValue(bean: articleCommentInstance, field: "commentOwner")}</td>
					
						<td><g:formatDate date="${articleCommentInstance.dateCreated}" /></td>
					
						<td><g:formatBoolean boolean="${articleCommentInstance.enabled}" /></td>
					
						<td><g:formatDate date="${articleCommentInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: articleCommentInstance, field: "newsArticle")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${articleCommentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
