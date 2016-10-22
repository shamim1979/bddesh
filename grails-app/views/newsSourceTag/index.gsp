
<%@ page import="com.bddesh24.NewsSourceTag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newsSourceTag.label', default: 'NewsSourceTag')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-newsSourceTag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-newsSourceTag" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="newsSourceTag" title="${message(code: 'newsSourceTag.newsSourceTag.label', default: 'News Source Tag')}" />
					
						<g:sortableColumn property="tagDescription" title="${message(code: 'newsSourceTag.tagDescription.label', default: 'Tag Description')}" />
					
						<g:sortableColumn property="relatedHashwords" title="${message(code: 'newsSourceTag.relatedHashwords.label', default: 'Related Hashwords')}" />
					
						<g:sortableColumn property="coverImage" title="${message(code: 'newsSourceTag.coverImage.label', default: 'Cover Image')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'newsSourceTag.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'newsSourceTag.enabled.label', default: 'Enabled')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${newsSourceTagInstanceList}" status="i" var="newsSourceTagInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${newsSourceTagInstance.id}">${fieldValue(bean: newsSourceTagInstance, field: "newsSourceTag")}</g:link></td>
					
						<td>${fieldValue(bean: newsSourceTagInstance, field: "tagDescription")}</td>
					
						<td>${fieldValue(bean: newsSourceTagInstance, field: "relatedHashwords")}</td>
					
						<td>${fieldValue(bean: newsSourceTagInstance, field: "coverImage")}</td>
					
						<td><g:formatDate date="${newsSourceTagInstance.dateCreated}" /></td>
					
						<td><g:formatBoolean boolean="${newsSourceTagInstance.enabled}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${newsSourceTagInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
