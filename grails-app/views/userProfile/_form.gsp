<%@ page import="com.bddesh24.UserProfile" %>



<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="userProfile.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${userProfileInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="userProfile.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${userProfileInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'coverImage', 'error')} ">
	<label for="coverImage">
		<g:message code="userProfile.coverImage.label" default="Cover Image" />
		
	</label>
	<g:textField name="coverImage" value="${userProfileInstance?.coverImage}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'isSuperAdmin', 'error')} ">
	<label for="isSuperAdmin">
		<g:message code="userProfile.isSuperAdmin.label" default="Is Super Admin" />
		
	</label>
	<g:checkBox name="isSuperAdmin" value="${userProfileInstance?.isSuperAdmin}" />

</div>

