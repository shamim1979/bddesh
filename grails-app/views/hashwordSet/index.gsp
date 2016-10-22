
<%@ page import="com.bddesh24.HashwordSet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hashwordSet.label', default: 'HashwordSet')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-hashwordSet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-hashwordSet" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="location" title="${message(code: 'hashwordSet.location.label', default: 'Location')}" />
					
						<g:sortableColumn property="newsArticleTags" title="${message(code: 'hashwordSet.newsArticleTags.label', default: 'News Article Tags')}" />
					
						<g:sortableColumn property="pollTags" title="${message(code: 'hashwordSet.pollTags.label', default: 'Poll Tags')}" />
					
						<g:sortableColumn property="questionTags" title="${message(code: 'hashwordSet.questionTags.label', default: 'Question Tags')}" />
					
						<g:sortableColumn property="topTenTags" title="${message(code: 'hashwordSet.topTenTags.label', default: 'Top Ten Tags')}" />
					
						<g:sortableColumn property="newsSourceTags" title="${message(code: 'hashwordSet.newsSourceTags.label', default: 'News Source Tags')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${hashwordSetInstanceList}" status="i" var="hashwordSetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${hashwordSetInstance.id}">${fieldValue(bean: hashwordSetInstance, field: "location")}</g:link></td>
					
						<td>${fieldValue(bean: hashwordSetInstance, field: "newsArticleTags")}</td>
					
						<td>${fieldValue(bean: hashwordSetInstance, field: "pollTags")}</td>
					
						<td>${fieldValue(bean: hashwordSetInstance, field: "questionTags")}</td>
					
						<td>${fieldValue(bean: hashwordSetInstance, field: "topTenTags")}</td>
					
						<td>${fieldValue(bean: hashwordSetInstance, field: "newsSourceTags")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${hashwordSetInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
