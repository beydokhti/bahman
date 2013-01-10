<%@ page import="bahman.Customer" %>



<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="customer.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${customerInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="customer.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${customerInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="customer.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" maxlength="200" required="" value="${customerInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="customer.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="200" value="${customerInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'mobileNo', 'error')} ">
	<label for="mobileNo">
		<g:message code="customer.mobileNo.label" default="Mobile No" />
		
	</label>
	<g:textField name="mobileNo" maxlength="15" value="${customerInstance?.mobileNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="customer.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${customerInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="customer.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${customerInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="customer.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${customerInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="customer.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${customerInstance?.passwordExpired}" />
</div>

