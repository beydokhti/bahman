
<%@ page import="bahman.Draft" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'draft.label', default: 'Draft')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<a href="#show-draft" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div id="show-draft" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list draft">

        <g:if test="${draftInstance?.description}">
            <li class="fieldcontain">
                <span id="description-label" class="property-label"><g:message code="draft.description.label" default="Description" /></span>

                <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${draftInstance}" field="description"/></span>

            </li>
        </g:if>

        <g:if test="${draftInstance?.document}">
            <li class="fieldcontain">
                <span id="document-label" class="property-label"><g:message code="draft.document.label" default="Document" /></span>

                <span class="property-value" aria-labelledby="status-label"><img src="<g:createLink action="getImage" controller="draft" params="[id:draftInstance?.id]" />"></span>
            </li>
        </g:if>


        <g:if test="${draftInstance?.versionNo}">
            <li class="fieldcontain">
                <span id="version-label" class="property-label"><g:message code="draft.version.label" default="Version" /></span>

                <span class="property-value" aria-labelledby="version-label"><g:fieldValue bean="${draftInstance}" field="versionNo"/></span>

            </li>
        </g:if>

        <g:if test="${draftInstance?.fileName}">
            <li class="fieldcontain">
                <span id="status-label" class="property-label"><g:message code="draft.fileName.label" default="File Name" /></span>

                <span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${draftInstance}" field="fileName"/></span>

            </li>
        </g:if>

        <g:if test="${draftInstance?.uploadDate}">
            <li class="fieldcontain">
                <span id="uploadDate-label" class="property-label"><g:message code="draft.uploadDate.label" default="Upload Date" /></span>

                <span class="property-value" aria-labelledby="uploadDate-label"><rg:formatJalaliDate date="${draftInstance?.uploadDate}" /></span>

            </li>
        </g:if>

        <g:if test="${draftInstance?.responsible}">
            <li class="fieldcontain">
                <span id="responsible-label" class="property-label"><g:message code="draft.responsible.label" default="Responsible" /></span>

                <span class="property-value" aria-labelledby="responsible-label">${draftInstance.responsible.toString()}</span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${draftInstance?.id}" />
            %{--<g:link class="edit" action="edit" id="${draftInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>--}%
            %{--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
        </fieldset>
    </g:form>
</div>
</body>
</html>
