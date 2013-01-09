<%--
  Created by IntelliJ IDEA.
  User: Mary
  Date: 12/31/12
  Time: 12:08 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="bahman.Attachment" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <r:require modules="bootstrap"/>
    <g:set var="entityName" value="${message(code: 'attachment.label', default: 'attachment')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<div id="list-attachment" ng-controller="attachmentController" class="content scaffold-list" role="main">
    <rg:dialog id="attachment" title="Attachment Form">

        <rg:fields bean="${new bahman.Attachment()}"></rg:fields>
        <rg:saveButton domainClass="${bahman?.Attachment}" conroller="attachment" action="save" params="[type: 'POST']"/>
        <rg:cancelButton/>
    </rg:dialog>
    <g:javascript plugin="rapid-grails" src="jquery.form.js"></g:javascript>
    %{--<input name>contract--}%
    <table>
        <tr>
            <td class="detail-td-attach">
                <div class="detail-property-list">

                    <div class="detailcontain">
                        <span id="contractNo-label" class="property-label-small"><g:message
                                code="contract.contractNo.label" default="Contract No"/></span>

                        <span class="property-value-small" aria-labelledby="contractNo-label"><g:fieldValue
                                bean="${contractInstance}" field="contractNo"/>/<g:fieldValue bean="${contractInstance}"
                                                                                              field="contractPartNo"/></span>
                    </div>
                </div>
            </td>

            <td class="detail-td">
                <div class="detail-property-list">

                    <div class="detailcontain">
                        <span id="customerDesc-label" class="property-label-small"><g:message
                                code="contract.customerDesc.label" default="Customer Desc"/></span>

                        <span class="property-value-small" aria-labelledby="customerDesc-label"><g:fieldValue
                                bean="${contractInstance}" field="customerDesc"/></span>
                    </div>
                </div>
            </td>
        </tr>
    </table>

    <div class="row-fluid">
        <ul class="thumbnails" id="attachment-container">
            <g:each in="${contractInstance?.attachments}" var="attachment">
                %{--<g:if test="${attachment.status!='R'}">--}%
                    <g:render template="showAttachment" model="[attachment:attachment]"/>
                %{--</g:if>--}%
            </g:each>
        </ul>
    </div>
    <div class="row-fluid">
        <ul class="thumbnails" id="draft-container">
            <g:each in="${contractInstance?.drafts}" var="draft">
            %{--<g:if test="${draft.status!='R'}">--}%
                   <g:render template="showAttachment" model="[attachment:draft,type:'Draft']"/>
            %{--</g:if>--}%
            </g:each>
        </ul>
    </div>
</div>
</body>
</html>
