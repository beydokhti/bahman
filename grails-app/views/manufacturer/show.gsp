
<%@ page import="bahman.Manufacturer" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'manufacturer.label', default: 'Manufacturer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-manufacturer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="show-manufacturer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list manufacturer">
			
				<g:if test="${manufacturerInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="manufacturer.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${manufacturerInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${manufacturerInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="manufacturer.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${manufacturerInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${manufacturerInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="manufacturer.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${manufacturerInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${manufacturerInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="manufacturer.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${manufacturerInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${manufacturerInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="manufacturer.accountExpired.label" default="Account Expired" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${manufacturerInstance?.accountExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${manufacturerInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="manufacturer.accountLocked.label" default="Account Locked" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${manufacturerInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${manufacturerInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="manufacturer.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${manufacturerInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${manufacturerInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="manufacturer.passwordExpired.label" default="Password Expired" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${manufacturerInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${manufacturerInstance?.id}" />
					<g:link class="edit" action="edit" id="${manufacturerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					%{--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
