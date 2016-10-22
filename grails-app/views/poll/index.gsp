
<%@ page import="com.bddesh24.Poll" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'poll.label', default: 'Poll')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-poll" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-poll" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="question" title="${message(code: 'poll.question.label', default: 'Question')}" />
					
						<g:sortableColumn property="shortDescription" title="${message(code: 'poll.shortDescription.label', default: 'Short Description')}" />
					
						<g:sortableColumn property="pollTags" title="${message(code: 'poll.pollTags.label', default: 'Poll Tags')}" />
					
						<g:sortableColumn property="imageName" title="${message(code: 'poll.imageName.label', default: 'Image Name')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'poll.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'poll.enabled.label', default: 'Enabled')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pollInstanceList}" status="i" var="pollInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pollInstance.id}">${fieldValue(bean: pollInstance, field: "question")}</g:link></td>
					
						<td>${fieldValue(bean: pollInstance, field: "shortDescription")}</td>
					
						<td>${fieldValue(bean: pollInstance, field: "pollTags")}</td>
					
						<td>${fieldValue(bean: pollInstance, field: "imageName")}</td>
					
						<td><g:formatDate date="${pollInstance.dateCreated}" /></td>
					
						<td><g:formatBoolean boolean="${pollInstance.enabled}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pollInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
