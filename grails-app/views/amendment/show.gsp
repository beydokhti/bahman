<%@ page import="bahman.Contract" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><g:link action="list" controller="contract"><g:message code="default.button.list.label"/></g:link></li>
    </ul>
</div>
<a href="#show-contract" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               %{--default="Skip to content&hellip;"/></a>

<div id="show-amendment" class="content scaffold-show" role="main">
    <div class="detail-property-list">
        <div class="row">
            <div class="span2"><div id="contractNo-label" class="field-label"><g:message
                    code="amendment.contractNo.label" default="Contract No"/></div></div>

            <div class="span2"><div class="property-value" aria-labelledby="contractNo-label"><g:fieldValue
                    bean="${amendmentInstance}" field="contractNo"/></div></div>

            <div class="span2"><div id="contractPartNo-label" class="field-label"><g:message
                    code="amendment.contractPartNo.label" default="Contract Part No"/></div></div>

            <div class="span2"><div class="property-value" aria-labelledby="contractPartNo-label"><g:fieldValue
                    bean="${amendmentInstance}" field="contractPartNo"/></div></div>
        </div>

        <div class="row">
            <div class="span2"><div id="amendmentDate-label" class="field-label"><g:message
                    code="amendment.amendmentDate.label" default="Amendment Date"/></div></div>

            <div class="span2"><div class="property-value" aria-labelledby="amendmentDate-label"><rg:formatJalaliDate
                    date="${amendmentInstance?.amendmentDate}"/></div></div>

            <div class="span2"><div id="comment-label" class="field-label"><g:message code="amendment.comment.label"
                                                                                      default="Comment"/></div></div>

            <div class="span2"><div class="property-value" aria-labelledby="comment-label"><g:fieldValue
                    bean="${amendmentInstance}" field="comment"/></div></div>
        </div>

        <div class="row">
            <div class="span2"><div id="amendmentDocument-label" class="field-label"><g:message
                    code="amendment.amendmentDocument.label" default="Amendment Document"/></div></div>
            <a href="<g:createLink action="getDocument" params="[id:amendmentInstance?.id]"/>" target="_blank">
                <g:if test="${amendmentInstance?.contentType?.contains("/") && amendmentInstance?.contentType[0..amendmentInstance?.contentType?.indexOf("/")-1] == 'image'}">
                    <img src="<g:createLink action="getDocument" params="[id:amendmentInstance?.id]"/>" style="max-width: 100px;">
                </g:if>
                <g:else>
                    ${amendmentInstance?.fileName}
                </g:else>
            </a>
        </div>
    </div>

    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${amendmentInstance?.id}"/>
            <g:link class="edit" action="edit" id="${amendmentInstance?.id}"><g:message code="default.button.edit.label"
                                                                                        default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
