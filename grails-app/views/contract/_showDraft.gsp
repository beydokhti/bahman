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
        loadOverlayPrint('<g:createLink action="printImage" controller="draft" params="[draftId:draft?.id]"/>',
                undefined,
                undefined, undefined, {width: 1000})
    }
</script>
<li class="span4" id="main_${draft?.id}">
    %{--<g:if test="${type == 'Draft'}">--}%
        <div class="well">
    %{--</g:if>--}%

    <div class="thumbnail">
        <g:if test="${draft?.contentType}">
            <g:if test="${draft?.contentType?.substring(0, draft?.contentType?.indexOf('/'))?.toLowerCase() == 'image'}">
                <img id="img_${draft?.id}"
                     src="<g:createLink action="getImage" controller="draft" id="${draft?.id}"/>" alt=""
                     style="max-width: 150px;max-height: 200px">
            </g:if>
        %{--<g:if test="${draft.contentType=='application/pdf'}">--}%
        %{--<img id="img_${draft?.id}" src="${resource(dir:'images',file:'pdf.png')}"alt="" style="max-width: 150px;max-height: 200px">--}%
        %{--</g:if>--}%
        %{--<g:if test="${draft.contentType=='application/x-zip-compressed'}">--}%
        %{--<img id="img_${draft?.id}" src="${resource(dir:'images',file:'zip.png')}"alt="" style="max-width: 150px;max-height: 200px">--}%
        %{--</g:if>--}%
        %{--<g:if test="${draft.contentType=='application/octet-stream'}">--}%
        %{--<img id="img_${draft?.id}" src="${resource(dir:'images',file:'rar.png')}"alt="" style="max-width: 150px;max-height: 200px">--}%
        %{--</g:if>--}%
        %{--<g:if test="${draft.contentType=='text/plain'} || ${draft.contentType=='application/msword'} ||${draft.contentType=='application/vnd.openxmlformats-officedocument.wordprocessingml.document'}">--}%
        %{--<g:if test="${draft.contentType=='application/vnd.openxmlformats-officedocument.wordprocessingml.document'}">--}%
        %{--<img id="img_${draft?.id}" src="${resource(dir:'images',file:'word.png')}"alt="" style="max-width: 150px;max-height: 200px">--}%
        %{--</g:if>--}%
        %{--<g:if test="${draft.contentType=='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'}">--}%
        %{--<img id="img_${draft?.id}" src="${resource(dir:'images',file:'excel.png')}"alt="" style="max-width: 150px;max-height: 200px">--}%
        %{--</g:if>--}%
            <g:else>
                <img id="img_${draft?.id}" src="${resource(dir: 'images', file: 'attachments.png')}" alt=""
                     style="max-width: 150px;max-height: 200px">
            </g:else>
        </g:if>
        <g:else>
            <img id="img_${draft?.id}" src="${resource(dir: 'images', file: 'attachments.png')}" alt=""
                 style="max-width: 150px;max-height: 200px">
        </g:else>
        <div class="caption">
            <p id="desc_${draft?.id}">${draft?.description}</p>
            <p id="date_${draft?.id}"><rg:formatJalaliDate date="${draft?.uploadDate}"/></p>

            <p>
                <a class="btn" href="<g:createLink action="downloadDraft" controller="draft"
                                                   params="[id: draft?.id]"/>"><g:message code="Download"/></a>
                <a class="btn" href="<g:createLink action="showDraftDetails" controller="draft"
                                                   params="[id: draft?.id]"/>"><g:message code="Details"/></a>
                <g:if test="${draft?.contentType && draft?.contentType?.contains("/")}">
                    <g:if test="${draft?.contentType?.substring(0, draft?.contentType?.indexOf('/')).toLowerCase() == 'image'}">
                    %{--<a class="btn" href="#" onclick="doPrintImage(${draft?.id})"><g:message code="Print"/></a>--}%
                        <a class="btn" href="<g:createLink action="printView" controller="draft" params="[draftId: draft?.id]"/>"><g:message code="print"/></a>
                    </g:if>
                </g:if>
            </p>
        </div>
    </div>
    %{--<g:if test="${type == 'Draft'}">--}%
        </div>
    %{--</g:if>--}%
</li>