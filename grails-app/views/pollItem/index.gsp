
<%@ page import="com.bddesh24.PollItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pollItem.label', default: 'PollItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pollItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pollItem" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'pollItem.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="deffence" title="${message(code: 'pollItem.deffence.label', default: 'Deffence')}" />
					
						<g:sortableColumn property="imageName" title="${message(code: 'pollItem.imageName.label', default: 'Image Name')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'pollItem.enabled.label', default: 'Enabled')}" />
					
						<g:sortableColumn property="isPositive" title="${message(code: 'pollItem.isPositive.label', default: 'Is Positive')}" />
					
						<th><g:message code="pollItem.poll.label" default="Poll" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pollItemInstanceList}" status="i" var="pollItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pollItemInstance.id}">${fieldValue(bean: pollItemInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: pollItemInstance, field: "deffence")}</td>
					
						<td>${fieldValue(bean: pollItemInstance, field: "imageName")}</td>
					
						<td><g:formatBoolean boolean="${pollItemInstance.enabled}" /></td>
					
						<td><g:formatBoolean boolean="${pollItemInstance.isPositive}" /></td>
					
						<td>${fieldValue(bean: pollItemInstance, field: "poll")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pollItemInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
