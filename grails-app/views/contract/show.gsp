<%@ page import="bahman.Contract" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-contract" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               %{--default="Skip to content&hellip;"/></a>
<div id="show-contract" class="content scaffold-show" role="main">
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<div class="detail-property-list">
<div class="row">
    <g:set var="counter" value="${0}"></g:set>
    <g:each in="${contractInstance?.properties?.sort()}" var="c">
        <g:if test="${(counter % 3) == 0}">
            </div>
            <div class="row">
        </g:if>
        <span>
            <g:if test="${c.key.toString().equals('contractNo') ||
                    c.key.toString().equals('contractPartNo') ||
                    c.key.toString().equals('settlementType') ||
                    c.key.toString().equals('buyerBrokerDesc') ||
                    c.key.toString().equals('dealerBrokerDesc') ||
                    c.key.toString().equals('customerDesc') ||
                    c.key.toString().equals('productSymbol') ||
                    c.key.toString().equals('productDesc') ||
                    c.key.toString().equals('totalShipments') ||
                    c.key.toString().equals('price') ||
                    c.key.toString().equals('contractType') ||
//                            c.key.toString().equals('deliveryDate') ||
                    c.key.toString().equals('manufacturerDesc') ||
                    c.key.toString().equals('deliveryPlace') ||
                    c.key.toString().equals('productMainGroup') ||
                    c.key.toString().equals('productGroup') ||
                    c.key.toString().equals('productSubGroup') ||
                    c.key.toString().equals('weight') ||
                    c.key.toString().equals('quantity') ||
                    c.key.toString().equals('buyerBrokerCode') ||
                    c.key.toString().equals('dealerBrokerCode') ||
                    c.key.toString().equals('customerCode') ||
                    c.key.toString().equals('supplierCode') ||
                    c.key.toString().equals('boursePrice') ||
                    c.key.toString().equals('contractID')}">
                %{--<div class="field-all">--}%

                <div class="span2"><div class="field-label"><g:message code="contract.${c.key}.label" default=""/></div>
                </div>

                <div class="span2">${c.value}</div>
                %{--</div>--}%
                <g:set var="counter" value="${counter + 1}"></g:set>
            </g:if>
            <g:if test="${c.key.toString().equals('contractDate') ||
                    c.key.toString().equals('allotmentDate') ||
                    c.key.toString().equals('settlementDeadline') ||
                    c.key.toString().equals('deliveryDate') ||
                    c.key.toString().equals('settlementDate') ||
                    c.key.toString().equals('releaseDate') ||
                    c.key.toString().equals('importDate')}">
                <div class="span2"><div class="field-label"><g:message code="contract.${c.key}.label" default=""/></div>
                </div>

                <div class="span2"><rg:formatJalaliDate date="${c.value}"></rg:formatJalaliDate></div>
                <g:set var="counter" value="${counter + 1}"></g:set>
            </g:if>

        </span>
    </g:each>
</div>
</div>
<table>
    <tr>
        <td class="phase-td"></td>
        <td>
            <div class="phasecontain">
                <table class="pashe-table">
                    <tr>
                        <td class="phase-td-head"><g:message code="phase.phase.label" default="Phase"/></td>
                        <td class="phase-td-head"><g:message code="phase.status.label" default="Status"/></td>
                        <td class="phase-td-head"><g:message code="phase.comment.label" default="Comment"/></td>
                        <td class="phase-td-head"><g:message code="phase.startdate.label" default="Start Date"/></td>
                        <td class="phase-td-head"><g:message code="phase.enddate.label" default="End Date"/></td>
                                          </tr>
                    <g:each in="${contractInstance?.phases?.sort { it.id }}" var="p">
                        <tr>

                            <td class="phase-table"><span class="property-value-small">${p.phaseName}</span></td>
                            <td class="phase-table"><span class="property-value-small">${p.statusName}</span></td>
                            <td class="phase-table"><span class="property-value-small">${p.comment}</span></td>
                            <td class="phase-table"><span class="property-value-small"><rg:formatJalaliDate
                                    date="${p.startDate}"/></span></td>
                            <td class="phase-table"><span class="property-value-small"><rg:formatJalaliDate
                                    date="${p.endDate}"/></span></td>

                        </tr>
                    </g:each>
                </table>
            </div>


        </td>
        <td class="phase-td"></td>
    </tr>
</table>


<g:form>
    <fieldset class="buttons">
        <g:hiddenField name="id" value="${contractInstance?.id}"/>
        <g:if test="${limit == "Allowed"}">
            <g:if test="${userType == "Supplier"}">
                <g:link class="edit" action="editAttachmentPhaseDraft" id="${contractInstance?.id}"><g:message
                        code="default.attachment.label" default="Attachments"/></g:link>
            </g:if>
            <g:else>
                <g:link class="edit" action="editAttachmentPhase" id="${contractInstance?.id}"><g:message
                        code="default.attachment.label" default="Attachments"/></g:link>
            </g:else>
        </g:if>
        <g:else>
            <g:if test="${userType == "Supplier"}">
                <g:link class="edit" action="showAttachmentPhaseDraft" id="${contractInstance?.id}"><g:message
                        code="default.attachment.label" default="Attachments"/></g:link>
            </g:if>
            <g:else>
                <g:link class="show" action="showAttachmentPhase" id="${contractInstance?.id}"><g:message
                        code="default.show.label" default="Show"/></g:link>
            </g:else>

        </g:else>
        <g:if test="${showAmendment.equals("True")}">
            <g:link class="list" action="list" controller="Amendment" id="${contractInstance.id}"  ><g:message
                    code="amendment.list.label" default="Amendments"/></g:link>
        </g:if>
        <g:if test="${userType == "DealerBroker"}">
            <g:link class="edit" action="edit" id="${contractInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
            style="margin-top: 0px"/>

        </g:if>

    </fieldset>
</g:form>
</div>
</body>
</html>
