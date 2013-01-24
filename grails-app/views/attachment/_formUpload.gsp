<%@ page import="bahman.Attachment" %>


<g:form enctype="multipart/form-data">
    <div class="fieldcontain ${hasErrors(bean: attachmentInstance, field: 'description', 'error')} ">
        <label for="description">
            <g:message code="attachment.description.label" default="Description"/>

        </label>
        <g:textArea name="description" cols="40" rows="5" maxlength="1024" value="${attachmentInstance?.description}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: attachmentInstance, field: 'document', 'error')} required">
        <label for="document">
            <g:message code="attachment.document.label" default="Document"/>
            <span class="required-indicator">*</span>
        </label>
        <input type="file" id="document" name="document"/>
    </div>
</g:form>

%{--<div class="fieldcontain ${hasErrors(bean: attachmentInstance, field: 'status', 'error')} ">--}%
%{--<label for="status">--}%
%{--<g:message code="attachment.status.label" default="Status" />--}%
%{----}%
%{--</label>--}%
%{--<g:select name="status" from="${attachmentInstance.constraints.status.inList}" value="${attachmentInstance?.status}" valueMessagePrefix="attachment.status" noSelection="['': '']"/>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: attachmentInstance, field: 'uploadDate', 'error')} required">--}%
%{--<label for="uploadDate">--}%
%{--<g:message code="attachment.uploadDate.label" default="Upload Date" />--}%
%{--<span class="required-indicator">*</span>--}%
%{--</label>--}%
%{--<g:datePicker name="uploadDate" precision="day"  value="${attachmentInstance?.uploadDate}"  />--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: attachmentInstance, field: 'responsible', 'error')} required">--}%
%{--<label for="responsible">--}%
%{--<g:message code="attachment.responsible.label" default="Responsible" />--}%
%{--<span class="required-indicator">*</span>--}%
%{--</label>--}%
%{--<g:select id="responsible" name="responsible.id" from="${bahman.Organization.list()}" optionKey="id" required="" value="${attachmentInstance?.responsible?.id}" class="many-to-one"/>--}%
%{--</div>--}%

