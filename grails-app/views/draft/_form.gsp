<%@ page import="bahman.Draft" %>



<div class="fieldcontain ${hasErrors(bean: draftInstance, field: 'description', 'error')} ">
    <g:if test="${draftInstance.description}">
        <label for="description">
            <g:message code="draft.description.label" default="Description"/>

        </label>

        <g:textArea name="description" cols="60" rows="2" maxlength="100" value="${draftInstance?.description}"
                    readonly="TRUE"/>
    </g:if>
    <g:if test="${errorMsg}">
        <label for="description">
            <g:message code="draft.description.label" default="Description"/>

        </label>
        <g:textArea name="description" cols="60" rows="2" maxlength="100" value="${draftInstance?.description}"/>
        <br>${errorMsg}
    </g:if>
</div>

<div class="fieldcontain ${hasErrors(bean: draftInstance, field: 'document', 'error')} ">
    <label for="document">
        <g:message code="draft.document.label" default="Document"/>

    </label>
    <input type="file" id="document" name="document"/>
</div>


%{--<div class="fieldcontain ${hasErrors(bean: draftInstance, field: 'uploadDate', 'error')} required">--}%
%{--<label for="uploadDate">--}%
%{--<g:message code="draft.uploadDate.label" default="Upload Date" />--}%
%{--<span class="required-indicator">*</span>--}%
%{--</label>--}%
%{--<g:datePicker name="uploadDate" precision="day"  value="${draftInstance?.uploadDate}"  />--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: draftInstance, field: 'responsible', 'error')} required">--}%
%{--<label for="responsible">--}%
%{--<g:message code="draft.responsible.label" default="Responsible" />--}%
%{--<span class="required-indicator">*</span>--}%
%{--</label>--}%
%{--<g:select id="responsible" name="responsible.id" from="${bahman.Organization.list()}" optionKey="id" required="" value="${draftInstance?.responsible?.id}" class="many-to-one"/>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: draftInstance, field: 'fileName', 'error')} ">--}%
%{--<label for="fileName">--}%
%{--<g:message code="draft.fileName.label" default="File Name" />--}%
%{----}%
%{--</label>--}%
%{--<g:textArea name="fileName" cols="40" rows="5" maxlength="256" value="${draftInstance?.fileName}"/>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: draftInstance, field: 'contentType', 'error')} ">--}%
%{--<label for="contentType">--}%
%{--<g:message code="draft.contentType.label" default="Content Type" />--}%
%{----}%
%{--</label>--}%
%{--<g:textArea name="contentType" cols="40" rows="5" maxlength="265" value="${draftInstance?.contentType}"/>--}%
%{--</div>--}%

