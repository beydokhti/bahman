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
                type:"GET",
                url:remoteAddress
            }).done(function (response) {
                        var r = $("#ajax-form" + remoteAddress.hashCode());
                        if (!r.length)
                            r = $("<form id='ajax-form" + remoteAddress.hashCode() + "' enctype='multipart/form-data' action='" + saveAddress + "'></form>")
                        r.html("")

                        r.dialog({
                            modal:true,
                            width:params.width,
                            resizable:false,
                            buttons:{
                                'ذخیره':function () {
                                    if (params && params.beforeSubmit)
                                        params.beforeSubmit();
                                    if((params.confirm=='Y' && confirm("<g:message code="are-you-sure" />"))||params.confirm=='N' ){
                                    r.ajaxSubmit({
                                        url:saveAddress,
                                        type:"post",
                                        success:function (resp) {
                                            if (params && params.afterSave)
                                                params.afterSave(resp)
                                            if (saveCallback) {
                                                saveCallback(resp)
                                            }
                                        }
                                    })
                                    }
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
                    }, undefined, {width:400,confirm:'N'})
        }

        function doReject() {
            loadOverlayAttachmentPhase('<g:createLink action="form" controller="phase" />',
                    '<g:createLink action="save" controller="phase" params="[contractId:contractInstance?.id,phaseId:lastPhase?.id,status:'Reject']"/>',
                    function () {
                        window.location = "<g:createLink controller="contract" action="showPhase"  params="[id: contractInstance?.id]"/>"
                    }, undefined, {width:400,confirm:'N'})
        }
        function doAddAttachment(){

            loadOverlayAttachmentPhase('<g:createLink action="form" controller="attachment" />',
                    '<g:createLink action="save" controller="attachment" params="[contractId:contractInstance?.id,attr:'Attachment']"/>',
                    function (res) {
                        $("#attachment-container").append($(res))
                    }, undefined, {width:400,confirm:'N'})
        }
        function doAddDraft(){

            loadOverlayAttachmentPhase('<g:createLink action="form" controller="attachment" />',
                    '<g:createLink action="saveDraft" controller="attachment" params="[contractId:contractInstance?.id,attr:'Attachment']"/>',
                    function (res) {
                        $("#attachment-container").append($(res))
                    }, undefined, {width:400,confirm:'Y'})
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
<div class="nav" role="navigation">
    <ul>
        <li><g:link action="show" controller="contract" contractInstance="${contractInstance}"><g:message code="default.show.label"/></g:link></li>
    </ul>
</div>
<div id="list-attachment" ng-controller="attachmentController" class="content scaffold-list" role="main">
    <rg:dialog id="attachment" title="Attachment Form">

        <rg:fields bean="${new bahman.Attachment()}"></rg:fields>
        <rg:saveButton domainClass="${bahman.Attachment}" conroller="attachment" action="save" params="[type: 'POST']"/>
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
    %{--<div class="row">--}%
        %{--<div class="span6">--}%
            <div class="row-fluid">
                <ul class="thumbnails" id="attachment-container">
                    <g:each in="${contractInstance?.attachments}" var="attachment">
                        %{--<g:if test="${draft.status!='R'}">--}%
                            <g:if test="${attachment.responsible.code==user.code}">
                                <g:render template="viewAttachment" model="[attachment:attachment]"/>
                            </g:if>
                            <g:else>
                                <g:render template="showAttachment" model="[attachment:attachment]"/>
                            </g:else>
                            %{--</g:if>--}%
                    </g:each>
                </ul>
            </div>
        %{--</div>--}%

        %{--<div class="span6">--}%
            <div class="row-fluid">
                <ul class="thumbnails" id="draft-container">
                    <g:each in="${contractInstance?.drafts}" var="draft">
                        %{--<g:if test="${draft.status!='R'}">--}%
                            <g:if test="${draft.responsible.code==user.code}">
                                <g:render template="viewAttachment" model="[attachment:draft,type:'Draft']"/>
                            </g:if>
                            <g:else>
                                <g:render template="showAttachment" model="[attachment:draft,type:'Draft']"/>
                            </g:else>
                        %{--</g:if>--}%
                    </g:each>
                </ul>
            </div>
        %{--</div>--}%
    %{--</div>--}%
    <div style="text-align:center ">

        <input class="btn" type="button" onclick="doAddAttachment()" value="Add Attachment">
        <input class="btn" type="button" onclick="doAddDraft()" value="Add Draft">
        <input class="btn" type="button" onclick="doSubmit()" value="Submit">
        <input class="btn" type="button" onclick="doReject()" value="Reject">
    </div>

</div>
</body>
</html>
