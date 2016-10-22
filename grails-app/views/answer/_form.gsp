<%@ page import="com.bddesh24.Answer" %>



<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'detailsDescription', 'error')} required">
	<label for="detailsDescription">
		<g:message code="answer.detailsDescription.label" default="Details Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="detailsDescription" cols="40" rows="5" maxlength="2000" required="" value="${answerInstance?.detailsDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'imageName', 'error')} ">
	<label for="imageName">
		<g:message code="answer.imageName.label" default="Image Name" />
		
	</label>
	<g:textField name="imageName" maxlength="150" value="${answerInstance?.imageName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'answerComments', 'error')} ">
	<label for="answerComments">
		<g:message code="answer.answerComments.label" default="Answer Comments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${answerInstance?.answerComments?}" var="a">
    <li><g:link controller="answerComment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="answerComment" action="create" params="['answer.id': answerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'answerComment.label', default: 'AnswerComment')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'answerOwner', 'error')} required">
	<label for="answerOwner">
		<g:message code="answer.answerOwner.label" default="Answer Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="answerOwner" name="answerOwner.id" from="${com.bddesh24.User.list()}" optionKey="id" required="" value="${answerInstance?.answerOwner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="answer.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${answerInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'isBest', 'error')} ">
	<label for="isBest">
		<g:message code="answer.isBest.label" default="Is Best" />
		
	</label>
	<g:checkBox name="isBest" value="${answerInstance?.isBest}" />

</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="answer.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="question" name="question.id" from="${com.bddesh24.Question.list()}" optionKey="id" required="" value="${answerInstance?.question?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'totalComment', 'error')} required">
	<label for="totalComment">
		<g:message code="answer.totalComment.label" default="Total Comment" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalComment" type="number" value="${answerInstance.totalComment}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'totalScore', 'error')} required">
	<label for="totalScore">
		<g:message code="answer.totalScore.label" default="Total Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalScore" type="number" value="${answerInstance.totalScore}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'totalView', 'error')} required">
	<label for="totalView">
		<g:message code="answer.totalView.label" default="Total View" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalView" type="number" value="${answerInstance.totalView}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'totalVote', 'error')} required">
	<label for="totalVote">
		<g:message code="answer.totalVote.label" default="Total Vote" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalVote" type="number" value="${answerInstance.totalVote}" required=""/>

</div>

