
<%@ page import="com.bddesh24.PollItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pollItem.label', default: 'PollItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pollItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pollItem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pollItem">
			
				<g:if test="${pollItemInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="pollItem.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${pollItemInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollItemInstance?.deffence}">
				<li class="fieldcontain">
					<span id="deffence-label" class="property-label"><g:message code="pollItem.deffence.label" default="Deffence" /></span>
					
						<span class="property-value" aria-labelledby="deffence-label"><g:fieldValue bean="${pollItemInstance}" field="deffence"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollItemInstance?.imageName}">
				<li class="fieldcontain">
					<span id="imageName-label" class="property-label"><g:message code="pollItem.imageName.label" default="Image Name" /></span>
					
						<span class="property-value" aria-labelledby="imageName-label"><g:fieldValue bean="${pollItemInstance}" field="imageName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollItemInstance?.pollItemOpinions}">
				<li class="fieldcontain">
					<span id="pollItemOpinions-label" class="property-label"><g:message code="pollItem.pollItemOpinions.label" default="Poll Item Opinions" /></span>
					
						<g:each in="${pollItemInstance.pollItemOpinions}" var="p">
						<span class="property-value" aria-labelledby="pollItemOpinions-label"><g:link controller="pollItemOpinion" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${pollItemInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="pollItem.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${pollItemInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollItemInstance?.isPositive}">
				<li class="fieldcontain">
					<span id="isPositive-label" class="property-label"><g:message code="pollItem.isPositive.label" default="Is Positive" /></span>
					
						<span class="property-value" aria-labelledby="isPositive-label"><g:formatBoolean boolean="${pollItemInstance?.isPositive}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollItemInstance?.poll}">
				<li class="fieldcontain">
					<span id="poll-label" class="property-label"><g:message code="pollItem.poll.label" default="Poll" /></span>
					
						<span class="property-value" aria-labelledby="poll-label"><g:link controller="poll" action="show" id="${pollItemInstance?.poll?.id}">${pollItemInstance?.poll?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollItemInstance?.pollItemOwner}">
				<li class="fieldcontain">
					<span id="pollItemOwner-label" class="property-label"><g:message code="pollItem.pollItemOwner.label" default="Poll Item Owner" /></span>
					
						<span class="property-value" aria-labelledby="pollItemOwner-label"><g:link controller="user" action="show" id="${pollItemInstance?.pollItemOwner?.id}">${pollItemInstance?.pollItemOwner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollItemInstance?.totalOpinion}">
				<li class="fieldcontain">
					<span id="totalOpinion-label" class="property-label"><g:message code="pollItem.totalOpinion.label" default="Total Opinion" /></span>
					
						<span class="property-value" aria-labelledby="totalOpinion-label"><g:fieldValue bean="${pollItemInstance}" field="totalOpinion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pollItemInstance?.totalVote}">
				<li class="fieldcontain">
					<span id="totalVote-label" class="property-label"><g:message code="pollItem.totalVote.label" default="Total Vote" /></span>
					
						<span class="property-value" aria-labelledby="totalVote-label"><g:fieldValue bean="${pollItemInstance}" field="totalVote"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:pollItemInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${pollItemInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
