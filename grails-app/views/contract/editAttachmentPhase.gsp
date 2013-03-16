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
    <title><g:message code="default.attachment.label" args="[entityName]"/></title>
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
                    '<g:createLink action="save" controller="phase" params="[contractId:contractInstance?.id,phaseId:lastPhase?.id,status:'Pass']"/>',
                    function () {
                        window.location = "<g:createLink controller="contract" action="showPhase"  params="[id: contractInstance?.id]"/>"
                    }, undefined, {width:400})
        }

        function doReject() {
            loadOverlayAttachmentPhase('<g:createLink action="form" controller="phase" />',
                    '<g:createLink action="save" controller="phase" params="[contractId:contractInstance?.id,phaseId:lastPhase?.id,status:'Reject']"/>',
                    function () {
                        window.location = "<g:createLink controller="contract" action="showPhase"  params="[id: contractInstance?.id]"/>"
                    }, undefined, {width:400})
        }
        function doAddAttachment(){

            loadOverlayAttachmentPhase('<g:createLink action="form" controller="attachment" />',
                    '<g:createLink action="save" controller="attachment" params="[contractId:contractInstance?.id,attr:'Attachment',rcontroller:'contract',raction:'editAttachmentPhase',redirectId:contractInstance?.id]"/>',
                    function (res) {
                        $("#attachment-container").append($(res))
                    }, undefined, {width:400})
        }
        function doDeleteAttachment(id){
            if(confirm("<g:message code="are-you-sure" />")){
                $.ajax({
                    url:'<g:createLink action="deleteAttachment" controller="attachment" />',
                    data:{
                        id:id,
                        contractId:${contractInstance?.id}
                    }
                }).success(function(data){
                    $("#main_"+id).remove()
                })
            }
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
    <div class="row">
        <div class="span4">
            <div class="detail-property-list">

                <div class="detailcontain">
                    <span id="contractNo-label" class="property-label-small"><g:message
                            code="contract.contractNo.label" default="Contract No"/></span>

                    <span class="property-value-small" aria-labelledby="contractNo-label"><g:fieldValue
                            bean="${contractInstance}" field="contractNo"/>/<g:fieldValue bean="${contractInstance}"
                                                                                          field="contractPartNo"/></span>
                </div>
            </div>

        </div>

        <div class="span4">
            <div class="detail-property-list">

                <div class="detailcontain">
                    <span id="customerDesc-label" class="property-label-small"><g:message
                            code="contract.customerDesc.label" default="Customer Desc"/></span>

                    <span class="property-value-small" aria-labelledby="customerDesc-label"><g:fieldValue
                            bean="${contractInstance}" field="customerDesc"/></span>
                </div>
            </div>

        </div>

        <div class="span4">
            <div class="detail-property-list">

                <div class="detailcontain">
                    <span id="draft-label" class="property-label-small"><g:message
                            code="contract.draft.label" default="Draft"/></span>

                    <g:each in="${contractInstance?.drafts}" var="drafts">
                        <g:if test="${drafts?.status != 'R'}">
                            <span class="property-value-small"
                                  aria-labelledby="customerDesc-label">${drafts?.description}</span>
                        </g:if>
                    </g:each>
                </div>
            </div>

        </div>
    </div>
    <div class="row-fluid">
        <ul class="thumbnails" id="attachment-container">
            <g:each in="${contractInstance?.attachments}" var="attachment">
                <g:if test="${attachment?.status!='R'}">
                    <g:if test="${attachment.responsible.code==user.code}">
                        <g:render template="viewAttachment" model="[attachment:attachment]"/>
                    </g:if>
                    <g:else>
                        <g:render template="showAttachment" model="[attachment:attachment]"/>
                    </g:else>
                </g:if>
            </g:each>
        </ul>
    </div>
    <div class="row-fluid">
        <ul class="thumbnails" id="amendment-container">
            <g:each in="${contractInstance?.amendments}" var="amendment">
                <g:if test="${amendment?.status=='Visible'}">
                        <g:render template="showAmendment" model="[amendment:amendment]"/>
                </g:if>
            </g:each>
        </ul>
    </div>

    <div class="row-fluid">
        <ul class="thumbnails" id="draft-container">
            <g:each in="${contractInstance?.drafts}" var="draft">
            <g:if test="${draft?.status!='R'}">
                <g:render template="showAttachment" model="[attachment:draft,type:'Draft']"/>
            </g:if>
            </g:each>
        </ul>
    </div>
    <div style="text-align:center ">
        <input class="btn" type="button" onclick="doAddAttachment()" value="${message(code:'button.add.Attachment', default:'Add Attachment' )}">
        <input class="btn" type="button" onclick="doSubmit()" value="${message(code:'button.submit', default:'Submit')}">
        <g:if test="${lastPhase.phase!='BuyerBroker'}">
            <input class="btn" type="button" onclick="doReject()" value="${message(code:'button.reject', default:'Reject')}">
        </g:if>
    </div>

</div>
</body>
</html>
