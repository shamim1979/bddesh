
<%@ page import="com.bddesh24.TopTen" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topTen.label', default: 'TopTen')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-topTen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-topTen" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'topTen.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="shortDescription" title="${message(code: 'topTen.shortDescription.label', default: 'Short Description')}" />
					
						<g:sortableColumn property="detailsDescription" title="${message(code: 'topTen.detailsDescription.label', default: 'Details Description')}" />
					
						<g:sortableColumn property="topTenTags" title="${message(code: 'topTen.topTenTags.label', default: 'Top Ten Tags')}" />
					
						<g:sortableColumn property="imageName" title="${message(code: 'topTen.imageName.label', default: 'Image Name')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'topTen.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${topTenInstanceList}" status="i" var="topTenInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${topTenInstance.id}">${fieldValue(bean: topTenInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: topTenInstance, field: "shortDescription")}</td>
					
						<td>${fieldValue(bean: topTenInstance, field: "detailsDescription")}</td>
					
						<td>${fieldValue(bean: topTenInstance, field: "topTenTags")}</td>
					
						<td>${fieldValue(bean: topTenInstance, field: "imageName")}</td>
					
						<td><g:formatDate date="${topTenInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${topTenInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
