
<%@ page import="com.bddesh24.NewsSourceTag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newsSourceTag.label', default: 'NewsSourceTag')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-newsSourceTag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-newsSourceTag" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list newsSourceTag">
			
				<g:if test="${newsSourceTagInstance?.newsSourceTag}">
				<li class="fieldcontain">
					<span id="newsSourceTag-label" class="property-label"><g:message code="newsSourceTag.newsSourceTag.label" default="News Source Tag" /></span>
					
						<span class="property-value" aria-labelledby="newsSourceTag-label"><g:fieldValue bean="${newsSourceTagInstance}" field="newsSourceTag"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceTagInstance?.tagDescription}">
				<li class="fieldcontain">
					<span id="tagDescription-label" class="property-label"><g:message code="newsSourceTag.tagDescription.label" default="Tag Description" /></span>
					
						<span class="property-value" aria-labelledby="tagDescription-label"><g:fieldValue bean="${newsSourceTagInstance}" field="tagDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceTagInstance?.relatedHashwords}">
				<li class="fieldcontain">
					<span id="relatedHashwords-label" class="property-label"><g:message code="newsSourceTag.relatedHashwords.label" default="Related Hashwords" /></span>
					
						<span class="property-value" aria-labelledby="relatedHashwords-label"><g:fieldValue bean="${newsSourceTagInstance}" field="relatedHashwords"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceTagInstance?.coverImage}">
				<li class="fieldcontain">
					<span id="coverImage-label" class="property-label"><g:message code="newsSourceTag.coverImage.label" default="Cover Image" /></span>
					
						<span class="property-value" aria-labelledby="coverImage-label"><g:fieldValue bean="${newsSourceTagInstance}" field="coverImage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceTagInstance?.newsSourceItems}">
				<li class="fieldcontain">
					<span id="newsSourceItems-label" class="property-label"><g:message code="newsSourceTag.newsSourceItems.label" default="News Source Items" /></span>
					
						<g:each in="${newsSourceTagInstance.newsSourceItems}" var="n">
						<span class="property-value" aria-labelledby="newsSourceItems-label"><g:link controller="newsSourceItem" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceTagInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="newsSourceTag.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${newsSourceTagInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceTagInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="newsSourceTag.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${newsSourceTagInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceTagInstance?.featured}">
				<li class="fieldcontain">
					<span id="featured-label" class="property-label"><g:message code="newsSourceTag.featured.label" default="Featured" /></span>
					
						<span class="property-value" aria-labelledby="featured-label"><g:formatBoolean boolean="${newsSourceTagInstance?.featured}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceTagInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="newsSourceTag.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${newsSourceTagInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsSourceTagInstance?.totalNewsSourceItem}">
				<li class="fieldcontain">
					<span id="totalNewsSourceItem-label" class="property-label"><g:message code="newsSourceTag.totalNewsSourceItem.label" default="Total News Source Item" /></span>
					
						<span class="property-value" aria-labelledby="totalNewsSourceItem-label"><g:fieldValue bean="${newsSourceTagInstance}" field="totalNewsSourceItem"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:newsSourceTagInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${newsSourceTagInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
