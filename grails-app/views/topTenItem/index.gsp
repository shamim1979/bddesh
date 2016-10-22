
<%@ page import="com.bddesh24.TopTenItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topTenItem.label', default: 'TopTenItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-topTenItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-topTenItem" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'topTenItem.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="shortDescription" title="${message(code: 'topTenItem.shortDescription.label', default: 'Short Description')}" />
					
						<g:sortableColumn property="imageName" title="${message(code: 'topTenItem.imageName.label', default: 'Image Name')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'topTenItem.enabled.label', default: 'Enabled')}" />
					
						<th><g:message code="topTenItem.topTen.label" default="Top Ten" /></th>
					
						<th><g:message code="topTenItem.topTenItemOwner.label" default="Top Ten Item Owner" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${topTenItemInstanceList}" status="i" var="topTenItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${topTenItemInstance.id}">${fieldValue(bean: topTenItemInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: topTenItemInstance, field: "shortDescription")}</td>
					
						<td>${fieldValue(bean: topTenItemInstance, field: "imageName")}</td>
					
						<td><g:formatBoolean boolean="${topTenItemInstance.enabled}" /></td>
					
						<td>${fieldValue(bean: topTenItemInstance, field: "topTen")}</td>
					
						<td>${fieldValue(bean: topTenItemInstance, field: "topTenItemOwner")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${topTenItemInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
