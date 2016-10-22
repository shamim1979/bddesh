
<%@ page import="com.bddesh24.Answer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'answer.label', default: 'Answer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-answer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-answer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="detailsDescription" title="${message(code: 'answer.detailsDescription.label', default: 'Details Description')}" />
					
						<g:sortableColumn property="imageName" title="${message(code: 'answer.imageName.label', default: 'Image Name')}" />
					
						<th><g:message code="answer.answerOwner.label" default="Answer Owner" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'answer.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'answer.enabled.label', default: 'Enabled')}" />
					
						<g:sortableColumn property="isBest" title="${message(code: 'answer.isBest.label', default: 'Is Best')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${answerInstanceList}" status="i" var="answerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${answerInstance.id}">${fieldValue(bean: answerInstance, field: "detailsDescription")}</g:link></td>
					
						<td>${fieldValue(bean: answerInstance, field: "imageName")}</td>
					
						<td>${fieldValue(bean: answerInstance, field: "answerOwner")}</td>
					
						<td><g:formatDate date="${answerInstance.dateCreated}" /></td>
					
						<td><g:formatBoolean boolean="${answerInstance.enabled}" /></td>
					
						<td><g:formatBoolean boolean="${answerInstance.isBest}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${answerInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
