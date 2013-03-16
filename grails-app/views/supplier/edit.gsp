<%@ page import="bahman.Supplier" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-supplier" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="edit-supplier" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${supplierInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${supplierInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
            <div class="row">
                <div class="span6">
                    <div class="detailcontain">
                        <span id="supplierusername-label" class="property-label-small"><g:message code="supplier.username.label"
                                                                                                      default="Username"/></span>

                        <span class="property-value-small" aria-labelledby="dealerBrokerDesc-label"><g:fieldValue
                                bean="${supplierInstance}" field="username"/></span>

                    </div>
                </div>

                <div class="span6">
                    <div class="detailcontain">
                        <span id="supplierUsernames-label" class="property-label-small"><g:message code="supplier.code.label"
                                                                                                       default="Code"/></span>

                        <span class="property-value-small" aria-labelledby="dealerBrokerDesc-label"><g:fieldValue
                                bean="${supplierInstance}" field="code"/></span>

                    </div>
                </div>
            </div>

			<g:form method="post" >
				<g:hiddenField name="id" value="${supplierInstance?.id}" />
				<g:hiddenField name="version" value="${supplierInstance?.version}" />
				<fieldset class="form">
					%{--<g:render template="form"/>--}%

                    %{--<div class="fieldcontain ${hasErrors(bean: supplierInstance, field: 'username', 'error')} required">--}%
                        %{--<label for="username">--}%
                            %{--<g:message code="supplier.username.label" default="Username" />--}%
                            %{--<span class="required-indicator">*</span>--}%
                        %{--</label>--}%
                        %{--<g:textField name="username" required="" value="${supplierInstance?.username}"/>--}%
                    %{--</div>--}%

                    <div class="fieldcontain ${hasErrors(bean: supplierInstance, field: 'password', 'error')} required">
                        <label for="password">
                            <g:message code="supplier.password.label" default="Password" />
                            <span class="required-indicator">*</span>
                        </label>
                        <g:textField name="password" required="" value="${supplierInstance?.password}"/>
                    </div>

                    %{--<div class="fieldcontain ${hasErrors(bean: supplierInstance, field: 'code', 'error')} required">--}%
                        %{--<label for="code">--}%
                            %{--<g:message code="supplier.code.label" default="Code" />--}%
                            %{--<span class="required-indicator">*</span>--}%
                        %{--</label>--}%
                        %{--<g:textField name="code" maxlength="50" required="" value="${supplierInstance?.code}"/>--}%
                    %{--</div>--}%

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


                </fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					%{--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
