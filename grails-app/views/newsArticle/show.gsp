
<%@ page import="com.bddesh24.NewsArticle" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newsArticle.label', default: 'NewsArticle')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-newsArticle" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-newsArticle" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list newsArticle">
			
				<g:if test="${newsArticleInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="newsArticle.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${newsArticleInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsArticleInstance?.shortDescription}">
				<li class="fieldcontain">
					<span id="shortDescription-label" class="property-label"><g:message code="newsArticle.shortDescription.label" default="Short Description" /></span>
					
						<span class="property-value" aria-labelledby="shortDescription-label"><g:fieldValue bean="${newsArticleInstance}" field="shortDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsArticleInstance?.detailsDescription}">
				<li class="fieldcontain">
					<span id="detailsDescription-label" class="property-label"><g:message code="newsArticle.detailsDescription.label" default="Details Description" /></span>
					
						<span class="property-value" aria-labelledby="detailsDescription-label"><g:fieldValue bean="${newsArticleInstance}" field="detailsDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsArticleInstance?.imageName}">
				<li class="fieldcontain">
					<span id="imageName-label" class="property-label"><g:message code="newsArticle.imageName.label" default="Image Name" /></span>
					
						<span class="property-value" aria-labelledby="imageName-label"><g:fieldValue bean="${newsArticleInstance}" field="imageName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsArticleInstance?.hashWords}">
				<li class="fieldcontain">
					<span id="hashWords-label" class="property-label"><g:message code="newsArticle.hashWords.label" default="Hash Words" /></span>
					
						<span class="property-value" aria-labelledby="hashWords-label"><g:fieldValue bean="${newsArticleInstance}" field="hashWords"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsArticleInstance?.articleComments}">
				<li class="fieldcontain">
					<span id="articleComments-label" class="property-label"><g:message code="newsArticle.articleComments.label" default="Article Comments" /></span>
					
						<g:each in="${newsArticleInstance.articleComments}" var="a">
						<span class="property-value" aria-labelledby="articleComments-label"><g:link controller="articleComment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${newsArticleInstance?.articleOwner}">
				<li class="fieldcontain">
					<span id="articleOwner-label" class="property-label"><g:message code="newsArticle.articleOwner.label" default="Article Owner" /></span>
					
						<span class="property-value" aria-labelledby="articleOwner-label"><g:link controller="user" action="show" id="${newsArticleInstance?.articleOwner?.id}">${newsArticleInstance?.articleOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsArticleInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="newsArticle.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${newsArticleInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsArticleInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="newsArticle.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${newsArticleInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsArticleInstance?.featured}">
				<li class="fieldcontain">
					<span id="featured-label" class="property-label"><g:message code="newsArticle.featured.label" default="Featured" /></span>
					
						<span class="property-value" aria-labelledby="featured-label"><g:formatBoolean boolean="${newsArticleInstance?.featured}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsArticleInstance?.hasDetails}">
				<li class="fieldcontain">
					<span id="hasDetails-label" class="property-label"><g:message code="newsArticle.hasDetails.label" default="Has Details" /></span>
					
						<span class="property-value" aria-labelledby="hasDetails-label"><g:formatBoolean boolean="${newsArticleInstance?.hasDetails}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsArticleInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="newsArticle.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${newsArticleInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsArticleInstance?.postId}">
				<li class="fieldcontain">
					<span id="postId-label" class="property-label"><g:message code="newsArticle.postId.label" default="Post Id" /></span>
					
						<span class="property-value" aria-labelledby="postId-label"><g:fieldValue bean="${newsArticleInstance}" field="postId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsArticleInstance?.postType}">
				<li class="fieldcontain">
					<span id="postType-label" class="property-label"><g:message code="newsArticle.postType.label" default="Post Type" /></span>
					
						<span class="property-value" aria-labelledby="postType-label"><g:fieldValue bean="${newsArticleInstance}" field="postType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsArticleInstance?.totalComment}">
				<li class="fieldcontain">
					<span id="totalComment-label" class="property-label"><g:message code="newsArticle.totalComment.label" default="Total Comment" /></span>
					
						<span class="property-value" aria-labelledby="totalComment-label"><g:fieldValue bean="${newsArticleInstance}" field="totalComment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsArticleInstance?.totalLike}">
				<li class="fieldcontain">
					<span id="totalLike-label" class="property-label"><g:message code="newsArticle.totalLike.label" default="Total Like" /></span>
					
						<span class="property-value" aria-labelledby="totalLike-label"><g:fieldValue bean="${newsArticleInstance}" field="totalLike"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsArticleInstance?.totalView}">
				<li class="fieldcontain">
					<span id="totalView-label" class="property-label"><g:message code="newsArticle.totalView.label" default="Total View" /></span>
					
						<span class="property-value" aria-labelledby="totalView-label"><g:fieldValue bean="${newsArticleInstance}" field="totalView"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:newsArticleInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${newsArticleInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
