
<%@ page import="com.bddesh24.ArticleHashWord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'articleHashWord.label', default: 'ArticleHashWord')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-articleHashWord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-articleHashWord" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list articleHashWord">
			
				<g:if test="${articleHashWordInstance?.hashWord}">
				<li class="fieldcontain">
					<span id="hashWord-label" class="property-label"><g:message code="articleHashWord.hashWord.label" default="Hash Word" /></span>
					
						<span class="property-value" aria-labelledby="hashWord-label"><g:fieldValue bean="${articleHashWordInstance}" field="hashWord"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${articleHashWordInstance?.hashWordTitle}">
				<li class="fieldcontain">
					<span id="hashWordTitle-label" class="property-label"><g:message code="articleHashWord.hashWordTitle.label" default="Hash Word Title" /></span>
					
						<span class="property-value" aria-labelledby="hashWordTitle-label"><g:fieldValue bean="${articleHashWordInstance}" field="hashWordTitle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${articleHashWordInstance?.coverImage}">
				<li class="fieldcontain">
					<span id="coverImage-label" class="property-label"><g:message code="articleHashWord.coverImage.label" default="Cover Image" /></span>
					
						<span class="property-value" aria-labelledby="coverImage-label"><g:fieldValue bean="${articleHashWordInstance}" field="coverImage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${articleHashWordInstance?.relatedHashwords}">
				<li class="fieldcontain">
					<span id="relatedHashwords-label" class="property-label"><g:message code="articleHashWord.relatedHashwords.label" default="Related Hashwords" /></span>
					
						<span class="property-value" aria-labelledby="relatedHashwords-label"><g:fieldValue bean="${articleHashWordInstance}" field="relatedHashwords"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${articleHashWordInstance?.newsArticles}">
				<li class="fieldcontain">
					<span id="newsArticles-label" class="property-label"><g:message code="articleHashWord.newsArticles.label" default="News Articles" /></span>
					
						<g:each in="${articleHashWordInstance.newsArticles}" var="n">
						<span class="property-value" aria-labelledby="newsArticles-label"><g:link controller="newsArticle" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${articleHashWordInstance?.articleHashWordOwner}">
				<li class="fieldcontain">
					<span id="articleHashWordOwner-label" class="property-label"><g:message code="articleHashWord.articleHashWordOwner.label" default="Article Hash Word Owner" /></span>
					
						<span class="property-value" aria-labelledby="articleHashWordOwner-label"><g:link controller="user" action="show" id="${articleHashWordInstance?.articleHashWordOwner?.id}">${articleHashWordInstance?.articleHashWordOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${articleHashWordInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="articleHashWord.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${articleHashWordInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${articleHashWordInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="articleHashWord.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${articleHashWordInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${articleHashWordInstance?.featured}">
				<li class="fieldcontain">
					<span id="featured-label" class="property-label"><g:message code="articleHashWord.featured.label" default="Featured" /></span>
					
						<span class="property-value" aria-labelledby="featured-label"><g:formatBoolean boolean="${articleHashWordInstance?.featured}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${articleHashWordInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="articleHashWord.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${articleHashWordInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${articleHashWordInstance?.totalArticle}">
				<li class="fieldcontain">
					<span id="totalArticle-label" class="property-label"><g:message code="articleHashWord.totalArticle.label" default="Total Article" /></span>
					
						<span class="property-value" aria-labelledby="totalArticle-label"><g:fieldValue bean="${articleHashWordInstance}" field="totalArticle"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:articleHashWordInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${articleHashWordInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
