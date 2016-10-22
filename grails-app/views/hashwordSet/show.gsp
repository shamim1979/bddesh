
<%@ page import="com.bddesh24.HashwordSet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hashwordSet.label', default: 'HashwordSet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-hashwordSet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-hashwordSet" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list hashwordSet">
			
				<g:if test="${hashwordSetInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="hashwordSet.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${hashwordSetInstance}" field="location"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hashwordSetInstance?.newsArticleTags}">
				<li class="fieldcontain">
					<span id="newsArticleTags-label" class="property-label"><g:message code="hashwordSet.newsArticleTags.label" default="News Article Tags" /></span>
					
						<span class="property-value" aria-labelledby="newsArticleTags-label"><g:fieldValue bean="${hashwordSetInstance}" field="newsArticleTags"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hashwordSetInstance?.pollTags}">
				<li class="fieldcontain">
					<span id="pollTags-label" class="property-label"><g:message code="hashwordSet.pollTags.label" default="Poll Tags" /></span>
					
						<span class="property-value" aria-labelledby="pollTags-label"><g:fieldValue bean="${hashwordSetInstance}" field="pollTags"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hashwordSetInstance?.questionTags}">
				<li class="fieldcontain">
					<span id="questionTags-label" class="property-label"><g:message code="hashwordSet.questionTags.label" default="Question Tags" /></span>
					
						<span class="property-value" aria-labelledby="questionTags-label"><g:fieldValue bean="${hashwordSetInstance}" field="questionTags"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hashwordSetInstance?.topTenTags}">
				<li class="fieldcontain">
					<span id="topTenTags-label" class="property-label"><g:message code="hashwordSet.topTenTags.label" default="Top Ten Tags" /></span>
					
						<span class="property-value" aria-labelledby="topTenTags-label"><g:fieldValue bean="${hashwordSetInstance}" field="topTenTags"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hashwordSetInstance?.newsSourceTags}">
				<li class="fieldcontain">
					<span id="newsSourceTags-label" class="property-label"><g:message code="hashwordSet.newsSourceTags.label" default="News Source Tags" /></span>
					
						<span class="property-value" aria-labelledby="newsSourceTags-label"><g:fieldValue bean="${hashwordSetInstance}" field="newsSourceTags"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hashwordSetInstance?.usaSourceTags}">
				<li class="fieldcontain">
					<span id="usaSourceTags-label" class="property-label"><g:message code="hashwordSet.usaSourceTags.label" default="Usa Source Tags" /></span>
					
						<span class="property-value" aria-labelledby="usaSourceTags-label"><g:fieldValue bean="${hashwordSetInstance}" field="usaSourceTags"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:hashwordSetInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${hashwordSetInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
