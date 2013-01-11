<%@ page import="bahman.Amendment" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'amendment.label', default: 'Amendment')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-amendment" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-amendment" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list amendment">

        <g:if test="${amendmentInstance?.amendmentDate}">
            <li class="fieldcontain">
                <span id="amendmentDate-label" class="property-label"><g:message code="amendment.amendmentDate.label"
                                                                                 default="Amendment Date"/></span>

                <span class="property-value" aria-labelledby="amendmentDate-label"><g:formatDate
                        date="${amendmentInstance?.amendmentDate}"/></span>

            </li>
        </g:if>

        <g:if test="${amendmentInstance?.attachments}">
            <li class="fieldcontain">
                <span id="attachments-label" class="property-label"><g:message code="amendment.attachments.label"
                                                                               default="Attachments"/></span>

                <g:each in="${amendmentInstance.attachments}" var="a">
                    <span class="property-value" aria-labelledby="attachments-label"><g:link controller="attachment"
                                                                                             action="show"
                                                                                             id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${amendmentInstance?.phases}">
            <li class="fieldcontain">
                <span id="phases-label" class="property-label"><g:message code="amendment.phases.label"
                                                                          default="Phases"/></span>

                <g:each in="${amendmentInstance.phases}" var="p">
                    <span class="property-value" aria-labelledby="phases-label"><g:link controller="phase" action="show"
                                                                                        id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${amendmentInstance?.contractNo}">
            <li class="fieldcontain">
                <span id="contractNo-label" class="property-label"><g:message code="amendment.contractNo.label"
                                                                              default="Contract No"/></span>

                <span class="property-value" aria-labelledby="contractNo-label"><g:fieldValue
                        bean="${amendmentInstance}" field="contractNo"/></span>

            </li>
        </g:if>

        <g:if test="${amendmentInstance?.contractPartNo}">
            <li class="fieldcontain">
                <span id="contractPartNo-label" class="property-label"><g:message code="amendment.contractPartNo.label"
                                                                                  default="Contract Part No"/></span>

                <span class="property-value" aria-labelledby="contractPartNo-label"><g:fieldValue
                        bean="${amendmentInstance}" field="contractPartNo"/></span>

            </li>
        </g:if>

        <g:if test="${amendmentInstance?.comment}">
            <li class="fieldcontain">
                <span id="comment-label" class="property-label"><g:message code="amendment.comment.label"
                                                                           default="Comment"/></span>

                <span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${amendmentInstance}"
                                                                                           field="comment"/></span>

            </li>
        </g:if>

    </ol>
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
