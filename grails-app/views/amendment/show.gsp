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
                type:"GET",
                url:remoteAddress
            }).done(function (response) {
                        var r = $("#ajax-form" + remoteAddress.hashCode());
                        if (!r.length)
                            r = $("<form id='ajax-form" + remoteAddress.hashCode() + "' enctype='multipart/form-data' method='post' action='" + saveAddress + "'></form>")
                        r.html("")

                        r.dialog({
                            modal:true,
                            width:params.width,
                            resizable:false,
                            buttons:{
                                'ذخیره':function () {
                                    if (params && params.beforeSubmit)
                                        params.beforeSubmit();
//                                    r.ajaxSubmit({
//                                        url:saveAddress,
//                                        type:"post",
//                                        success:function (resp) {
//                                            if (params && params.afterSave)
//                                                params.afterSave(resp)
//                                            if (saveCallback) {
//                                                saveCallback(resp)
//                                            }
//                                        }
//                                    })
                                    r.submit()
                                    $(this).dialog("close");
                                },
                                "انصراف":function () {
                                    $(this).dialog("close");
                                }
                            },
                            close:function () {
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
                    '<g:createLink action="saveAmendmentPhase" controller="phase" params="[amendmentId:amendmentInstance?.id,phaseId:phaseId,status:'Pass']"/>',
                    function () {
                        window.location = "<g:createLink controller="contract" action="showPhase"  params="[id: amendmentInstance?.id]"/>"
                    }, undefined, {width:400})
        }

        function doReject() {
            loadOverlayAttachmentPhase('<g:createLink action="form" controller="phase" />',
                    '<g:createLink action="saveAmendmentPhase" controller="phase" params="[amendmentId:amendmentInstance?.id,phaseId:phaseId,status:'Reject']"/>',
                    function () {
                        window.location = "<g:createLink controller="contract" action="showPhase"  params="[id: amendmentInstance?.id]"/>"
                    }, undefined, {width:400})
        }
    </script>
</head>

<body>
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
            <div class="span2"><div id="amendmentFreight-label" class="field-label"><g:message
                    code="amendment.amendmentFreight.label" default="Amendment freight"/></div></div>

            <div class="span2"><div class="property-value" aria-labelledby="amendmentFreight-label"><g:fieldValue
                    bean="${amendmentInstance}" field="freight"/></div></div>

            <div class="span2"><div id="placeOfUnloading-label" class="field-label"><g:message code="amendment.placeOfUnloading.label"
                                                                                      default="Comment"/></div></div>

            <div class="span2"><div class="property-value" aria-labelledby="placeOfUnloading-label"><g:fieldValue
                    bean="${amendmentInstance}" field="placeOfUnloading"/></div></div>
        </div>

        <div class="row">
            <div class="span2"><div id="addedTaxReceipt-label" class="field-label"><g:message
                    code="amendment.addedTaxReceipt.label" default="Amendment addedTaxReceipt"/></div></div>

            <div class="span2"><div class="property-value" aria-labelledby="addedTaxReceipt-label"><g:fieldValue
                    bean="${amendmentInstance}" field="addedTaxReceipt"/></div></div>

            <div class="span2"><div id="addedTaxReceiptDate-label" class="field-label"><g:message code="amendment.addedTaxReceiptDate.label"
                                                                                               default="Comment"/></div></div>

            <div class="span2"><div class="property-value" aria-labelledby="addedTaxReceiptDate-label"><rg:formatJalaliDate
                    date="${amendmentInstance?.addedTaxReceiptDate}"/></div></div>
        </div>

        <div class="row">
            <div class="span2"><div id="amendmentDocument-label" class="field-label"><g:message
                    code="amendment.amendmentDocument.label" default="Amendment Document"/></div></div>
            <a href="<g:createLink action="getDocument" params="[id: amendmentInstance?.id]"/>" target="_blank">
                <g:if test="${amendmentInstance?.contentType?.contains("/") && amendmentInstance?.contentType[0..amendmentInstance?.contentType?.indexOf("/") - 1] == 'image'}">
                    <img src="<g:createLink action="getDocument" params="[id: amendmentInstance?.id]"/>"
                         style="max-width: 100px;">
                </g:if>
                <g:else>
                    ${amendmentInstance?.fileName}
                </g:else>
            </a>
        </div>
    </div>

    <div style="height: 100px"></div>

    <div class="row">
        <div class="row">

            <div class="span2"><div class="phase-td-head"><g:message code="phase.phase.label" default="Phase"/></div>
            </div>

            <div class="span2"><div class="phase-td-head"><g:message code="phase.status.label" default="Status"/></div>
            </div>

            <div class="span2"><div class="phase-td-head"><g:message code="phase.comment.label"
                                                                     default="Comment"/></div></div>

            <div class="span2"><div class="phase-td-head"><g:message code="phase.startdate.label"
                                                                     default="Start Date"/></div></div>

            <div class="span2"><div class="phase-td-head"><g:message code="phase.enddate.label"
                                                                     default="End Date"/></div></div>

            <div class="span1"></div>
        </div>
        <g:each in="${amendmentInstance?.phases?.sort { it.id }}" var="p">
            <div class="row">
                <div class="span1"></div>

                <div class="span2"><span class="property-value-small">${p.phaseName}</span></div>

                <div class="span2"><span class="property-value-small">${p.statusName}</span></div>

                <div class="span2"><span class="property-value-small">${p.comment}&nbsp</span></div>

                <div class="span2"><span class="property-value-small"><rg:formatJalaliDate
                        date="${p.startDate}"/></span>
                </div>

                <div class="span2"><span class="property-value-small"><rg:formatJalaliDate date="${p.endDate}"/></span>
                </div>

                <div class="span1"></div>
            </div>
        </g:each>
    </div>

    <g:form>

        <fieldset class="buttons">
            <g:hiddenField name="id" value="${amendmentInstance?.id}"/>

            <g:if test="${showDelete == 'True'}">
                <g:actionSubmit class="delete" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </g:if>
            <g:if test="${phaseId!='-1'}">
                <input class="btn" type="button" onclick="doSubmit()" value="Submit">
                <input class="btn" type="button" onclick="doReject()" value="Reject">
             </g:if>
        </fieldset>
    </g:form>
</div>
</body>
</html>
