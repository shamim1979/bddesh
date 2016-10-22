
<%@ page import="com.bddesh24.Quote" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'quote.label', default: 'Quote')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-quote" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-quote" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="quote" title="${message(code: 'quote.quote.label', default: 'Quote')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'quote.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="imageName" title="${message(code: 'quote.imageName.label', default: 'Image Name')}" />
					
						<g:sortableColumn property="topicHashword" title="${message(code: 'quote.topicHashword.label', default: 'Topic Hashword')}" />
					
						<g:sortableColumn property="quoteAuthor" title="${message(code: 'quote.quoteAuthor.label', default: 'Quote Author')}" />
					
						<g:sortableColumn property="quoteAuthorName" title="${message(code: 'quote.quoteAuthorName.label', default: 'Quote Author Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${quoteInstanceList}" status="i" var="quoteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${quoteInstance.id}">${fieldValue(bean: quoteInstance, field: "quote")}</g:link></td>
					
						<td>${fieldValue(bean: quoteInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: quoteInstance, field: "imageName")}</td>
					
						<td>${fieldValue(bean: quoteInstance, field: "topicHashword")}</td>
					
						<td>${fieldValue(bean: quoteInstance, field: "quoteAuthor")}</td>
					
						<td>${fieldValue(bean: quoteInstance, field: "quoteAuthorName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${quoteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
