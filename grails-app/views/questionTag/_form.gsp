<%@ page import="com.bddesh24.QuestionTag" %>



<div class="fieldcontain ${hasErrors(bean: questionTagInstance, field: 'questionTag', 'error')} required">
	<label for="questionTag">
		<g:message code="questionTag.questionTag.label" default="Question Tag" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="questionTag" maxlength="150" required="" value="${questionTagInstance?.questionTag}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionTagInstance, field: 'coverImage', 'error')} ">
	<label for="coverImage">
		<g:message code="questionTag.coverImage.label" default="Cover Image" />
		
	</label>
	<g:textField name="coverImage" maxlength="150" value="${questionTagInstance?.coverImage}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionTagInstance, field: 'relatedHashwords', 'error')} ">
	<label for="relatedHashwords">
		<g:message code="questionTag.relatedHashwords.label" default="Related Hashwords" />
		
	</label>
	<g:textArea name="relatedHashwords" cols="40" rows="5" maxlength="800" value="${questionTagInstance?.relatedHashwords}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionTagInstance, field: 'tagDescription', 'error')} ">
	<label for="tagDescription">
		<g:message code="questionTag.tagDescription.label" default="Tag Description" />
		
	</label>
	<g:textArea name="tagDescription" cols="40" rows="5" maxlength="300" value="${questionTagInstance?.tagDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionTagInstance, field: 'questions', 'error')} ">
	<label for="questions">
		<g:message code="questionTag.questions.label" default="Questions" />
		
	</label>
	<g:select name="questions" from="${com.bddesh24.Question.list()}" multiple="multiple" optionKey="id" size="5" value="${questionTagInstance?.questions*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionTagInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="questionTag.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${questionTagInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: questionTagInstance, field: 'featured', 'error')} ">
	<label for="featured">
		<g:message code="questionTag.featured.label" default="Featured" />
		
	</label>
	<g:checkBox name="featured" value="${questionTagInstance?.featured}" />

</div>

<div class="fieldcontain ${hasErrors(bean: questionTagInstance, field: 'questionTagOwner', 'error')} required">
	<label for="questionTagOwner">
		<g:message code="questionTag.questionTagOwner.label" default="Question Tag Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="questionTagOwner" name="questionTagOwner.id" from="${com.bddesh24.User.list()}" optionKey="id" required="" value="${questionTagInstance?.questionTagOwner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionTagInstance, field: 'totalQuestion', 'error')} required">
	<label for="totalQuestion">
		<g:message code="questionTag.totalQuestion.label" default="Total Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalQuestion" type="number" value="${questionTagInstance.totalQuestion}" required=""/>

</div>

