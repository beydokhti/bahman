<%@ page import="bahman.Manufacturer" %>



<div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="manufacturer.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${manufacturerInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="manufacturer.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${manufacturerInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="manufacturer.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" maxlength="50" required="" value="${manufacturerInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="manufacturer.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" maxlength="200" required="" value="${manufacturerInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="manufacturer.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${manufacturerInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="manufacturer.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${manufacturerInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="manufacturer.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${manufacturerInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="manufacturer.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${manufacturerInstance?.passwordExpired}" />
</div>

