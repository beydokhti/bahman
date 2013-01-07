
<%@ page import="bahman.Attachment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'attachment.label', default: 'Attachment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-attachment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-attachment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list attachment">
			
				<g:if test="${attachmentInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="attachment.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${attachmentInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attachmentInstance?.document}">
				<li class="fieldcontain">
					<span id="document-label" class="property-label"><g:message code="attachment.document.label" default="Document" /></span>

                        <span class="property-value" aria-labelledby="status-label"><img src="<g:createLink action="getImage" controller="contract" params="[id:attachmentInstance?.id]" />"></span>
				</li>
				</g:if>
			
				<g:if test="${attachmentInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="attachment.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${attachmentInstance}" field="status"/></span>
					
				</li>
				</g:if>

                <g:if test="${attachmentInstance?.version}">
                    <li class="fieldcontain">
                        <span id="status-label" class="property-label"><g:message code="attachment.version.label" default="Version" /></span>

                        <span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${attachmentInstance}" field="status"/></span>

                    </li>
                </g:if>

                <g:if test="${attachmentInstance?.fileName}">
                    <li class="fieldcontain">
                        <span id="status-label" class="property-label"><g:message code="attachment.fileName.label" default="File Name" /></span>

                        <span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${attachmentInstance}" field="fileName"/></span>

                    </li>
                </g:if>

				<g:if test="${attachmentInstance?.uploadDate}">
				<li class="fieldcontain">
					<span id="uploadDate-label" class="property-label"><g:message code="attachment.uploadDate.label" default="Upload Date" /></span>
					
						<span class="property-value" aria-labelledby="uploadDate-label"><rg:formatJalaliDate date="${attachmentInstance?.uploadDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${attachmentInstance?.responsible}">
				<li class="fieldcontain">
					<span id="responsible-label" class="property-label"><g:message code="attachment.responsible.label" default="Responsible" /></span>
					
						<span class="property-value" aria-labelledby="responsible-label">${attachmentInstance.responsible.toString()}</span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${attachmentInstance?.id}" />
					%{--<g:link class="edit" action="edit" id="${attachmentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>--}%
					%{--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
