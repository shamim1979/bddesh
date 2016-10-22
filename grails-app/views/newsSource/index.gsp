
<%@ page import="com.bddesh24.NewsSource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newsSource.label', default: 'NewsSource')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-newsSource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-newsSource" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'newsSource.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="newsSourceTag" title="${message(code: 'newsSource.newsSourceTag.label', default: 'News Source Tag')}" />
					
						<g:sortableColumn property="shortDescription" title="${message(code: 'newsSource.shortDescription.label', default: 'Short Description')}" />
					
						<g:sortableColumn property="imageName" title="${message(code: 'newsSource.imageName.label', default: 'Image Name')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'newsSource.enabled.label', default: 'Enabled')}" />
					
						<g:sortableColumn property="totalComment" title="${message(code: 'newsSource.totalComment.label', default: 'Total Comment')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${newsSourceInstanceList}" status="i" var="newsSourceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${newsSourceInstance.id}">${fieldValue(bean: newsSourceInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: newsSourceInstance, field: "newsSourceTag")}</td>
					
						<td>${fieldValue(bean: newsSourceInstance, field: "shortDescription")}</td>
					
						<td>${fieldValue(bean: newsSourceInstance, field: "imageName")}</td>
					
						<td><g:formatBoolean boolean="${newsSourceInstance.enabled}" /></td>
					
						<td>${fieldValue(bean: newsSourceInstance, field: "totalComment")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${newsSourceInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
