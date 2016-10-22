<%@ page import="com.bddesh24.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="question.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="title" cols="40" rows="5" maxlength="500" required="" value="${questionInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'shortDescription', 'error')} ">
	<label for="shortDescription">
		<g:message code="question.shortDescription.label" default="Short Description" />
		
	</label>
	<g:textArea name="shortDescription" cols="40" rows="5" maxlength="500" value="${questionInstance?.shortDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'questionTags', 'error')} ">
	<label for="questionTags">
		<g:message code="question.questionTags.label" default="Question Tags" />
		
	</label>
	<g:textArea name="questionTags" cols="40" rows="5" maxlength="500" value="${questionInstance?.questionTags}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'imageName', 'error')} ">
	<label for="imageName">
		<g:message code="question.imageName.label" default="Image Name" />
		
	</label>
	<g:textField name="imageName" maxlength="150" value="${questionInstance?.imageName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'answers', 'error')} ">
	<label for="answers">
		<g:message code="question.answers.label" default="Answers" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${questionInstance?.answers?}" var="a">
    <li><g:link controller="answer" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="answer" action="create" params="['question.id': questionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'answer.label', default: 'Answer')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'bestAnswer', 'error')} ">
	<label for="bestAnswer">
		<g:message code="question.bestAnswer.label" default="Best Answer" />
		
	</label>
	<g:select id="bestAnswer" name="bestAnswer.id" from="${com.bddesh24.Answer.list()}" optionKey="id" value="${questionInstance?.bestAnswer?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="question.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${questionInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'featured', 'error')} ">
	<label for="featured">
		<g:message code="question.featured.label" default="Featured" />
		
	</label>
	<g:checkBox name="featured" value="${questionInstance?.featured}" />

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'postId', 'error')} required">
	<label for="postId">
		<g:message code="question.postId.label" default="Post Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="postId" type="number" value="${questionInstance.postId}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'questionOwner', 'error')} required">
	<label for="questionOwner">
		<g:message code="question.questionOwner.label" default="Question Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="questionOwner" name="questionOwner.id" from="${com.bddesh24.User.list()}" optionKey="id" required="" value="${questionInstance?.questionOwner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'totalAnswer', 'error')} required">
	<label for="totalAnswer">
		<g:message code="question.totalAnswer.label" default="Total Answer" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalAnswer" type="number" value="${questionInstance.totalAnswer}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'totalScore', 'error')} required">
	<label for="totalScore">
		<g:message code="question.totalScore.label" default="Total Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalScore" type="number" value="${questionInstance.totalScore}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'totalView', 'error')} required">
	<label for="totalView">
		<g:message code="question.totalView.label" default="Total View" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalView" type="number" value="${questionInstance.totalView}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'totalVote', 'error')} required">
	<label for="totalVote">
		<g:message code="question.totalVote.label" default="Total Vote" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalVote" type="number" value="${questionInstance.totalVote}" required=""/>

</div>

