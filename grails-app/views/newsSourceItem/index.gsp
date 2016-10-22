
<%@ page import="com.bddesh24.NewsSourceItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newsSourceItem.label', default: 'NewsSourceItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-newsSourceItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-newsSourceItem" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'newsSourceItem.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="shortDescription" title="${message(code: 'newsSourceItem.shortDescription.label', default: 'Short Description')}" />
					
						<g:sortableColumn property="newsSourceTag" title="${message(code: 'newsSourceItem.newsSourceTag.label', default: 'News Source Tag')}" />
					
						<g:sortableColumn property="newsLinks" title="${message(code: 'newsSourceItem.newsLinks.label', default: 'News Links')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'newsSourceItem.enabled.label', default: 'Enabled')}" />
					
						<th><g:message code="newsSourceItem.newsSource.label" default="News Source" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${newsSourceItemInstanceList}" status="i" var="newsSourceItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${newsSourceItemInstance.id}">${fieldValue(bean: newsSourceItemInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: newsSourceItemInstance, field: "shortDescription")}</td>
					
						<td>${fieldValue(bean: newsSourceItemInstance, field: "newsSourceTag")}</td>
					
						<td>${fieldValue(bean: newsSourceItemInstance, field: "newsLinks")}</td>
					
						<td><g:formatBoolean boolean="${newsSourceItemInstance.enabled}" /></td>
					
						<td>${fieldValue(bean: newsSourceItemInstance, field: "newsSource")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${newsSourceItemInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
