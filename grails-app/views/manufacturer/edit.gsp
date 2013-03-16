<%@ page import="bahman.Manufacturer" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'manufacturer.label', default: 'Manufacturer')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-manufacturer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="edit-manufacturer" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${manufacturerInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${manufacturerInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
            <div class="row">
                <div class="span4">
                    <div class="detailcontain">
                        <span id="manufacturerusername-label" class="property-label-small"><g:message code="manufacturer.username.label"
                                                                                                  default="Username"/></span>

                        <span class="property-value-small" aria-labelledby="manufacturerDesc-label"><g:fieldValue
                                bean="${manufacturerInstance}" field="username"/></span>

                    </div>
                </div>

                <div class="span4">
                    <div class="detailcontain">
                        <span id="manufacturercode-label" class="property-label-small"><g:message code="manufacturer.code.label"
                                                                                                   default="Code"/></span>

                        <span class="property-value-small" aria-labelledby="manufacturerDesc-label"><g:fieldValue
                                bean="${manufacturerInstance}" field="code"/></span>

                    </div>
                </div>
                <div class="span4">
                    <div class="detailcontain">
                        <span id="manufacturerDescription-label" class="property-label-small"><g:message code="manufacturer.description.label"
                                                                                                       default="Description"/></span>

                        <span class="property-value-small" aria-labelledby="manufacturerDesc-label"><g:fieldValue
                                bean="${manufacturerInstance}" field="description"/></span>

                    </div>
                </div>

            </div>


            <g:form method="post" >
				<g:hiddenField name="id" value="${manufacturerInstance?.id}" />
				<g:hiddenField name="version" value="${manufacturerInstance?.version}" />
				<fieldset class="form">
					%{--<g:render template="form"/>--}%


                    %{--<div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'username', 'error')} required">--}%
                        %{--<label for="username">--}%
                            %{--<g:message code="manufacturer.username.label" default="Username" />--}%
                            %{--<span class="required-indicator">*</span>--}%
                        %{--</label>--}%
                        %{--<g:textField name="username" required="" value="${manufacturerInstance?.username}"/>--}%
                    %{--</div>--}%

                    <div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'password', 'error')} required">
                        <label for="password">
                            <g:message code="manufacturer.password.label" default="Password" />
                            <span class="required-indicator">*</span>
                        </label>
                        <g:textField name="password" required="" value="${manufacturerInstance?.password}"/>
                    </div>

                    %{--<div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'code', 'error')} required">--}%
                        %{--<label for="code">--}%
                            %{--<g:message code="manufacturer.code.label" default="Code" />--}%
                            %{--<span class="required-indicator">*</span>--}%
                        %{--</label>--}%
                        %{--<g:textField name="code" maxlength="50" required="" value="${manufacturerInstance?.code}"/>--}%
                    %{--</div>--}%

                    %{--<div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'description', 'error')} required">--}%
                        %{--<label for="description">--}%
                            %{--<g:message code="manufacturer.description.label" default="Description" />--}%
                            %{--<span class="required-indicator">*</span>--}%
                        %{--</label>--}%
                        %{--<g:textField name="description" maxlength="200" required="" value="${manufacturerInstance?.description}"/>--}%
                    %{--</div>--}%

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


                </fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					%{--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
