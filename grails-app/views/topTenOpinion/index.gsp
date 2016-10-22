
<%@ page import="com.bddesh24.TopTenOpinion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topTenOpinion.label', default: 'TopTenOpinion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-topTenOpinion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-topTenOpinion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="opinion" title="${message(code: 'topTenOpinion.opinion.label', default: 'Opinion')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'topTenOpinion.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'topTenOpinion.enabled.label', default: 'Enabled')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'topTenOpinion.lastUpdated.label', default: 'Last Updated')}" />
					
						<th><g:message code="topTenOpinion.opinionOwner.label" default="Opinion Owner" /></th>
					
						<th><g:message code="topTenOpinion.topTenItem.label" default="Top Ten Item" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${topTenOpinionInstanceList}" status="i" var="topTenOpinionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${topTenOpinionInstance.id}">${fieldValue(bean: topTenOpinionInstance, field: "opinion")}</g:link></td>
					
						<td><g:formatDate date="${topTenOpinionInstance.dateCreated}" /></td>
					
						<td><g:formatBoolean boolean="${topTenOpinionInstance.enabled}" /></td>
					
						<td><g:formatDate date="${topTenOpinionInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: topTenOpinionInstance, field: "opinionOwner")}</td>
					
						<td>${fieldValue(bean: topTenOpinionInstance, field: "topTenItem")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${topTenOpinionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
