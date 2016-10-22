
<%@ page import="com.bddesh24.TopTenTag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topTenTag.label', default: 'TopTenTag')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-topTenTag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-topTenTag" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list topTenTag">
			
				<g:if test="${topTenTagInstance?.topTenTag}">
				<li class="fieldcontain">
					<span id="topTenTag-label" class="property-label"><g:message code="topTenTag.topTenTag.label" default="Top Ten Tag" /></span>
					
						<span class="property-value" aria-labelledby="topTenTag-label"><g:fieldValue bean="${topTenTagInstance}" field="topTenTag"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenTagInstance?.coverImage}">
				<li class="fieldcontain">
					<span id="coverImage-label" class="property-label"><g:message code="topTenTag.coverImage.label" default="Cover Image" /></span>
					
						<span class="property-value" aria-labelledby="coverImage-label"><g:fieldValue bean="${topTenTagInstance}" field="coverImage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenTagInstance?.relatedHashwords}">
				<li class="fieldcontain">
					<span id="relatedHashwords-label" class="property-label"><g:message code="topTenTag.relatedHashwords.label" default="Related Hashwords" /></span>
					
						<span class="property-value" aria-labelledby="relatedHashwords-label"><g:fieldValue bean="${topTenTagInstance}" field="relatedHashwords"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenTagInstance?.tagDescription}">
				<li class="fieldcontain">
					<span id="tagDescription-label" class="property-label"><g:message code="topTenTag.tagDescription.label" default="Tag Description" /></span>
					
						<span class="property-value" aria-labelledby="tagDescription-label"><g:fieldValue bean="${topTenTagInstance}" field="tagDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenTagInstance?.topTens}">
				<li class="fieldcontain">
					<span id="topTens-label" class="property-label"><g:message code="topTenTag.topTens.label" default="Top Tens" /></span>
					
						<g:each in="${topTenTagInstance.topTens}" var="t">
						<span class="property-value" aria-labelledby="topTens-label"><g:link controller="topTen" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${topTenTagInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="topTenTag.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${topTenTagInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenTagInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="topTenTag.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${topTenTagInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenTagInstance?.featured}">
				<li class="fieldcontain">
					<span id="featured-label" class="property-label"><g:message code="topTenTag.featured.label" default="Featured" /></span>
					
						<span class="property-value" aria-labelledby="featured-label"><g:formatBoolean boolean="${topTenTagInstance?.featured}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenTagInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="topTenTag.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${topTenTagInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenTagInstance?.topTenTagOwner}">
				<li class="fieldcontain">
					<span id="topTenTagOwner-label" class="property-label"><g:message code="topTenTag.topTenTagOwner.label" default="Top Ten Tag Owner" /></span>
					
						<span class="property-value" aria-labelledby="topTenTagOwner-label"><g:link controller="user" action="show" id="${topTenTagInstance?.topTenTagOwner?.id}">${topTenTagInstance?.topTenTagOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenTagInstance?.totalTopTen}">
				<li class="fieldcontain">
					<span id="totalTopTen-label" class="property-label"><g:message code="topTenTag.totalTopTen.label" default="Total Top Ten" /></span>
					
						<span class="property-value" aria-labelledby="totalTopTen-label"><g:fieldValue bean="${topTenTagInstance}" field="totalTopTen"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:topTenTagInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${topTenTagInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
