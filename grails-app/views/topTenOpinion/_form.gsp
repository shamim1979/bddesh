<%@ page import="com.bddesh24.TopTenOpinion" %>



<div class="fieldcontain ${hasErrors(bean: topTenOpinionInstance, field: 'opinion', 'error')} required">
	<label for="opinion">
		<g:message code="topTenOpinion.opinion.label" default="Opinion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="opinion" cols="40" rows="5" maxlength="500" required="" value="${topTenOpinionInstance?.opinion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenOpinionInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="topTenOpinion.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${topTenOpinionInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: topTenOpinionInstance, field: 'opinionOwner', 'error')} required">
	<label for="opinionOwner">
		<g:message code="topTenOpinion.opinionOwner.label" default="Opinion Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="opinionOwner" name="opinionOwner.id" from="${com.bddesh24.User.list()}" optionKey="id" required="" value="${topTenOpinionInstance?.opinionOwner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenOpinionInstance, field: 'topTenItem', 'error')} required">
	<label for="topTenItem">
		<g:message code="topTenOpinion.topTenItem.label" default="Top Ten Item" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topTenItem" name="topTenItem.id" from="${com.bddesh24.TopTenItem.list()}" optionKey="id" required="" value="${topTenOpinionInstance?.topTenItem?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenOpinionInstance, field: 'totalLike', 'error')} required">
	<label for="totalLike">
		<g:message code="topTenOpinion.totalLike.label" default="Total Like" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalLike" type="number" value="${topTenOpinionInstance.totalLike}" required=""/>

</div>

