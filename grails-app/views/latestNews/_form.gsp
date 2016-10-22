<%@ page import="com.bddesh24.LatestNews" %>



<div class="fieldcontain ${hasErrors(bean: latestNewsInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="latestNews.title.label" default="Title" />
		
	</label>
	<g:textArea name="title" cols="40" rows="5" maxlength="300" value="${latestNewsInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: latestNewsInstance, field: 'shortDescription', 'error')} ">
	<label for="shortDescription">
		<g:message code="latestNews.shortDescription.label" default="Short Description" />
		
	</label>
	<g:textArea name="shortDescription" cols="40" rows="5" maxlength="500" value="${latestNewsInstance?.shortDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: latestNewsInstance, field: 'imageName', 'error')} ">
	<label for="imageName">
		<g:message code="latestNews.imageName.label" default="Image Name" />
		
	</label>
	<g:textField name="imageName" value="${latestNewsInstance?.imageName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: latestNewsInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="latestNews.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${latestNewsInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: latestNewsInstance, field: 'postId', 'error')} required">
	<label for="postId">
		<g:message code="latestNews.postId.label" default="Post Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="postId" type="number" value="${latestNewsInstance.postId}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: latestNewsInstance, field: 'postType', 'error')} required">
	<label for="postType">
		<g:message code="latestNews.postType.label" default="Post Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="postType" type="number" value="${latestNewsInstance.postType}" required=""/>

</div>

