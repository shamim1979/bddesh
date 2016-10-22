
<%@ page import="com.bddesh24.LatestNews" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'latestNews.label', default: 'LatestNews')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-latestNews" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-latestNews" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list latestNews">
			
				<g:if test="${latestNewsInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="latestNews.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${latestNewsInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${latestNewsInstance?.shortDescription}">
				<li class="fieldcontain">
					<span id="shortDescription-label" class="property-label"><g:message code="latestNews.shortDescription.label" default="Short Description" /></span>
					
						<span class="property-value" aria-labelledby="shortDescription-label"><g:fieldValue bean="${latestNewsInstance}" field="shortDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${latestNewsInstance?.imageName}">
				<li class="fieldcontain">
					<span id="imageName-label" class="property-label"><g:message code="latestNews.imageName.label" default="Image Name" /></span>
					
						<span class="property-value" aria-labelledby="imageName-label"><g:fieldValue bean="${latestNewsInstance}" field="imageName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${latestNewsInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="latestNews.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${latestNewsInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${latestNewsInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="latestNews.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${latestNewsInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${latestNewsInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="latestNews.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${latestNewsInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${latestNewsInstance?.postId}">
				<li class="fieldcontain">
					<span id="postId-label" class="property-label"><g:message code="latestNews.postId.label" default="Post Id" /></span>
					
						<span class="property-value" aria-labelledby="postId-label"><g:fieldValue bean="${latestNewsInstance}" field="postId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${latestNewsInstance?.postType}">
				<li class="fieldcontain">
					<span id="postType-label" class="property-label"><g:message code="latestNews.postType.label" default="Post Type" /></span>
					
						<span class="property-value" aria-labelledby="postType-label"><g:fieldValue bean="${latestNewsInstance}" field="postType"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:latestNewsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${latestNewsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
