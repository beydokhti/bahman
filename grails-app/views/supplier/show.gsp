
<%@ page import="bahman.Supplier" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-supplier" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="show-supplier" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list supplier">

				<g:if test="${supplierInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="supplier.username.label" default="Username" /></span>

						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${supplierInstance}" field="username"/></span>

				</li>
				</g:if>

				<g:if test="${supplierInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="supplier.password.label" default="Password" /></span>

						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${supplierInstance}" field="password"/></span>

				</li>
				</g:if>

				<g:if test="${supplierInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="supplier.code.label" default="Code" /></span>

						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${supplierInstance}" field="code"/></span>

				</li>
				</g:if>

				<g:if test="${supplierInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="supplier.description.label" default="Description" /></span>

						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${supplierInstance}" field="description"/></span>

				</li>
				</g:if>

				<g:if test="${supplierInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="supplier.accountExpired.label" default="Account Expired" /></span>

						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${supplierInstance?.accountExpired}" /></span>

				</li>
				</g:if>

				<g:if test="${supplierInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="supplier.accountLocked.label" default="Account Locked" /></span>

						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${supplierInstance?.accountLocked}" /></span>

				</li>
				</g:if>

				<g:if test="${supplierInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="supplier.enabled.label" default="Enabled" /></span>

						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${supplierInstance?.enabled}" /></span>

				</li>
				</g:if>

				<g:if test="${supplierInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="supplier.passwordExpired.label" default="Password Expired" /></span>

						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${supplierInstance?.passwordExpired}" /></span>

				</li>
				</g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${supplierInstance?.id}" />
					<g:link class="edit" action="edit" id="${supplierInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					%{--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
