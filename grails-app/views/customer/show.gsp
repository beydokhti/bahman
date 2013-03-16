
<%@ page import="bahman.Customer" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="show-customer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list customer">
			
				<g:if test="${customerInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="customer.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${customerInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="customer.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${customerInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="customer.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${customerInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="customer.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${customerInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.mobileNo}">
				<li class="fieldcontain">
					<span id="mobileNo-label" class="property-label"><g:message code="customer.mobileNo.label" default="Mobile No" /></span>
					
						<span class="property-value" aria-labelledby="mobileNo-label"><g:fieldValue bean="${customerInstance}" field="mobileNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="customer.accountExpired.label" default="Account Expired" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${customerInstance?.accountExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="customer.accountLocked.label" default="Account Locked" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${customerInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="customer.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${customerInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="customer.passwordExpired.label" default="Password Expired" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${customerInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${customerInstance?.id}" />
					<g:link class="edit" action="edit" id="${customerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    %{--<g:link class="list" action="list" ><g:message code="default.button.list.label" default="List" /></g:link>--}%
				</fieldset>
			</g:form>
		</div>

	</body>
</html>
