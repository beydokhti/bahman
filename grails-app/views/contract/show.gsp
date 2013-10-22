<%@ page import="bahman.Contract" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <script type="text/javascript">
        var loadOverlayAttachmentPhase = function (remoteAddress, saveAddress, saveCallback, loadCallback, params) {
            if (!params)
                params = {}
            $.ajaxSettings.traditional = true;
            $.ajax({
                type: "GET",
                url: remoteAddress
            }).done(function (response) {
                        var r = $("#ajax-form" + remoteAddress.hashCode());
                        if (!r.length)
                            r = $("<form id='ajax-form" + remoteAddress.hashCode() + "' enctype='multipart/form-data' method='post' action='" + saveAddress + "'></form>")
                        r.html("")

                        r.dialog({
                            modal: true,
                            width: params.width,
                            resizable: false,
                            buttons: {
                                'ذخیره': function () {
                                    if (params && params.beforeSubmit)
                                        params.beforeSubmit();
                                    if (params.switch == 'ajaxSubmit') {
                                        r.ajaxSubmit({
                                            url: saveAddress,
                                            type: "post",
                                            success: function (resp) {
                                                if (params && params.afterSave)
                                                    params.afterSave(resp)
                                                if (saveCallback) {
                                                    saveCallback(resp)
                                                }
                                            }
                                        })
                                    } else {
                                        r.submit()
                                    }
                                    $(this).dialog("close");
                                },
                                "انصراف": function () {
                                    $(this).dialog("close");
                                }
                            },
                            close: function () {
                                r.html("")
                            }
                        })
                        if (params && params.width) {
                            r.dialog("option", "width", params.width)
                            r.dialog("option", "position", "top")
                        }

                        r.append(response);
                        if (loadCallback)
                            loadCallback(response);
                    });
        }

        function doSubmit() {
            loadOverlayAttachmentPhase('<g:createLink action="form" controller="phase" />',
                    '<g:createLink action="cancel" controller="phase" params="[contractId:contractInstance?.id]"/>',
                    function () {
                        window.location = "<g:createLink controller="contract" action="showPhase"  params="[id: contractInstance?.id]"/>"
                    }, undefined, {width: 400})
        }

    </script>
</head>

<body>
<a href="#show-contract" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               %{--default="Skip to content&hellip;"/></a>

<div id="show-contract" class="content scaffold-show" role="main">
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<div class="detail-property-list">

<div class="row" style="font-weight: bold"><g:message code="contract.details.label"/></div>
<br>
%{--<div class="field-con" id="12">--}%
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
                c.key.toString().equals('customerDesc') ||
                c.key.toString().equals('productSymbol') ||
                c.key.toString().equals('productDesc') ||
                c.key.toString().equals('price') ||
//                        c.key.toString().equals('freight') ||
                c.key.toString().equals('contractType') ||
                c.key.toString().equals('deliveryPlace') ||
                c.key.toString().equals('quantity')}">
        %{--<div class="field-background">--}%
            <g:if test="${c.value}">
                <div class="span2"><div class="field-label"><g:message code="contract.${c.key}.label"
                                                                       default=""/></div>
                </div>

                <div class="span2">${c.value}</div>
            %{--</div>--}%

                <g:set var="counter" value="${counter + 1}"></g:set>
            </g:if>
        </g:if>
        <g:if test="${c.key.toString().equals('contractDate') ||
                c.key.toString().equals('settlementDeadline') ||
                c.key.toString().equals('deliveryDate') ||
                c.key.toString().equals('settlementDate') ||
                c.key.toString().equals('releaseDate')}">

            <div class="span2"><div class="field-label"><g:message code="contract.${c.key}.label"
                                                                   default=""/></div>
            </div>

            <div class="span2"><rg:formatJalaliDate date="${c.value}"></rg:formatJalaliDate></div>
            <g:set var="counter" value="${counter + 1}"></g:set>

        </g:if>

    </span>
</g:each>
</div>
%{--</div>--}%
<br>

<div class="row" style="font-weight: bold"><g:message code="customer.details.label"/></div>
<br>


