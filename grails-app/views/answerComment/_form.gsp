<%@ page import="com.bddesh24.AnswerComment" %>



<div class="fieldcontain ${hasErrors(bean: answerCommentInstance, field: 'comment', 'error')} required">
	<label for="comment">
		<g:message code="answerComment.comment.label" default="Comment" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="500" required="" value="${answerCommentInstance?.comment}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: answerCommentInstance, field: 'answer', 'error')} required">
	<label for="answer">
		<g:message code="answerComment.answer.label" default="Answer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="answer" name="answer.id" from="${com.bddesh24.Answer.list()}" optionKey="id" required="" value="${answerCommentInstance?.answer?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: answerCommentInstance, field: 'commentOwner', 'error')} required">
	<label for="commentOwner">
		<g:message code="answerComment.commentOwner.label" default="Comment Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="commentOwner" name="commentOwner.id" from="${com.bddesh24.User.list()}" optionKey="id" required="" value="${answerCommentInstance?.commentOwner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: answerCommentInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="answerComment.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${answerCommentInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: answerCommentInstance, field: 'totalLike', 'error')} required">
	<label for="totalLike">
		<g:message code="answerComment.totalLike.label" default="Total Like" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalLike" type="number" value="${answerCommentInstance.totalLike}" required=""/>

</div>

