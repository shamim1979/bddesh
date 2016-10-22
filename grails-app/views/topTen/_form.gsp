<%@ page import="com.bddesh24.TopTen" %>



<div class="fieldcontain ${hasErrors(bean: topTenInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="topTen.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="title" cols="40" rows="5" maxlength="300" required="" value="${topTenInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenInstance, field: 'shortDescription', 'error')} ">
	<label for="shortDescription">
		<g:message code="topTen.shortDescription.label" default="Short Description" />
		
	</label>
	<g:textArea name="shortDescription" cols="40" rows="5" maxlength="500" value="${topTenInstance?.shortDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenInstance, field: 'detailsDescription', 'error')} required">
	<label for="detailsDescription">
		<g:message code="topTen.detailsDescription.label" default="Details Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="detailsDescription" cols="40" rows="5" maxlength="1000" required="" value="${topTenInstance?.detailsDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenInstance, field: 'topTenTags', 'error')} ">
	<label for="topTenTags">
		<g:message code="topTen.topTenTags.label" default="Top Ten Tags" />
		
	</label>
	<g:textArea name="topTenTags" cols="40" rows="5" maxlength="500" value="${topTenInstance?.topTenTags}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenInstance, field: 'imageName', 'error')} ">
	<label for="imageName">
		<g:message code="topTen.imageName.label" default="Image Name" />
		
	</label>
	<g:textField name="imageName" maxlength="150" value="${topTenInstance?.imageName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenInstance, field: 'topTenItems', 'error')} ">
	<label for="topTenItems">
		<g:message code="topTen.topTenItems.label" default="Top Ten Items" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${topTenInstance?.topTenItems?}" var="t">
    <li><g:link controller="topTenItem" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="topTenItem" action="create" params="['topTen.id': topTenInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'topTenItem.label', default: 'TopTenItem')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: topTenInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="topTen.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${topTenInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: topTenInstance, field: 'featured', 'error')} ">
	<label for="featured">
		<g:message code="topTen.featured.label" default="Featured" />
		
	</label>
	<g:checkBox name="featured" value="${topTenInstance?.featured}" />

</div>

<div class="fieldcontain ${hasErrors(bean: topTenInstance, field: 'postId', 'error')} required">
	<label for="postId">
		<g:message code="topTen.postId.label" default="Post Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="postId" type="number" value="${topTenInstance.postId}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenInstance, field: 'topTenOwner', 'error')} required">
	<label for="topTenOwner">
		<g:message code="topTen.topTenOwner.label" default="Top Ten Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topTenOwner" name="topTenOwner.id" from="${com.bddesh24.User.list()}" optionKey="id" required="" value="${topTenInstance?.topTenOwner?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenInstance, field: 'totalImages', 'error')} required">
	<label for="totalImages">
		<g:message code="topTen.totalImages.label" default="Total Images" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalImages" type="number" value="${topTenInstance.totalImages}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenInstance, field: 'totalScore', 'error')} required">
	<label for="totalScore">
		<g:message code="topTen.totalScore.label" default="Total Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalScore" type="number" value="${topTenInstance.totalScore}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenInstance, field: 'totalTopTenItem', 'error')} required">
	<label for="totalTopTenItem">
		<g:message code="topTen.totalTopTenItem.label" default="Total Top Ten Item" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalTopTenItem" type="number" value="${topTenInstance.totalTopTenItem}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenInstance, field: 'totalView', 'error')} required">
	<label for="totalView">
		<g:message code="topTen.totalView.label" default="Total View" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalView" type="number" value="${topTenInstance.totalView}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: topTenInstance, field: 'totalVote', 'error')} required">
	<label for="totalVote">
		<g:message code="topTen.totalVote.label" default="Total Vote" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalVote" type="number" value="${topTenInstance.totalVote}" required=""/>

</div>

