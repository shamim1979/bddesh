
<%@ page import="com.bddesh24.NewsSource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newsSource.label', default: 'NewsSource')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-newsSource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-newsSource" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list newsSource">
			
				<g:if test="${newsSourceInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="newsSource.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${newsSourceInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceInstance?.newsSourceTag}">
				<li class="fieldcontain">
					<span id="newsSourceTag-label" class="property-label"><g:message code="newsSource.newsSourceTag.label" default="News Source Tag" /></span>
					
						<span class="property-value" aria-labelledby="newsSourceTag-label"><g:fieldValue bean="${newsSourceInstance}" field="newsSourceTag"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceInstance?.shortDescription}">
				<li class="fieldcontain">
					<span id="shortDescription-label" class="property-label"><g:message code="newsSource.shortDescription.label" default="Short Description" /></span>
					
						<span class="property-value" aria-labelledby="shortDescription-label"><g:fieldValue bean="${newsSourceInstance}" field="shortDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceInstance?.imageName}">
				<li class="fieldcontain">
					<span id="imageName-label" class="property-label"><g:message code="newsSource.imageName.label" default="Image Name" /></span>
					
						<span class="property-value" aria-labelledby="imageName-label"><g:fieldValue bean="${newsSourceInstance}" field="imageName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceInstance?.newsSourceComments}">
				<li class="fieldcontain">
					<span id="newsSourceComments-label" class="property-label"><g:message code="newsSource.newsSourceComments.label" default="News Source Comments" /></span>
					
						<g:each in="${newsSourceInstance.newsSourceComments}" var="n">
						<span class="property-value" aria-labelledby="newsSourceComments-label"><g:link controller="newsSourceComment" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="newsSource.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${newsSourceInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceInstance?.newsSourceItems}">
				<li class="fieldcontain">
					<span id="newsSourceItems-label" class="property-label"><g:message code="newsSource.newsSourceItems.label" default="News Source Items" /></span>
					
						<g:each in="${newsSourceInstance.newsSourceItems}" var="n">
						<span class="property-value" aria-labelledby="newsSourceItems-label"><g:link controller="newsSourceItem" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceInstance?.totalComment}">
				<li class="fieldcontain">
					<span id="totalComment-label" class="property-label"><g:message code="newsSource.totalComment.label" default="Total Comment" /></span>
					
						<span class="property-value" aria-labelledby="totalComment-label"><g:fieldValue bean="${newsSourceInstance}" field="totalComment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceInstance?.totalVote}">
				<li class="fieldcontain">
					<span id="totalVote-label" class="property-label"><g:message code="newsSource.totalVote.label" default="Total Vote" /></span>
					
						<span class="property-value" aria-labelledby="totalVote-label"><g:fieldValue bean="${newsSourceInstance}" field="totalVote"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:newsSourceInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${newsSourceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
