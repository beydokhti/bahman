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

        function doAddDraft() {

            loadOverlayAttachmentPhase('<g:createLink action="form" controller="draft" />',
                    '<g:createLink action="saveDraft" controller="draft" params="[contractId:contractInstance?.id,attr:'Attachment',rcontroller:'contract',raction:'showAttachmentPhaseDraft',redirectId:contractInstance?.id]"/>',
                    function (res) {
                        $("#attachment-container").append($(res))
                    }, undefined, {width: 400, confirm: 'Y'})
        }

    </script>
</head>

<body>

<div id="list-attachment" ng-controller="attachmentController" class="content scaffold-list" role="main">
    <rg:dialog id="attachment" title="Attachment Form">

        <rg:fields bean="${new bahman.Attachment()}"></rg:fields>
        <rg:saveButton domainClass="${bahman.Attachment}" conroller="attachment" action="save" params="[type: 'POST']"/>
        <rg:cancelButton/>
    </rg:dialog>
    <g:javascript plugin="rapid-grails" src="jquery.form.js"></g:javascript>
    %{--<input name>contract--}%
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

        %{--<g:each in="${contractInstance?.drafts}" var="drafts">--}%
        %{--<g:if test="${drafts?.status != 'R'}">--}%
        <div class="property-value-small-inline span3"
             aria-labelledby="customerDesc-label">${contractInstance?.drafts?.description}</div>
        %{--</g:if>--}%
        %{--</g:each>--}%
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

    %{--------------------------------------------------------------------------------------------------------------------------------}%    <div
        class="row-fluid">
    <ul class="thumbnails" id="amendment-container">
        <g:each in="${contractInstance?.amendments}" var="amendment">
            <g:if test="${amendment?.status == 'Visible'}">
                <g:render template="showAmendment" model="[amendment: amendment]"/>
            </g:if>
        </g:each>
    </ul>
</div>

    <div class="row-fluid">
        <ul class="thumbnails" id="draft-container">
            %{--<g:each in="${contractInstance?.drafts}" var="draft">--}%
            %{--<g:if test="${draft?.status!='R'}">--}%
            <g:if test="${contractInstance?.drafts}">
                <g:render template="showDraft" model="[draft: contractInstance?.drafts, type: 'Draft']"/>
            </g:if>
            %{--</g:if>--}%
            %{--</g:each>--}%
        </ul>
    </div>

    <div style="text-align:center ">
        <g:if test="${flash.message}">
            <div class="errors">
                <g:message code="${flash.message}" args="${flash.args}" default="${flash.default}"/>
            </div>
        </g:if>
        <input class="btn" type="button" onclick="doAddDraft()" value="Add Draft">
    </div>

</div>
</body>
</html>
