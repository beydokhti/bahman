<%@ page import="bahman.Amendment" %>



<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'amendmentDate', 'error')} required">
	<label for="amendmentDate">
		<g:message code="amendment.amendmentDate.label" default="Amendment Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="amendmentDate" precision="day"  value="${amendmentInstance?.amendmentDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'amendmentDocument', 'error')} ">
	<label for="amendmentDocument">
		<g:message code="amendment.amendmentDocument.label" default="Amendment Document" />
		
	</label>
	<input type="file" id="amendmentDocument" name="amendmentDocument" />
</div>

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'phases', 'error')} ">
	<label for="phases">
		<g:message code="amendment.phases.label" default="Phases" />
		
	</label>
	<g:select name="phases" from="${bahman.Phase.list()}" multiple="multiple" optionKey="id" size="5" value="${amendmentInstance?.phases*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'contractNo', 'error')} ">
	<label for="contractNo">
		<g:message code="amendment.contractNo.label" default="Contract No" />
		
	</label>
	<g:textField name="contractNo" maxlength="50" value="${amendmentInstance?.contractNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'contractPartNo', 'error')} ">
	<label for="contractPartNo">
		<g:message code="amendment.contractPartNo.label" default="Contract Part No" />
		
	</label>
	<g:textField name="contractPartNo" maxlength="50" value="${amendmentInstance?.contractPartNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'dealerBroker', 'error')} ">
	<label for="dealerBroker">
		<g:message code="amendment.dealerBroker.label" default="Dealer Broker" />
		
	</label>
	<g:select name="dealerBroker" from="${amendmentInstance.constraints.dealerBroker.inList}" value="${amendmentInstance?.dealerBroker}" valueMessagePrefix="amendment.dealerBroker" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'buyerBroker', 'error')} ">
	<label for="buyerBroker">
		<g:message code="amendment.buyerBroker.label" default="Buyer Broker" />
		
	</label>
	<g:select name="buyerBroker" from="${amendmentInstance.constraints.buyerBroker.inList}" value="${amendmentInstance?.buyerBroker}" valueMessagePrefix="amendment.buyerBroker" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'supplier', 'error')} ">
	<label for="supplier">
		<g:message code="amendment.supplier.label" default="Supplier" />
		
	</label>
	<g:select name="supplier" from="${amendmentInstance.constraints.supplier.inList}" value="${amendmentInstance?.supplier}" valueMessagePrefix="amendment.supplier" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'manufacturer', 'error')} ">
	<label for="manufacturer">
		<g:message code="amendment.manufacturer.label" default="Manufacturer" />
		
	</label>
	<g:select name="manufacturer" from="${amendmentInstance.constraints.manufacturer.inList}" value="${amendmentInstance?.manufacturer}" valueMessagePrefix="amendment.manufacturer" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'finished', 'error')} ">
	<label for="finished">
		<g:message code="amendment.finished.label" default="Finished" />
		
	</label>
	<g:select name="finished" from="${amendmentInstance.constraints.finished.inList}" value="${amendmentInstance?.finished}" valueMessagePrefix="amendment.finished" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="amendment.comment.label" default="Comment" />
		
	</label>
	<g:textField name="comment" value="${amendmentInstance?.comment}"/>
</div>

