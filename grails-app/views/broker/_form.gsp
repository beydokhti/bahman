<%@ page import="bahman.Broker" %>



<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="broker.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${brokerInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="broker.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${brokerInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="broker.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" maxlength="50" required="" value="${brokerInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="broker.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" maxlength="200" required="" value="${brokerInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'brokerType', 'error')} ">
	<label for="brokerType">
		<g:message code="broker.brokerType.label" default="Broker Type" />
		
	</label>
	<g:select name="brokerType" from="${brokerInstance.constraints.brokerType.inList}" value="${brokerInstance?.brokerType}" valueMessagePrefix="broker.brokerType" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="broker.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${brokerInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="broker.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${brokerInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="broker.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${brokerInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="broker.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${brokerInstance?.passwordExpired}" />
</div>

