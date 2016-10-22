
<%@ page import="com.bddesh24.PollTag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pollTag.label', default: 'PollTag')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pollTag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pollTag" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="pollTag" title="${message(code: 'pollTag.pollTag.label', default: 'Poll Tag')}" />
					
						<g:sortableColumn property="coverImage" title="${message(code: 'pollTag.coverImage.label', default: 'Cover Image')}" />
					
						<g:sortableColumn property="relatedHashwords" title="${message(code: 'pollTag.relatedHashwords.label', default: 'Related Hashwords')}" />
					
						<g:sortableColumn property="tagDescription" title="${message(code: 'pollTag.tagDescription.label', default: 'Tag Description')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'pollTag.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'pollTag.enabled.label', default: 'Enabled')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pollTagInstanceList}" status="i" var="pollTagInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pollTagInstance.id}">${fieldValue(bean: pollTagInstance, field: "pollTag")}</g:link></td>
					
						<td>${fieldValue(bean: pollTagInstance, field: "coverImage")}</td>
					
						<td>${fieldValue(bean: pollTagInstance, field: "relatedHashwords")}</td>
					
						<td>${fieldValue(bean: pollTagInstance, field: "tagDescription")}</td>
					
						<td><g:formatDate date="${pollTagInstance.dateCreated}" /></td>
					
						<td><g:formatBoolean boolean="${pollTagInstance.enabled}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pollTagInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
