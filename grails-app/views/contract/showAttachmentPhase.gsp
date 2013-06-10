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
        <rg:saveButton domainClass="${bahman.Attachment}" conroller="attachment" action="save" params="[type: 'POST']"/>
        <rg:cancelButton/>
    </rg:dialog>
    <g:javascript plugin="rapid-grails" src="jquery.form.js"></g:javascript>

    <div class="row">
        <div id="contractNo-label" class="span2 field-label"><g:message
                code="contract.contractNo.label" default="Contract No"/></div>

        <div class="property-value-small-inline span3" aria-labelledby="contractNo-label"><g:fieldValue
                bean="${contractInstance}" field="contractNo"/>/<g:fieldValue bean="${contractInstance}"
                                                                              field="contractPartNo"/></div>


        <div id="customerDesc-label" class="span2 field-label"><g:message
                code="contract.customerDesc.label" default="Customer Desc"/></div>

        <div class="property-value-small-inline span3" aria-labelledby="customerDesc-label"><g:fieldValue
                bean="${contractInstance}" field="customerDesc"/></div>

    </div>

    <div class="row">
        <div id="productDesc-label" class="span2 field-label"><g:message
                code="contract.productDesc.label" default="product Desc"/></div>

        <div class="property-value-small-inline span3" aria-labelledby="productDesc-label"><g:fieldValue
                bean="${contractInstance}" field="productDesc"/></div>


        <div id="freight-label" class="span2 field-label"><g:message
                code="contract.freight.label" default="Freight"/></div>

        <div class="property-value-small-inline span3" aria-labelledby="contractFreight-label"><g:fieldValue
                bean="${contractInstance}" field="freight"/></div>

    </div>

    <div class="row">
        <div id="placeOfUnloading-label" class="span2 field-label"><g:message
                code="contract.placeOfUnloading.label" default="placeOfUnloading"/></div>

        <div class="property-value-small-inline span3" aria-labelledby="placeOfUnloading-label"><g:fieldValue
                bean="${contractInstance}" field="placeOfUnloading"/></div>

        <div id="draft-label" class="span2 field-label"><g:message
                code="contract.draft.label" default="Draft"/></div>

        <g:each in="${contractInstance?.drafts}" var="drafts">
            <g:if test="${drafts?.status != 'R'}">
                <div class="property-value-small-inline span3"
                     aria-labelledby="customerDesc-label">${drafts?.description}</div>
            </g:if>
        </g:each>
    </div>
    <div class="row">

        <div id="addedTaxReceipt-label" class="span3 field-label"><g:message
                code="contract.addedTaxReceipt.label" default="added Tax Receipt"/></div>

        <div class="property-value-small-inline span2" aria-labelledby="addedTaxReceipt-label"><g:fieldValue
                bean="${contractInstance}" field="addedTaxReceipt"/></div>

        <div id="addedTaxReceiptDate-label" class="span3 field-label"><g:message
                code="contract.addedTaxReceiptDate.label" default="added Tax Receipt Date"/></div>

        <div class="property-value-small-inline span2" aria-labelledby="contractFreight-label"><rg:formatJalaliDate
                date="${contractInstance.addedTaxReceiptDate}"></rg:formatJalaliDate></div>
    </div>

%{--------------------------------------------------------------------------------------------------------------------------------}%

    <div class="row-fluid">
        <ul class="thumbnails" id="attachment-container">
            <g:each in="${contractInstance?.attachments}" var="attachment">
                <g:if test="${attachment.status != 'R'}">
                    <g:render template="showAttachment" model="[attachment: attachment]"/>
                </g:if>
            </g:each>
        </ul>
    </div>

    <div class="row-fluid">
        <ul class="thumbnails" id="amendment-container">
            <g:each in="${contractInstance?.amendments}" var="amendment">
                <g:if test="${amendment.status == 'Visible'}">
                    <g:render template="showAmendment" model="[amendment: amendment]"/>
                </g:if>
            </g:each>
        </ul>
    </div>

    <div class="row-fluid">
        <ul class="thumbnails" id="draft-container">
            <g:each in="${contractInstance?.drafts}" var="draft">
                <g:if test="${draft.status != 'R'}">
                    <g:render template="showAttachment" model="[attachment: draft, type: 'Draft']"/>
                </g:if>
            </g:each>
        </ul>
    </div>
</div>
</body>
</html>
