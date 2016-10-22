<%@ page import="com.bddesh24.NewsArticle" %>



<div class="fieldcontain ${hasErrors(bean: newsArticleInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="newsArticle.title.label" default="Title" />
		
	</label>
	<g:textArea name="title" cols="40" rows="5" maxlength="300" value="${newsArticleInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsArticleInstance, field: 'shortDescription', 'error')} ">
	<label for="shortDescription">
		<g:message code="newsArticle.shortDescription.label" default="Short Description" />
		
	</label>
	<g:textArea name="shortDescription" cols="40" rows="5" maxlength="500" value="${newsArticleInstance?.shortDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsArticleInstance, field: 'detailsDescription', 'error')} required">
	<label for="detailsDescription">
		<g:message code="newsArticle.detailsDescription.label" default="Details Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="detailsDescription" cols="40" rows="5" maxlength="4000" required="" value="${newsArticleInstance?.detailsDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsArticleInstance, field: 'imageName', 'error')} ">
	<label for="imageName">
		<g:message code="newsArticle.imageName.label" default="Image Name" />
		
	</label>
	<g:textField name="imageName" value="${newsArticleInstance?.imageName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsArticleInstance, field: 'hashWords', 'error')} ">
	<label for="hashWords">
		<g:message code="newsArticle.hashWords.label" default="Hash Words" />
		
	</label>
	<g:textArea name="hashWords" cols="40" rows="5" maxlength="500" value="${newsArticleInstance?.hashWords}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsArticleInstance, field: 'articleComments', 'error')} ">
	<label for="articleComments">
		<g:message code="newsArticle.articleComments.label" default="Article Comments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${newsArticleInstance?.articleComments?}" var="a">
    <li><g:link controller="articleComment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="articleComment" action="create" params="['newsArticle.id': newsArticleInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'articleComment.label', default: 'ArticleComment')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: newsArticleInstance, field: 'articleOwner', 'error')} required">
	<label for="articleOwner">
		<g:message code="newsArticle.articleOwner.label" default="Article Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="articleOwner" name="articleOwner.id" from="${com.bddesh24.User.list()}" optionKey="id" required="" value="${newsArticleInstance?.articleOwner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsArticleInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="newsArticle.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${newsArticleInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: newsArticleInstance, field: 'featured', 'error')} ">
	<label for="featured">
		<g:message code="newsArticle.featured.label" default="Featured" />
		
	</label>
	<g:checkBox name="featured" value="${newsArticleInstance?.featured}" />

</div>

<div class="fieldcontain ${hasErrors(bean: newsArticleInstance, field: 'hasDetails', 'error')} ">
	<label for="hasDetails">
		<g:message code="newsArticle.hasDetails.label" default="Has Details" />
		
	</label>
	<g:checkBox name="hasDetails" value="${newsArticleInstance?.hasDetails}" />

</div>

<div class="fieldcontain ${hasErrors(bean: newsArticleInstance, field: 'postId', 'error')} required">
	<label for="postId">
		<g:message code="newsArticle.postId.label" default="Post Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="postId" type="number" value="${newsArticleInstance.postId}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsArticleInstance, field: 'postType', 'error')} required">
	<label for="postType">
		<g:message code="newsArticle.postType.label" default="Post Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="postType" type="number" value="${newsArticleInstance.postType}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsArticleInstance, field: 'totalComment', 'error')} required">
	<label for="totalComment">
		<g:message code="newsArticle.totalComment.label" default="Total Comment" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalComment" type="number" value="${newsArticleInstance.totalComment}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsArticleInstance, field: 'totalLike', 'error')} required">
	<label for="totalLike">
		<g:message code="newsArticle.totalLike.label" default="Total Like" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalLike" type="number" value="${newsArticleInstance.totalLike}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsArticleInstance, field: 'totalView', 'error')} required">
	<label for="totalView">
		<g:message code="newsArticle.totalView.label" default="Total View" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalView" type="number" value="${newsArticleInstance.totalView}" required=""/>

</div>

