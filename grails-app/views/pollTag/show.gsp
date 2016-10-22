
<%@ page import="com.bddesh24.PollTag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pollTag.label', default: 'PollTag')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pollTag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pollTag" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pollTag">
			
				<g:if test="${pollTagInstance?.pollTag}">
				<li class="fieldcontain">
					<span id="pollTag-label" class="property-label"><g:message code="pollTag.pollTag.label" default="Poll Tag" /></span>
					
						<span class="property-value" aria-labelledby="pollTag-label"><g:fieldValue bean="${pollTagInstance}" field="pollTag"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollTagInstance?.coverImage}">
				<li class="fieldcontain">
					<span id="coverImage-label" class="property-label"><g:message code="pollTag.coverImage.label" default="Cover Image" /></span>
					
						<span class="property-value" aria-labelledby="coverImage-label"><g:fieldValue bean="${pollTagInstance}" field="coverImage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollTagInstance?.relatedHashwords}">
				<li class="fieldcontain">
					<span id="relatedHashwords-label" class="property-label"><g:message code="pollTag.relatedHashwords.label" default="Related Hashwords" /></span>
					
						<span class="property-value" aria-labelledby="relatedHashwords-label"><g:fieldValue bean="${pollTagInstance}" field="relatedHashwords"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollTagInstance?.tagDescription}">
				<li class="fieldcontain">
					<span id="tagDescription-label" class="property-label"><g:message code="pollTag.tagDescription.label" default="Tag Description" /></span>
					
						<span class="property-value" aria-labelledby="tagDescription-label"><g:fieldValue bean="${pollTagInstance}" field="tagDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollTagInstance?.polls}">
				<li class="fieldcontain">
					<span id="polls-label" class="property-label"><g:message code="pollTag.polls.label" default="Polls" /></span>
					
						<g:each in="${pollTagInstance.polls}" var="p">
						<span class="property-value" aria-labelledby="polls-label"><g:link controller="poll" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${pollTagInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="pollTag.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${pollTagInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollTagInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="pollTag.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${pollTagInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollTagInstance?.featured}">
				<li class="fieldcontain">
					<span id="featured-label" class="property-label"><g:message code="pollTag.featured.label" default="Featured" /></span>
					
						<span class="property-value" aria-labelledby="featured-label"><g:formatBoolean boolean="${pollTagInstance?.featured}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollTagInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="pollTag.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${pollTagInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollTagInstance?.pollTagOwner}">
				<li class="fieldcontain">
					<span id="pollTagOwner-label" class="property-label"><g:message code="pollTag.pollTagOwner.label" default="Poll Tag Owner" /></span>
					
						<span class="property-value" aria-labelledby="pollTagOwner-label"><g:link controller="user" action="show" id="${pollTagInstance?.pollTagOwner?.id}">${pollTagInstance?.pollTagOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollTagInstance?.totalPoll}">
				<li class="fieldcontain">
					<span id="totalPoll-label" class="property-label"><g:message code="pollTag.totalPoll.label" default="Total Poll" /></span>
					
						<span class="property-value" aria-labelledby="totalPoll-label"><g:fieldValue bean="${pollTagInstance}" field="totalPoll"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:pollTagInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${pollTagInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
