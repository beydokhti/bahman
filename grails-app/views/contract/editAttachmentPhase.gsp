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
                                    r.ajaxSubmit({
                                        url:saveAddress,
                                        type:"post",
                                        success:function (resp) {
                                            if (params && params.afterSave)
                                                params.afterSave(resp)
//                                            if (resp == 0 || typeof resp == 'object') {
                                            if (saveCallback) {
                                                saveCallback(resp)
                                            }
//                                                var r = $("#ajax-form" + remoteAddress.hashCode());
//                                                r.dialog("destroy");
//                                                r.remove()
//                                            }
// else {
//                                                var r = $("#ajax-form" + remoteAddress.hashCode());
//                                                r.html(resp);
//                                                r.dialog("open");
//                                            }
                                        }
                                    })
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

        function showDialog(src) {
            if (src == 'SC') {
                loadOverlayAttachmentPhase('<g:createLink action="form" controller="attachment" />',
                        '<g:createLink action="save" controller="attachment" params="[contractId:contractInstance?.id]"/>&attr='+src,
                        function (res) {
                            var url = " <g:createLink action="getImage"/>/" + res
                            $("#attachmentImgSettlement").attr("src", url)
                        }, undefined, {width:400})
            }
            else if (src == 'VA') {
                loadOverlayAttachmentPhase('<g:createLink action="form" controller="attachment" />',
                        '<g:createLink action="save" controller="attachment" params="[contractId:contractInstance?.id]"/>&attr='+src,
                        function (res) {
                            var url = " <g:createLink action="getImage"/>/" + res
                            $("#attachmentImgValue").attr("src", url)
                        }, undefined, {width:400})
            }
            else if (src == 'AF') {
                loadOverlayAttachmentPhase('<g:createLink action="form" controller="attachment" />',
                        '<g:createLink action="save" controller="attachment" params="[contractId:contractInstance?.id]"/>&attr='+src,
                        function (res) {
                            var url = " <g:createLink action="getImage"/>/" + res
                            $("#attachmentImgApplication").attr("src", url)
                        }, undefined, {width:400})
            }

        }
        function doSubmit() {
            loadOverlayAttachmentPhase('<g:createLink action="form" controller="phase" />',
                    '<g:createLink action="save" controller="phase" params="[contractId:contractInstance?.id,phaseId:lastPhase?.id,status:'Pass']"/>',
                    function () {
                        window.location = "<g:createLink controller="contract" action="showPhase"  params="[id: contractInstance.id]"/>"
                    }, undefined, {width:400})
        }
        function doReject() {
            loadOverlayAttachmentPhase('<g:createLink action="form" controller="phase" />',
                    '<g:createLink action="save" controller="phase" params="[contractId:contractInstance?.id,phaseId:lastPhase?.id,status:'Reject']"/>',
                    function () {
                        window.location = "<g:createLink controller="contract" action="showPhase"  params="[id: contractInstance.id]"/>"
                    }, undefined, {width:400})
        }
        function doAddAttachment(){

            loadOverlayAttachmentPhase('<g:createLink action="form" controller="attachment" />',
                    '<g:createLink action="save" controller="attachment" params="[contractId:contractInstance?.id,attr:'Attachment']"/>',
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
            %{--<td class="detail-td">--}%
            %{--<div class="detail-property-list">--}%

            %{--<div class="detailcontain">--}%
            %{--<span id="contractPartNo-label" class="property-label-small"><g:message code="contract.contractPartNo.label" default="Contract Part No" /></span>--}%

            %{--<span class="property-value-small" aria-labelledby="contractPartNo-label"><g:fieldValue bean="${contractInstance}" field="contractPartNo"/></span>--}%
            %{--</div>--}%
            %{--</div>--}%
            %{--</td>--}%
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
    <table>
        <tr>
            <td class="attachment-td"><input type="button" onclick="showDialog('SC')" value="Settlement Certificate">
            </td>
            <td class="attachment-td"><input type="button" onclick="showDialog('VA')" value="value Added Tax"></td>
            <td class="attachment-td"><input type="button" onclick="showDialog('AF')" value="Application Form"></td>
        </tr>
        <tr>
            <td class="attachment-td"><img id="attachmentImgSettlement" src="<g:createLink action="getImage"
                                                                                           params="[id: contractInstance?.settlementCertificate?.id]"/>"
                                           width="300"></td>
            <td class="attachment-td"><img id="attachmentImgValue" src="<g:createLink action="getImage"
                                                                                      params="[id: contractInstance?.valueAddedTax?.id]"/>"
                                           width="300"></td>
            <td class="attachment-td"><img id="attachmentImgApplication" src="<g:createLink action="getImage"
                                                                                            params="[id: contractInstance?.applicationForm?.id]"/>"
                                           width="300"></td>
        </tr>
        <tr>
            <td class="attachment-td"><g:link action="showDetails" controller="attachment"
                                              params="[id: contractInstance.id, att: 'SC']">Show Details</g:link></td>
            <td class="attachment-td"><g:link action="showDetails" controller="attachment"
                                              params="[id: contractInstance.id, att: 'VA']">Show Details</g:link></td>
            <td class="attachment-td"><g:link action="showDetails" controller="attachment"
                                              params="[id: contractInstance.id, att: 'AF']">Show Details</g:link></td>
        </tr>
    </table>
    <div class="row-fluid">
        <ul class="thumbnails" id="attachment-container">
            <g:each in="${contractInstance?.attachments}" var="attachment">
                <g:render template="viewAttachment" model="[attachment:attachment]"/>
            </g:each>
        </ul>
    </div>
    <div style="text-align:center ">
        <input class="btn" type="button" onclick="doAddAttachment()" value="Add Attachment">
        <input class="btn" type="button" onclick="doSubmit()" value="Submit">
        <input class="btn" type="button" onclick="doReject()" value="Reject">
    </div>

</div>
</body>
</html>
