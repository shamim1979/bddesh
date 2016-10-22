
<%@ page import="com.bddesh24.ArticleComment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'articleComment.label', default: 'ArticleComment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-articleComment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-articleComment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list articleComment">
			
				<g:if test="${articleCommentInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="articleComment.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${articleCommentInstance}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${articleCommentInstance?.commentOwner}">
				<li class="fieldcontain">
					<span id="commentOwner-label" class="property-label"><g:message code="articleComment.commentOwner.label" default="Comment Owner" /></span>
					
						<span class="property-value" aria-labelledby="commentOwner-label"><g:link controller="user" action="show" id="${articleCommentInstance?.commentOwner?.id}">${articleCommentInstance?.commentOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${articleCommentInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="articleComment.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${articleCommentInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${articleCommentInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="articleComment.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${articleCommentInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${articleCommentInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="articleComment.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${articleCommentInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${articleCommentInstance?.newsArticle}">
				<li class="fieldcontain">
					<span id="newsArticle-label" class="property-label"><g:message code="articleComment.newsArticle.label" default="News Article" /></span>
					
						<span class="property-value" aria-labelledby="newsArticle-label"><g:link controller="newsArticle" action="show" id="${articleCommentInstance?.newsArticle?.id}">${articleCommentInstance?.newsArticle?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${articleCommentInstance?.totalLike}">
				<li class="fieldcontain">
					<span id="totalLike-label" class="property-label"><g:message code="articleComment.totalLike.label" default="Total Like" /></span>
					
						<span class="property-value" aria-labelledby="totalLike-label"><g:fieldValue bean="${articleCommentInstance}" field="totalLike"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:articleCommentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${articleCommentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
