
<%@ page import="com.bddesh24.NewsSourceItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newsSourceItem.label', default: 'NewsSourceItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-newsSourceItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-newsSourceItem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list newsSourceItem">
			
				<g:if test="${newsSourceItemInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="newsSourceItem.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${newsSourceItemInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceItemInstance?.shortDescription}">
				<li class="fieldcontain">
					<span id="shortDescription-label" class="property-label"><g:message code="newsSourceItem.shortDescription.label" default="Short Description" /></span>
					
						<span class="property-value" aria-labelledby="shortDescription-label"><g:fieldValue bean="${newsSourceItemInstance}" field="shortDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceItemInstance?.newsSourceTag}">
				<li class="fieldcontain">
					<span id="newsSourceTag-label" class="property-label"><g:message code="newsSourceItem.newsSourceTag.label" default="News Source Tag" /></span>
					
						<span class="property-value" aria-labelledby="newsSourceTag-label"><g:fieldValue bean="${newsSourceItemInstance}" field="newsSourceTag"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceItemInstance?.newsLinks}">
				<li class="fieldcontain">
					<span id="newsLinks-label" class="property-label"><g:message code="newsSourceItem.newsLinks.label" default="News Links" /></span>
					
						<span class="property-value" aria-labelledby="newsLinks-label"><g:fieldValue bean="${newsSourceItemInstance}" field="newsLinks"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceItemInstance?.newsSourceItemComment}">
				<li class="fieldcontain">
					<span id="newsSourceItemComment-label" class="property-label"><g:message code="newsSourceItem.newsSourceItemComment.label" default="News Source Item Comment" /></span>
					
						<g:each in="${newsSourceItemInstance.newsSourceItemComment}" var="n">
						<span class="property-value" aria-labelledby="newsSourceItemComment-label"><g:link controller="newsSourceItemComment" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceItemInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="newsSourceItem.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${newsSourceItemInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceItemInstance?.newsSource}">
				<li class="fieldcontain">
					<span id="newsSource-label" class="property-label"><g:message code="newsSourceItem.newsSource.label" default="News Source" /></span>
					
						<span class="property-value" aria-labelledby="newsSource-label"><g:link controller="newsSource" action="show" id="${newsSourceItemInstance?.newsSource?.id}">${newsSourceItemInstance?.newsSource?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceItemInstance?.totalComment}">
				<li class="fieldcontain">
					<span id="totalComment-label" class="property-label"><g:message code="newsSourceItem.totalComment.label" default="Total Comment" /></span>
					
						<span class="property-value" aria-labelledby="totalComment-label"><g:fieldValue bean="${newsSourceItemInstance}" field="totalComment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceItemInstance?.totalVote}">
				<li class="fieldcontain">
					<span id="totalVote-label" class="property-label"><g:message code="newsSourceItem.totalVote.label" default="Total Vote" /></span>
					
						<span class="property-value" aria-labelledby="totalVote-label"><g:fieldValue bean="${newsSourceItemInstance}" field="totalVote"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:newsSourceItemInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${newsSourceItemInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
