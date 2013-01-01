<li class="span4" id="main_${attachment?.id}">
    <div class="thumbnail">
        <img id="img_${attachment?.id}" src="<g:createLink action="getImage" controller="contract" id="${attachment?.id}"/>" alt="" style="max-width: 300px;max-height: 400px">
        <div class="caption">
            <p id="desc_${attachment?.id}">${attachment?.description}</p>
            <p>
                <a class="btn btn-primary" href="#" onclick="doDeleteAttachment(${attachment?.id})"><g:message code="delete" /></a>
                <a class="btn" href="<g:createLink action="showAttachmentDetails" controller="attachment" params="[id: attachment?.id]"/>"><g:message code="show-details"/></a>
            </p>
        </div>
    </div>
</li>