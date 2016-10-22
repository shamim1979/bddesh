
<%@ page import="com.bddesh24.TopTen" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topTen.label', default: 'TopTen')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-topTen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-topTen" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list topTen">
			
				<g:if test="${topTenInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="topTen.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${topTenInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenInstance?.shortDescription}">
				<li class="fieldcontain">
					<span id="shortDescription-label" class="property-label"><g:message code="topTen.shortDescription.label" default="Short Description" /></span>
					
						<span class="property-value" aria-labelledby="shortDescription-label"><g:fieldValue bean="${topTenInstance}" field="shortDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenInstance?.detailsDescription}">
				<li class="fieldcontain">
					<span id="detailsDescription-label" class="property-label"><g:message code="topTen.detailsDescription.label" default="Details Description" /></span>
					
						<span class="property-value" aria-labelledby="detailsDescription-label"><g:fieldValue bean="${topTenInstance}" field="detailsDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenInstance?.topTenTags}">
				<li class="fieldcontain">
					<span id="topTenTags-label" class="property-label"><g:message code="topTen.topTenTags.label" default="Top Ten Tags" /></span>
					
						<span class="property-value" aria-labelledby="topTenTags-label"><g:fieldValue bean="${topTenInstance}" field="topTenTags"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenInstance?.imageName}">
				<li class="fieldcontain">
					<span id="imageName-label" class="property-label"><g:message code="topTen.imageName.label" default="Image Name" /></span>
					
						<span class="property-value" aria-labelledby="imageName-label"><g:fieldValue bean="${topTenInstance}" field="imageName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenInstance?.topTenItems}">
				<li class="fieldcontain">
					<span id="topTenItems-label" class="property-label"><g:message code="topTen.topTenItems.label" default="Top Ten Items" /></span>
					
						<g:each in="${topTenInstance.topTenItems}" var="t">
						<span class="property-value" aria-labelledby="topTenItems-label"><g:link controller="topTenItem" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${topTenInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="topTen.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${topTenInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="topTen.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${topTenInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenInstance?.featured}">
				<li class="fieldcontain">
					<span id="featured-label" class="property-label"><g:message code="topTen.featured.label" default="Featured" /></span>
					
						<span class="property-value" aria-labelledby="featured-label"><g:formatBoolean boolean="${topTenInstance?.featured}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="topTen.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${topTenInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenInstance?.postId}">
				<li class="fieldcontain">
					<span id="postId-label" class="property-label"><g:message code="topTen.postId.label" default="Post Id" /></span>
					
						<span class="property-value" aria-labelledby="postId-label"><g:fieldValue bean="${topTenInstance}" field="postId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenInstance?.topTenOwner}">
				<li class="fieldcontain">
					<span id="topTenOwner-label" class="property-label"><g:message code="topTen.topTenOwner.label" default="Top Ten Owner" /></span>
					
						<span class="property-value" aria-labelledby="topTenOwner-label"><g:link controller="user" action="show" id="${topTenInstance?.topTenOwner?.id}">${topTenInstance?.topTenOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenInstance?.totalImages}">
				<li class="fieldcontain">
					<span id="totalImages-label" class="property-label"><g:message code="topTen.totalImages.label" default="Total Images" /></span>
					
						<span class="property-value" aria-labelledby="totalImages-label"><g:fieldValue bean="${topTenInstance}" field="totalImages"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenInstance?.totalScore}">
				<li class="fieldcontain">
					<span id="totalScore-label" class="property-label"><g:message code="topTen.totalScore.label" default="Total Score" /></span>
					
						<span class="property-value" aria-labelledby="totalScore-label"><g:fieldValue bean="${topTenInstance}" field="totalScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenInstance?.totalTopTenItem}">
				<li class="fieldcontain">
					<span id="totalTopTenItem-label" class="property-label"><g:message code="topTen.totalTopTenItem.label" default="Total Top Ten Item" /></span>
					
						<span class="property-value" aria-labelledby="totalTopTenItem-label"><g:fieldValue bean="${topTenInstance}" field="totalTopTenItem"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenInstance?.totalView}">
				<li class="fieldcontain">
					<span id="totalView-label" class="property-label"><g:message code="topTen.totalView.label" default="Total View" /></span>
					
						<span class="property-value" aria-labelledby="totalView-label"><g:fieldValue bean="${topTenInstance}" field="totalView"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenInstance?.totalVote}">
				<li class="fieldcontain">
					<span id="totalVote-label" class="property-label"><g:message code="topTen.totalVote.label" default="Total Vote" /></span>
					
						<span class="property-value" aria-labelledby="totalVote-label"><g:fieldValue bean="${topTenInstance}" field="totalVote"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:topTenInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${topTenInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
