
<%@ page import="com.bddesh24.TopTenItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topTenItem.label', default: 'TopTenItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-topTenItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-topTenItem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list topTenItem">
			
				<g:if test="${topTenItemInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="topTenItem.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${topTenItemInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenItemInstance?.shortDescription}">
				<li class="fieldcontain">
					<span id="shortDescription-label" class="property-label"><g:message code="topTenItem.shortDescription.label" default="Short Description" /></span>
					
						<span class="property-value" aria-labelledby="shortDescription-label"><g:fieldValue bean="${topTenItemInstance}" field="shortDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenItemInstance?.imageName}">
				<li class="fieldcontain">
					<span id="imageName-label" class="property-label"><g:message code="topTenItem.imageName.label" default="Image Name" /></span>
					
						<span class="property-value" aria-labelledby="imageName-label"><g:fieldValue bean="${topTenItemInstance}" field="imageName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenItemInstance?.topTenOpinions}">
				<li class="fieldcontain">
					<span id="topTenOpinions-label" class="property-label"><g:message code="topTenItem.topTenOpinions.label" default="Top Ten Opinions" /></span>
					
						<g:each in="${topTenItemInstance.topTenOpinions}" var="t">
						<span class="property-value" aria-labelledby="topTenOpinions-label"><g:link controller="topTenOpinion" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${topTenItemInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="topTenItem.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${topTenItemInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenItemInstance?.topTen}">
				<li class="fieldcontain">
					<span id="topTen-label" class="property-label"><g:message code="topTenItem.topTen.label" default="Top Ten" /></span>
					
						<span class="property-value" aria-labelledby="topTen-label"><g:link controller="topTen" action="show" id="${topTenItemInstance?.topTen?.id}">${topTenItemInstance?.topTen?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenItemInstance?.topTenItemOwner}">
				<li class="fieldcontain">
					<span id="topTenItemOwner-label" class="property-label"><g:message code="topTenItem.topTenItemOwner.label" default="Top Ten Item Owner" /></span>
					
						<span class="property-value" aria-labelledby="topTenItemOwner-label"><g:link controller="user" action="show" id="${topTenItemInstance?.topTenItemOwner?.id}">${topTenItemInstance?.topTenItemOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenItemInstance?.totalOpinion}">
				<li class="fieldcontain">
					<span id="totalOpinion-label" class="property-label"><g:message code="topTenItem.totalOpinion.label" default="Total Opinion" /></span>
					
						<span class="property-value" aria-labelledby="totalOpinion-label"><g:fieldValue bean="${topTenItemInstance}" field="totalOpinion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenItemInstance?.totalVote}">
				<li class="fieldcontain">
					<span id="totalVote-label" class="property-label"><g:message code="topTenItem.totalVote.label" default="Total Vote" /></span>
					
						<span class="property-value" aria-labelledby="totalVote-label"><g:fieldValue bean="${topTenItemInstance}" field="totalVote"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:topTenItemInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${topTenItemInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
