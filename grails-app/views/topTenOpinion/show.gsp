
<%@ page import="com.bddesh24.TopTenOpinion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topTenOpinion.label', default: 'TopTenOpinion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-topTenOpinion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-topTenOpinion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list topTenOpinion">
			
				<g:if test="${topTenOpinionInstance?.opinion}">
				<li class="fieldcontain">
					<span id="opinion-label" class="property-label"><g:message code="topTenOpinion.opinion.label" default="Opinion" /></span>
					
						<span class="property-value" aria-labelledby="opinion-label"><g:fieldValue bean="${topTenOpinionInstance}" field="opinion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenOpinionInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="topTenOpinion.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${topTenOpinionInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenOpinionInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="topTenOpinion.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${topTenOpinionInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenOpinionInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="topTenOpinion.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${topTenOpinionInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenOpinionInstance?.opinionOwner}">
				<li class="fieldcontain">
					<span id="opinionOwner-label" class="property-label"><g:message code="topTenOpinion.opinionOwner.label" default="Opinion Owner" /></span>
					
						<span class="property-value" aria-labelledby="opinionOwner-label"><g:link controller="user" action="show" id="${topTenOpinionInstance?.opinionOwner?.id}">${topTenOpinionInstance?.opinionOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenOpinionInstance?.topTenItem}">
				<li class="fieldcontain">
					<span id="topTenItem-label" class="property-label"><g:message code="topTenOpinion.topTenItem.label" default="Top Ten Item" /></span>
					
						<span class="property-value" aria-labelledby="topTenItem-label"><g:link controller="topTenItem" action="show" id="${topTenOpinionInstance?.topTenItem?.id}">${topTenOpinionInstance?.topTenItem?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${topTenOpinionInstance?.totalLike}">
				<li class="fieldcontain">
					<span id="totalLike-label" class="property-label"><g:message code="topTenOpinion.totalLike.label" default="Total Like" /></span>
					
						<span class="property-value" aria-labelledby="totalLike-label"><g:fieldValue bean="${topTenOpinionInstance}" field="totalLike"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:topTenOpinionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${topTenOpinionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
