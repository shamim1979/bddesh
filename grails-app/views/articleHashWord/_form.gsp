<%@ page import="com.bddesh24.ArticleHashWord" %>



<div class="fieldcontain ${hasErrors(bean: articleHashWordInstance, field: 'hashWord', 'error')} required">
	<label for="hashWord">
		<g:message code="articleHashWord.hashWord.label" default="Hash Word" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="hashWord" maxlength="150" required="" value="${articleHashWordInstance?.hashWord}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: articleHashWordInstance, field: 'hashWordTitle', 'error')} ">
	<label for="hashWordTitle">
		<g:message code="articleHashWord.hashWordTitle.label" default="Hash Word Title" />
		
	</label>
	<g:textField name="hashWordTitle" maxlength="150" value="${articleHashWordInstance?.hashWordTitle}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: articleHashWordInstance, field: 'coverImage', 'error')} ">
	<label for="coverImage">
		<g:message code="articleHashWord.coverImage.label" default="Cover Image" />
		
	</label>
	<g:textField name="coverImage" maxlength="150" value="${articleHashWordInstance?.coverImage}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: articleHashWordInstance, field: 'relatedHashwords', 'error')} ">
	<label for="relatedHashwords">
		<g:message code="articleHashWord.relatedHashwords.label" default="Related Hashwords" />
		
	</label>
	<g:textArea name="relatedHashwords" cols="40" rows="5" maxlength="800" value="${articleHashWordInstance?.relatedHashwords}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: articleHashWordInstance, field: 'newsArticles', 'error')} ">
	<label for="newsArticles">
		<g:message code="articleHashWord.newsArticles.label" default="News Articles" />
		
	</label>
	<g:select name="newsArticles" from="${com.bddesh24.NewsArticle.list()}" multiple="multiple" optionKey="id" size="5" value="${articleHashWordInstance?.newsArticles*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: articleHashWordInstance, field: 'articleHashWordOwner', 'error')} required">
	<label for="articleHashWordOwner">
		<g:message code="articleHashWord.articleHashWordOwner.label" default="Article Hash Word Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="articleHashWordOwner" name="articleHashWordOwner.id" from="${com.bddesh24.User.list()}" optionKey="id" required="" value="${articleHashWordInstance?.articleHashWordOwner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: articleHashWordInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="articleHashWord.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${articleHashWordInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: articleHashWordInstance, field: 'featured', 'error')} ">
	<label for="featured">
		<g:message code="articleHashWord.featured.label" default="Featured" />
		
	</label>
	<g:checkBox name="featured" value="${articleHashWordInstance?.featured}" />

</div>

<div class="fieldcontain ${hasErrors(bean: articleHashWordInstance, field: 'totalArticle', 'error')} required">
	<label for="totalArticle">
		<g:message code="articleHashWord.totalArticle.label" default="Total Article" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalArticle" type="number" value="${articleHashWordInstance.totalArticle}" required=""/>

</div>

