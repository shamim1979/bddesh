<%@ page import="com.bddesh24.ArticleComment" %>



<div class="fieldcontain ${hasErrors(bean: articleCommentInstance, field: 'comment', 'error')} required">
	<label for="comment">
		<g:message code="articleComment.comment.label" default="Comment" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="500" required="" value="${articleCommentInstance?.comment}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: articleCommentInstance, field: 'commentOwner', 'error')} required">
	<label for="commentOwner">
		<g:message code="articleComment.commentOwner.label" default="Comment Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="commentOwner" name="commentOwner.id" from="${com.bddesh24.User.list()}" optionKey="id" required="" value="${articleCommentInstance?.commentOwner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: articleCommentInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="articleComment.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${articleCommentInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: articleCommentInstance, field: 'newsArticle', 'error')} required">
	<label for="newsArticle">
		<g:message code="articleComment.newsArticle.label" default="News Article" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="newsArticle" name="newsArticle.id" from="${com.bddesh24.NewsArticle.list()}" optionKey="id" required="" value="${articleCommentInstance?.newsArticle?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: articleCommentInstance, field: 'totalLike', 'error')} required">
	<label for="totalLike">
		<g:message code="articleComment.totalLike.label" default="Total Like" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalLike" type="number" value="${articleCommentInstance.totalLike}" required=""/>

</div>

