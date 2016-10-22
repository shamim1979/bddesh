
<%@ page import="com.bddesh24.NewsArticle" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newsArticle.label', default: 'NewsArticle')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-newsArticle" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-newsArticle" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'newsArticle.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="shortDescription" title="${message(code: 'newsArticle.shortDescription.label', default: 'Short Description')}" />
					
						<g:sortableColumn property="detailsDescription" title="${message(code: 'newsArticle.detailsDescription.label', default: 'Details Description')}" />
					
						<g:sortableColumn property="imageName" title="${message(code: 'newsArticle.imageName.label', default: 'Image Name')}" />
					
						<g:sortableColumn property="hashWords" title="${message(code: 'newsArticle.hashWords.label', default: 'Hash Words')}" />
					
						<th><g:message code="newsArticle.articleOwner.label" default="Article Owner" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${newsArticleInstanceList}" status="i" var="newsArticleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${newsArticleInstance.id}">${fieldValue(bean: newsArticleInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: newsArticleInstance, field: "shortDescription")}</td>
					
						<td>${fieldValue(bean: newsArticleInstance, field: "detailsDescription")}</td>
					
						<td>${fieldValue(bean: newsArticleInstance, field: "imageName")}</td>
					
						<td>${fieldValue(bean: newsArticleInstance, field: "hashWords")}</td>
					
						<td>${fieldValue(bean: newsArticleInstance, field: "articleOwner")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${newsArticleInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
