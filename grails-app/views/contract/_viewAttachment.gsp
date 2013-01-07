<script type="text/javascript">
    var loadOverlayPrint = function (remoteAddress, saveAddress, saveCallback, loadCallback, params) {
        if (!params)
            params = {}
        $.ajaxSettings.traditional = true;
        $.ajax({
            type: "GET",
            url: remoteAddress
        }).done(function (response) {
                    var r = $("#ajax-form" + remoteAddress.hashCode());
                    if (!r.length)
                        r = $("<form id='ajax-form" + remoteAddress.hashCode() + "' enctype='multipart/form-data' action='" + saveAddress + "'></form>")
                    r.html("")

                    r.dialog({
                        modal: true,
                        width: params.width,
                        resizable: false,
                        buttons: {
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

    function doPrintImage(attId) {
        loadOverlayPrint('<g:createLink action="printImage" controller="attachment" params="[attachmentId:attachment?.id]"/>',
                undefined,
                undefined, undefined, {width: 1000})
    }

    %{--$("#deleteBtn").click( function(){--}%
    %{--loadOverlayPrint('<g:createLink action="printImage" controller="attachment" params="[attachmentId:attachment?.id]"/>',--}%
    %{--undefined,--}%
    %{--undefined, undefined, {width:1000}--}%
    %{--})--}%
</script>

<li class="span4" id="main_${attachment?.id}">
    <g:if test="${type == 'Draft'}">
        <div class="well">
    </g:if>

    <div class="thumbnail">
        <g:if test="${attachment?.contentType && attachment?.contentType?.contains("/")}">
            <g:if test="${attachment?.contentType?.substring(0, attachment?.contentType?.indexOf('/'))?.toLowerCase() == 'image'}">
                <img id="img_${attachment?.id}"
                     src="<g:createLink action="getImage" controller="contract" id="${attachment?.id}"/>" alt=""
                     style="max-width: 150px;max-height: 200px">
            </g:if>
            <g:else>
                <img id="img_${attachment?.id}" src="${resource(dir: 'images', file: 'attachments.png')}" alt=""
                     style="max-width: 150px;max-height: 200px">
            </g:else>
        </g:if>
        <g:else>
            <img id="img_${attachment?.id}" src="${resource(dir: 'images', file: 'attachments.png')}" alt=""
                 style="max-width: 150px;max-height: 200px">
        </g:else>
        <div class="caption">
            <p id="desc_${attachment?.id}">${attachment?.description}</p>

            <p>
                <a class="btn btn-primary" href="#" onclick="doDeleteAttachment(${attachment?.id})"><g:message
                        code="Delete"/></a>
                %{--<a class="btn" href="#" onclick="doDownloadAttachment(${attachment?.id})"><g:message code="download" /></a>--}%
                <a class="btn" href="<g:createLink action="downloadAttachment" controller="attachment"
                                                   params="[id: attachment?.id]"/>"><g:message code="Download"/></a>
                <a class="btn" href="<g:createLink action="showAttachmentDetails" controller="attachment"
                                                   params="[id: attachment?.id]"/>"><g:message code="Details"/></a>
                <g:if test="${attachment?.contentType && attachment?.contentType?.contains("/")}">
                    <g:if test="${attachment.contentType.substring(0, attachment.contentType.indexOf('/')).toLowerCase() == 'image'}">
                        <a class="btn" href="#" id="deleteBtn" onclick="doPrintImage(${attachment?.id})"><g:message
                                code="Print"/></a>
                    %{--<a class="btn" href="<g:createLink action="printImage" controller="attachment" params="[id: attachment?.id]"/>"><g:message code="download"/></a>--}%
                    </g:if>
                </g:if>
            </p>
        </div>
    </div>
    <g:if test="${type == 'Draft'}">
        </div>
    </g:if>
</li>