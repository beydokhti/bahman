
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
			
				%{--<g:if test="${manufacturerInstance?.password}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="password-label" class="property-label"><g:message code="manufacturer.password.label" default="Password" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${manufacturerInstance}" field="password"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%

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

                <g:if test="${manufacturerInstance?.draftNoFormat}">
                    <li class="fieldcontain">
                        <span id="draftNoFormat-label" class="property-label"><g:message code="manufacturer.draftNoFormat.label" default="draftNoFormat" /></span>

                        <span class="property-value" aria-labelledby="draftNoFormat-label"><g:fieldValue bean="${manufacturerInstance}" field="draftNoFormat"/></span>

                    </li>
                </g:if>
                <g:if test="${manufacturerInstance?.draftNoSequence}">
                    <li class="fieldcontain">
                        <span id="draftNoSequence-label" class="property-label"><g:message code="manufacturer.draftNoSequence.label" default="draftNoSequence" /></span>

                        <span class="property-value" aria-labelledby="draftNoSequence-label"><g:fieldValue bean="${manufacturerInstance}" field="draftNoSequence"/></span>

                    </li>
                </g:if>

                <g:if test="${manufacturerInstance?.address}">
                    <li class="fieldcontain">
                        <span id="address-label" class="property-label"><g:message code="manufacturer.address.label" default="address" /></span>

                        <span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${manufacturerInstance}" field="address"/></span>

                    </li>
                </g:if>
                <g:if test="${manufacturerInstance?.sellerName}">
                    <li class="fieldcontain">
                        <span id="sellerName-label" class="property-label"><g:message code="manufacturer.sellerName.label" default="sellerName" /></span>

                        <span class="property-value" aria-labelledby="sellerName-label"><g:fieldValue bean="${manufacturerInstance}" field="sellerName"/></span>

                    </li>
                </g:if>

                <g:if test="${manufacturerInstance?.phoneNo}">
                    <li class="fieldcontain">
                        <span id="phoneNo-label" class="property-label"><g:message code="manufacturer.phoneNo.label" default="phoneNo" /></span>

                        <span class="property-value" aria-labelledby="phoneNo-label"><g:fieldValue bean="${manufacturerInstance}" field="phoneNo"/></span>

                    </li>
                </g:if>
                <g:if test="${manufacturerInstance?.businessId}">
                    <li class="fieldcontain">
                        <span id="businessId-label" class="property-label"><g:message code="manufacturer.businessId.label" default="businessId" /></span>

                        <span class="property-value" aria-labelledby="businessId-label"><g:fieldValue bean="${manufacturerInstance}" field="businessId"/></span>

                    </li>
                </g:if>

                <g:if test="${manufacturerInstance?.postalCode}">
                    <li class="fieldcontain">
                        <span id="postalCode-label" class="property-label"><g:message code="manufacturer.postalCode.label" default="postalCode" /></span>

                        <span class="property-value" aria-labelledby="postalCode-label"><g:fieldValue bean="${manufacturerInstance}" field="postalCode"/></span>

                    </li>
                </g:if>
                <g:if test="${manufacturerInstance?.fax}">
                    <li class="fieldcontain">
                        <span id="fax-label" class="property-label"><g:message code="manufacturer.fax.label" default="fax" /></span>

                        <span class="property-value" aria-labelledby="fax-label"><g:fieldValue bean="${manufacturerInstance}" field="fax"/></span>

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
