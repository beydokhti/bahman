<%@ page import="bahman.Customer" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<a href="#edit-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>
<div id="edit-customer" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${customerInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${customerInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <div class="row">
        <div class="span6">
            <div class="detailcontain">
                <span id="customerusername-label" class="property-label-small"><g:message code="customer.username.label"
                                                                                          default="Username"/></span>

                <span class="property-value-small" aria-labelledby="customerDesc-label"><g:fieldValue
                        bean="${customerInstance}" field="username"/></span>

            </div>
        </div>

        <div class="span6">
            <div class="detailcontain">
                <span id="customerUsernames-label" class="property-label-small"><g:message code="customer.code.label"
                                                                                           default="Code"/></span>

                <span class="property-value-small" aria-labelledby="customerCode-label"><g:fieldValue
                        bean="${customerInstance}" field="code"/></span>

            </div>
        </div>
    </div>
    <g:form method="post">
        <g:hiddenField name="id" value="${customerInstance?.id}"/>
        <g:hiddenField name="version" value="${customerInstance?.version}"/>
        <fieldset class="form">
            %{--<g:render template="form"/>--}%


            <div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'password', 'error')} required">
                <label for="password">
                    <g:message code="customer.password.label" default="Password"/>
                    <span class="required-indicator">*</span>
                </label>
                <g:textField name="password" required="" value="${customerInstance?.password}"/>
            </div>

            %{--<div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'code', 'error')} required">--}%
            %{--<label for="code">--}%
            %{--<g:message code="customer.code.label" default="Code" />--}%
            %{--<span class="required-indicator">*</span>--}%
            %{--</label>--}%
            %{--<g:textField name="code" maxlength="200" required="" value="${customerInstance?.code}"/>--}%
            %{--</div>--}%

            <div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'description', 'error')} ">
                <label for="description">
                    <g:message code="customer.description.label" default="Description"/>

                </label>
                <g:textField name="description" maxlength="200" value="${customerInstance?.description}"/>
            </div>

            <div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'mobileNo', 'error')} ">
                <label for="mobileNo">
                    <g:message code="customer.mobileNo.label" default="Mobile No"/>

                </label>
                <g:textField name="mobileNo" maxlength="15" value="${customerInstance?.mobileNo}"/>
            </div>

            <div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'accountExpired', 'error')} ">
                <label for="accountExpired">
                    <g:message code="customer.accountExpired.label" default="Account Expired"/>

                </label>
                <g:checkBox name="accountExpired" value="${customerInstance?.accountExpired}"/>
            </div>

            <div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'accountLocked', 'error')} ">
                <label for="accountLocked">
                    <g:message code="customer.accountLocked.label" default="Account Locked"/>

                </label>
                <g:checkBox name="accountLocked" value="${customerInstance?.accountLocked}"/>
            </div>

            <div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'enabled', 'error')} ">
                <label for="enabled">
                    <g:message code="customer.enabled.label" default="Enabled"/>

                </label>
                <g:checkBox name="enabled" value="${customerInstance?.enabled}"/>
            </div>

            <div class="fieldcontain ${hasErrors(bean: customerInstance, field: 'passwordExpired', 'error')} ">
                <label for="passwordExpired">
                    <g:message code="customer.passwordExpired.label" default="Password Expired"/>

                </label>
                <g:checkBox name="passwordExpired" value="${customerInstance?.passwordExpired}"/>
            </div>

        </fieldset>
        <fieldset class="buttons">
            <g:actionSubmit class="save" action="update"
                            value="${message(code: 'default.button.update.label', default: 'Update')}"/>
            %{--<g:actionSubmit class="delete" action="delete"--}%
                            %{--value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate=""--}%
                            %{--onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>--}%
        </fieldset>
    </g:form>
</div>
</body>
</html>
