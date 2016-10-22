
<%@ page import="com.bddesh24.TopTenTag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topTenTag.label', default: 'TopTenTag')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-topTenTag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-topTenTag" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="topTenTag" title="${message(code: 'topTenTag.topTenTag.label', default: 'Top Ten Tag')}" />
					
						<g:sortableColumn property="coverImage" title="${message(code: 'topTenTag.coverImage.label', default: 'Cover Image')}" />
					
						<g:sortableColumn property="relatedHashwords" title="${message(code: 'topTenTag.relatedHashwords.label', default: 'Related Hashwords')}" />
					
						<g:sortableColumn property="tagDescription" title="${message(code: 'topTenTag.tagDescription.label', default: 'Tag Description')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'topTenTag.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'topTenTag.enabled.label', default: 'Enabled')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${topTenTagInstanceList}" status="i" var="topTenTagInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${topTenTagInstance.id}">${fieldValue(bean: topTenTagInstance, field: "topTenTag")}</g:link></td>
					
						<td>${fieldValue(bean: topTenTagInstance, field: "coverImage")}</td>
					
						<td>${fieldValue(bean: topTenTagInstance, field: "relatedHashwords")}</td>
					
						<td>${fieldValue(bean: topTenTagInstance, field: "tagDescription")}</td>
					
						<td><g:formatDate date="${topTenTagInstance.dateCreated}" /></td>
					
						<td><g:formatBoolean boolean="${topTenTagInstance.enabled}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${topTenTagInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
