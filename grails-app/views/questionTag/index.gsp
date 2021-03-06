
<%@ page import="com.bddesh24.QuestionTag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'questionTag.label', default: 'QuestionTag')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-questionTag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-questionTag" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="questionTag" title="${message(code: 'questionTag.questionTag.label', default: 'Question Tag')}" />
					
						<g:sortableColumn property="coverImage" title="${message(code: 'questionTag.coverImage.label', default: 'Cover Image')}" />
					
						<g:sortableColumn property="relatedHashwords" title="${message(code: 'questionTag.relatedHashwords.label', default: 'Related Hashwords')}" />
					
						<g:sortableColumn property="tagDescription" title="${message(code: 'questionTag.tagDescription.label', default: 'Tag Description')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'questionTag.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'questionTag.enabled.label', default: 'Enabled')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${questionTagInstanceList}" status="i" var="questionTagInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${questionTagInstance.id}">${fieldValue(bean: questionTagInstance, field: "questionTag")}</g:link></td>
					
						<td>${fieldValue(bean: questionTagInstance, field: "coverImage")}</td>
					
						<td>${fieldValue(bean: questionTagInstance, field: "relatedHashwords")}</td>
					
						<td>${fieldValue(bean: questionTagInstance, field: "tagDescription")}</td>
					
						<td><g:formatDate date="${questionTagInstance.dateCreated}" /></td>
					
						<td><g:formatBoolean boolean="${questionTagInstance.enabled}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${questionTagInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
