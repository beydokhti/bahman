<%@ page import="bahman.Phase" %>



%{--<div class="fieldcontain ${hasErrors(bean: phaseInstance, field: 'status', 'error')} ">--}%
	%{--<label for="status">--}%
		%{--<g:message code="phase.status.label" default="Status" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:select name="status" from="${phaseInstance.constraints.status.inList}" value="${phaseInstance?.status}" valueMessagePrefix="phase.status" noSelection="['': '']"/>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: phaseInstance, field: 'phase', 'error')} required">--}%
	%{--<label for="phase">--}%
		%{--<g:message code="phase.phase.label" default="Phase" />--}%
		%{--<span class="required-indicator">*</span>--}%
	%{--</label>--}%
	%{--<g:select name="phase" from="${phaseInstance.constraints.phase.inList}" required="" value="${phaseInstance?.phase}" valueMessagePrefix="phase.phase"/>--}%
%{--</div>--}%

<div class="fieldcontain ${hasErrors(bean: phaseInstance, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="phase.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="1024" value="${phaseInstance?.comment}"/>
</div>

%{--<div class="fieldcontain ${hasErrors(bean: phaseInstance, field: 'startDate', 'error')} required">--}%
	%{--<label for="startDate">--}%
		%{--<g:message code="phase.startDate.label" default="Start Date" />--}%
		%{--<span class="required-indicator">*</span>--}%
	%{--</label>--}%
	%{--<g:datePicker name="startDate" precision="day"  value="${phaseInstance?.startDate}"  />--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: phaseInstance, field: 'endDate', 'error')} ">--}%
	%{--<label for="endDate">--}%
		%{--<g:message code="phase.endDate.label" default="End Date" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:datePicker name="endDate" precision="day"  value="${phaseInstance?.endDate}" default="none" noSelection="['': '']" />--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: phaseInstance, field: 'organization', 'error')} required">--}%
	%{--<label for="organization">--}%
		%{--<g:message code="phase.organization.label" default="Organization" />--}%
		%{--<span class="required-indicator">*</span>--}%
	%{--</label>--}%
	%{--<g:select id="organization" name="organization.id" from="${bahman.Organization.list()}" optionKey="id" required="" value="${phaseInstance?.organization?.id}" class="many-to-one"/>--}%
%{--</div>--}%

