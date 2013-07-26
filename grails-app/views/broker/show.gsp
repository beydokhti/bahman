
<%@ page import="bahman.Broker" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'broker.label', default: 'Broker')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-broker" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="show-broker" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list broker">
			
				<g:if test="${brokerInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="broker.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${brokerInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				%{--<g:if test="${brokerInstance?.password}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="password-label" class="property-label"><g:message code="broker.password.label" default="Password" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${brokerInstance}" field="password"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			
				<g:if test="${brokerInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="broker.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${brokerInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="broker.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${brokerInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerInstance?.brokerType}">
				<li class="fieldcontain">
					<span id="brokerType-label" class="property-label"><g:message code="broker.brokerTypeName.label" default="Broker Type" /></span>
					
						<span class="property-value" aria-labelledby="brokerType-label"><g:fieldValue bean="${brokerInstance}" field="brokerTypeName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="broker.accountExpired.label" default="Account Expired" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${brokerInstance?.accountExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="broker.accountLocked.label" default="Account Locked" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${brokerInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="broker.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${brokerInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="broker.passwordExpired.label" default="Password Expired" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${brokerInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${brokerInstance?.id}" />
					<g:link class="edit" action="edit" id="${brokerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					%{--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
