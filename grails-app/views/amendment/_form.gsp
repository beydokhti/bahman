<%@ page import="bahman.Amendment" %>



%{--<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'amendmentDate', 'error')} required">--}%
    %{--<label for="amendmentDate">--}%
        %{--<g:message code="amendment.amendmentDate.label" default="Amendment Date"/>--}%
        %{--<span class="required-indicator">*</span>--}%
    %{--</label>--}%
    %{--<g:datePicker name="amendmentDate" precision="day" value="${amendmentInstance?.amendmentDate}"/>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'attachments', 'error')} ">--}%
    %{--<label for="attachments">--}%
        %{--<g:message code="amendment.attachments.label" default="Attachments"/>--}%

    %{--</label>--}%
    %{--<g:select name="attachments" from="${bahman.Attachment.list()}" multiple="multiple" optionKey="id" size="5"--}%
              %{--value="${amendmentInstance?.attachments*.id}" class="many-to-many"/>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'phases', 'error')} ">--}%
    %{--<label for="phases">--}%
        %{--<g:message code="amendment.phases.label" default="Phases"/>--}%

    %{--</label>--}%
    %{--<g:select name="phases" from="${bahman.Phase.list()}" multiple="multiple" optionKey="id" size="5"--}%
              %{--value="${amendmentInstance?.phases*.id}" class="many-to-many"/>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'contractNo', 'error')} ">--}%
    %{--<label for="contractNo">--}%
        %{--<g:message code="amendment.contractNo.label" default="Contract No"/>--}%

    %{--</label>--}%
    %{--<g:textField name="contractNo" value="${amendmentInstance?.contractNo}"/>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'contractPartNo', 'error')} ">--}%
    %{--<label for="contractPartNo">--}%
        %{--<g:message code="amendment.contractPartNo.label" default="Contract Part No"/>--}%

    %{--</label>--}%
    %{--<g:textField name="contractPartNo" value="${amendmentInstance?.contractPartNo}"/>--}%
%{--</div>--}%

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'comment', 'error')} ">
    <label for="comment">
        <g:message code="amendment.comment.label" default="Comment"/>

    </label>
    <g:textField name="comment" value="${amendmentInstance?.comment}"/>
</div>

