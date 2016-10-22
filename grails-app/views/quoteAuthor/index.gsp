
<%@ page import="com.bddesh24.QuoteAuthor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'quoteAuthor.label', default: 'QuoteAuthor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-quoteAuthor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-quoteAuthor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="authorName" title="${message(code: 'quoteAuthor.authorName.label', default: 'Author Name')}" />
					
						<g:sortableColumn property="displayName" title="${message(code: 'quoteAuthor.displayName.label', default: 'Display Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'quoteAuthor.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="profileImage" title="${message(code: 'quoteAuthor.profileImage.label', default: 'Profile Image')}" />
					
						<g:sortableColumn property="coverImage" title="${message(code: 'quoteAuthor.coverImage.label', default: 'Cover Image')}" />
					
						<g:sortableColumn property="dob" title="${message(code: 'quoteAuthor.dob.label', default: 'Dob')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${quoteAuthorInstanceList}" status="i" var="quoteAuthorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${quoteAuthorInstance.id}">${fieldValue(bean: quoteAuthorInstance, field: "authorName")}</g:link></td>
					
						<td>${fieldValue(bean: quoteAuthorInstance, field: "displayName")}</td>
					
						<td>${fieldValue(bean: quoteAuthorInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: quoteAuthorInstance, field: "profileImage")}</td>
					
						<td>${fieldValue(bean: quoteAuthorInstance, field: "coverImage")}</td>
					
						<td><g:formatDate date="${quoteAuthorInstance.dob}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${quoteAuthorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
