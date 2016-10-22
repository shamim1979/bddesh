
<%@ page import="com.bddesh24.UserProfile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userProfile.label', default: 'UserProfile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userProfile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userProfile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'userProfile.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="phone" title="${message(code: 'userProfile.phone.label', default: 'Phone')}" />
					
						<g:sortableColumn property="coverImage" title="${message(code: 'userProfile.coverImage.label', default: 'Cover Image')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'userProfile.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="isSuperAdmin" title="${message(code: 'userProfile.isSuperAdmin.label', default: 'Is Super Admin')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'userProfile.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userProfileInstanceList}" status="i" var="userProfileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userProfileInstance.id}">${fieldValue(bean: userProfileInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: userProfileInstance, field: "phone")}</td>
					
						<td>${fieldValue(bean: userProfileInstance, field: "coverImage")}</td>
					
						<td><g:formatDate date="${userProfileInstance.dateCreated}" /></td>
					
						<td><g:formatBoolean boolean="${userProfileInstance.isSuperAdmin}" /></td>
					
						<td><g:formatDate date="${userProfileInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userProfileInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
