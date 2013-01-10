<%@ page import="bahman.Supplier" %>



<div class="fieldcontain ${hasErrors(bean: supplierInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="supplier.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${supplierInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: supplierInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="supplier.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${supplierInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: supplierInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="supplier.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" maxlength="50" required="" value="${supplierInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: supplierInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="supplier.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" maxlength="200" required="" value="${supplierInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: supplierInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="supplier.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${supplierInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: supplierInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="supplier.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${supplierInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: supplierInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="supplier.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${supplierInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: supplierInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="supplier.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${supplierInstance?.passwordExpired}" />
</div>

