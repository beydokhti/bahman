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
        loadOverlayPrint('<g:createLink action="printImage" controller="amendment" params="[amendmentId:amendment?.id]"/>',
                undefined,
                undefined, undefined, {width: 1000})
    }
</script>
<li class="span4" id="main_${amendment?.id}">
    <g:if test="${type == 'Draft'}">
        <div class="well">
    </g:if>

    <g:message code="amendment.label"  default="Amendment"></g:message>
    <div class="thumbnail">
        <g:if test="${amendment?.contentType}">
            <g:if test="${amendment?.contentType?.substring(0, amendment?.contentType?.indexOf('/'))?.toLowerCase() == 'image'}">
                <img id="img_${amendment?.id}"
                     src="<g:createLink action="getImageAmendment" controller="contract" id="${amendment?.id}"/>" alt=""
                     style="max-width: 150px;max-height: 200px">
            </g:if>
            <g:else>
                <img id="img_${amendment?.id}" src="${resource(dir: 'images', file: 'attachments.png')}" alt=""
                     style="max-width: 150px;max-height: 200px">
            </g:else>
        </g:if>
        <g:else>
            <img id="img_${amendment?.id}" src="${resource(dir: 'images', file: 'attachments.png')}" alt=""
                 style="max-width: 150px;max-height: 200px">
        </g:else>
        <div class="caption">
            <p id="desc_${amendment?.id}">${amendment?.comment}</p>

            <p>
                <a class="btn" href="<g:createLink action="downloadAmendment" controller="amendment"
                                                   params="[id: amendment?.id]"/>"><g:message code="Download"/></a>
                <a class="btn" href="<g:createLink action="showAmendmentDetails" controller="amendment"
                                                   params="[id: amendment?.id]"/>"><g:message code="Details"/></a>
                <g:if test="${amendment?.contentType && amendment?.contentType?.contains("/")}">
                    <g:if test="${amendment?.contentType?.substring(0, amendment?.contentType?.indexOf('/')).toLowerCase() == 'image'}">
                    %{--<a class="btn" href="#" onclick="doPrintImage(${amendment?.id})"><g:message code="Print"/></a>--}%
                        <a class="btn" href="<g:createLink action="printView" controller="amendment" params="[amendmentId: amendment?.id]"/>"><g:message code="print"/></a>
                    </g:if>
                </g:if>
            </p>
        </div>
    </div>
    <g:if test="${type == 'Draft'}">
        </div>
    </g:if>
</li>