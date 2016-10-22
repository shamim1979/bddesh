
<%@ page import="com.bddesh24.LatestNews" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'latestNews.label', default: 'LatestNews')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-latestNews" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-latestNews" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'latestNews.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="shortDescription" title="${message(code: 'latestNews.shortDescription.label', default: 'Short Description')}" />
					
						<g:sortableColumn property="imageName" title="${message(code: 'latestNews.imageName.label', default: 'Image Name')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'latestNews.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'latestNews.enabled.label', default: 'Enabled')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'latestNews.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${latestNewsInstanceList}" status="i" var="latestNewsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${latestNewsInstance.id}">${fieldValue(bean: latestNewsInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: latestNewsInstance, field: "shortDescription")}</td>
					
						<td>${fieldValue(bean: latestNewsInstance, field: "imageName")}</td>
					
						<td><g:formatDate date="${latestNewsInstance.dateCreated}" /></td>
					
						<td><g:formatBoolean boolean="${latestNewsInstance.enabled}" /></td>
					
						<td><g:formatDate date="${latestNewsInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${latestNewsInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