<g:if test="${contractInstance.customer}">
    <div class="row" >

    <g:set var="iterate" value="${0}"></g:set>
    <g:each in="${contractInstance.customer?.properties?.sort()}" var="cu">
        <g:if test="${(iterate % 3) == 0}">
            </div>
            <div class="row">
        </g:if>
        <span>
            <g:if test="${cu.key.toString().equals('code') ||
                    cu.key.toString().equals('description') ||
                    cu.key.toString().equals('nId') ||
                    cu.key.toString().equals('businessId') ||
                    cu.key.toString().equals('address') ||
                    cu.key.toString().equals('postalCode') ||
                    cu.key.toString().equals('phoneNo') ||
                    cu.key.toString().equals('mobileNo')}">

                <g:if test="${cu.value}">
                    <div class="span2"><div class="field-label"><g:message code="customer.${cu.key}.label"
                                                                           default=""/></div>
                    </div>

                    <div class="span2">${cu.value}</div>
                    <g:set var="iterate" value="${iterate + 1}"></g:set>
                </g:if>
            </g:if>

        </span>
    </g:each>

    </div>
    </div>
</g:if>
<br>

<div class="row" style="font-weight: bold"><g:message code="accounting.details.label"/></div>
<br>

<div class="row">
    <div class="span2"><div class="field-label"><g:message code="contract.value.label"
                                                           default=""/></div>
    </div>

    <div class="span2"><g:formatNumber number="${contractValue}" format="###,###"></g:formatNumber></div>


    <div class="span2"><div class="field-label"><g:message code="accounting.addedTax.label"
                                                           default=""/></div>
    </div>

    <div class="span2"><g:formatNumber number="${addedTax}" format="###,###"></g:formatNumber></div>

    <div class="span2"><div class="field-label"><g:message code="accounting.fees.label"
                                                           default=""/></div>
    </div>

    <div class="span2"><g:formatNumber number="${fees}" format="###,###"></g:formatNumber></div>

</div>


<div class="row">
    <div class="span2"><div class="field-label"><g:message code="contract.shareSeller.label"
                                                           default=""/></div>
    </div>

    <div class="span2"><g:formatNumber number="${shareSeller}" format="###,###"></g:formatNumber></div>
</div>
<br>

<div class="row" style="font-weight: bold"><g:message code="transfer.details.label"/></div>
<br>

<div class="row">
    <g:if test="${contractInstance?.drafts}">
        <div class="span2"><div class="field-label"><g:message code="contract.draft.label"
                                                               default=""/></div>
        </div>

        <div class="span2">${contractInstance?.drafts?.description}</div>
    </g:if>

    <g:if test="${contractInstance?.freight}">
        <div class="span2"><div class="field-label"><g:message code="contract.freight.label"
                                                               default=""/></div>
        </div>

        <div class="span2">${contractInstance?.freight}</div>
    </g:if>

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
                        <td class="phase-td-head"><g:message code="phase.startdate.label"
                                                             default="Start Date"/></td>
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
            <g:if test="${userType == "Supplier" &&  !cancel}">
                <g:link class="edit" action="showAttachmentPhaseDraft" id="${contractInstance?.id}"><g:message
                        code="default.attachment.label" default="Attachments"/></g:link>
            </g:if>
            <g:else>
                <g:link class="show" action="showAttachmentPhase" id="${contractInstance?.id}"><g:message
                        code="default.show.label" default="Show"/></g:link>
            </g:else>

        </g:else>
        <g:if test="${showAmendment.equals("True")}">
            <g:link class="list" action="list" controller="Amendment" id="${contractInstance.id}"><g:message
                    code="amendment.list.label" default="Amendments"/></g:link>
        </g:if>
        <g:link class="print" action="printContract" controller="contract" id="${contractInstance.id}"><g:message
                code="default.print.label" default="Print"/></g:link>
        <g:if test="${userType == "DealerBroker"}">
            <g:link class="print" action="printIrancoPre" controller="contract" id="${contractInstance.id}"><g:message
                    code="default.printIranco.label" default="Print Iranco"/></g:link>
            <g:link class="edit" action="edit" id="${contractInstance?.id}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
                            style="margin-top: 0px"/>

        </g:if>
        <g:if test="${userType == "BuyerBroker"}">
            <a onclick="doSubmit()" cursor=point><g:message
                    code="default.button.cancel.label" default="Cancel"/></a>
            <g:link class="edit" controller="customer" action="editCustomer" params="[id:contractInstance?.customer.id,contractId:contractInstance.id]">
                <g:message
                    code="default.button.edit.customer.label" default="Cancel"/></g:link>
        </g:if>
        <g:if test="${userType == "Manufacturer" || userType == "Supplier"}">
            <g:link class="print" action="printRemitSales" id="${contractInstance?.id}"><g:message
                    code="default.printRemitSales.label" default="Print Remit Sales"/></g:link>
        </g:if>
    </fieldset>
%{--<a class="btn" href="<g:createLink action="printContract" controller="contract" params="[contractId:contractInstance?.id]"/>"><g:message code="print"/></a>--}%

</g:form>
</div>
</body>
</html>
