<%@ page import="bahman.Broker" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'broker.label', default: 'Broker')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-broker" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="edit-broker" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${brokerInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${brokerInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
            <div class="row">
                <div class="span4">
                    <div class="detailcontain">
                        <span id="brokerusername-label" class="property-label-small"><g:message code="broker.username.label"
                                                                                                  default="Username"/></span>

                        <span class="property-value-small" aria-labelledby="dealerBrokerDesc-label"><g:fieldValue
                                bean="${brokerInstance}" field="username"/></span>

                    </div>
                </div>

                <div class="span4">
                    <div class="detailcontain">
                        <span id="brokerUsernames-label" class="property-label-small"><g:message code="broker.code.label"
                                                                                                   default="Code"/></span>

                        <span class="property-value-small" aria-labelledby="dealerBrokerDesc-label"><g:fieldValue
                                bean="${brokerInstance}" field="code"/></span>

                    </div>
                </div>
                <div class="span4">
                    <div class="detailcontain">
                        <span id="brokerBrokerTypeName-label" class="property-label-small"><g:message code="broker.brokerTypeName.label"
                                                                                                default="Broker Type"/></span>

                        <span class="property-value-small" aria-labelledby="dealerBrokerTypeName-label"><g:fieldValue
                                bean="${brokerInstance}" field="brokerTypeName"/></span>

                    </div>
                </div>
            </div>
			<g:form method="post" >
				<g:hiddenField name="id" value="${brokerInstance?.id}" />
				<g:hiddenField name="version" value="${brokerInstance?.version}" />
				<fieldset class="form">
					%{--<g:render template="form"/>--}%

                    %{--<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'username', 'error')} required">--}%
                        %{--<label for="username">--}%
                            %{--<g:message code="broker.username.label" default="Username" />--}%
                            %{--<span class="required-indicator">*</span>--}%
                        %{--</label>--}%
                        %{--<g:textField name="username" required="" value="${brokerInstance?.username}"/>--}%
                    %{--</div>--}%

                    <div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'password', 'error')} required">
                        <label for="password">
                            <g:message code="broker.password.label" default="Password" />
                            <span class="required-indicator">*</span>
                        </label>
                        <g:textField name="password" required="" value="${brokerInstance?.password}"/>
                    </div>

                    %{--<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'code', 'error')} required">--}%
                        %{--<label for="code">--}%
                            %{--<g:message code="broker.code.label" default="Code" />--}%
                            %{--<span class="required-indicator">*</span>--}%
                        %{--</label>--}%
                        %{--<g:textField name="code" maxlength="50" required="" value="${brokerInstance?.code}"/>--}%
                    %{--</div>--}%

                    %{--<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'description', 'error')} required">--}%
                        %{--<label for="description">--}%
                            %{--<g:message code="broker.description.label" default="Description" />--}%
                            %{--<span class="required-indicator">*</span>--}%
                        %{--</label>--}%
                        %{--<g:textField name="description" maxlength="200" required="" value="${brokerInstance?.description}"/>--}%
                    %{--</div>--}%

                    %{--<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'brokerType', 'error')} ">--}%
                        %{--<label for="brokerType">--}%
                            %{--<g:message code="broker.brokerType.label" default="Broker Type" />--}%

                        %{--</label>--}%
                        %{--<g:select name="brokerType" from="${brokerInstance.constraints.brokerType.inList}" value="${brokerInstance?.brokerType}" valueMessagePrefix="broker.brokerType" noSelection="['': '']"/>--}%
                    %{--</div>--}%

                    %{--<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'accountExpired', 'error')} ">--}%
                        %{--<label for="accountExpired">--}%
                            %{--<g:message code="broker.accountExpired.label" default="Account Expired" />--}%

                        %{--</label>--}%
                        %{--<g:checkBox name="accountExpired" value="${brokerInstance?.accountExpired}" />--}%
                    %{--</div>--}%

                    %{--<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'accountLocked', 'error')} ">--}%
                        %{--<label for="accountLocked">--}%
                            %{--<g:message code="broker.accountLocked.label" default="Account Locked" />--}%

                        %{--</label>--}%
                        %{--<g:checkBox name="accountLocked" value="${brokerInstance?.accountLocked}" />--}%
                    %{--</div>--}%

                    %{--<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'enabled', 'error')} ">--}%
                        %{--<label for="enabled">--}%
                            %{--<g:message code="broker.enabled.label" default="Enabled" />--}%

                        %{--</label>--}%
                        %{--<g:checkBox name="enabled" value="${brokerInstance?.enabled}" />--}%
                    %{--</div>--}%

                    %{--<div class="fieldcontain ${hasErrors(bean: brokerInstance, field: 'passwordExpired', 'error')} ">--}%
                        %{--<label for="passwordExpired">--}%
                            %{--<g:message code="broker.passwordExpired.label" default="Password Expired" />--}%

                        %{--</label>--}%
                        %{--<g:checkBox name="passwordExpired" value="${brokerInstance?.passwordExpired}" />--}%
                    %{--</div>--}%


                </fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="updatePassword" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					%{--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
