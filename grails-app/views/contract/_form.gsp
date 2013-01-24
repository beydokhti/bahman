<%@ page import="bahman.Contract" %>



<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'contractNo', 'error')} required">
	<label for="contractNo">
		<g:message code="contract.contractNo.label" default="Contract No" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contractNo" required="" value="${contractInstance?.contractNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'contractPartNo', 'error')} required">
	<label for="contractPartNo">
		<g:message code="contract.contractPartNo.label" default="Contract Part No" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contractPartNo" required="" value="${contractInstance?.contractPartNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'contractDate', 'error')} required">
	<label for="contractDate">
		<g:message code="contract.contractDate.label" default="Contract Date" />
		<span class="required-indicator">*</span>
	</label>
	<rg:datePicker name="contractDate" precision="day"  value="${contractInstance?.contractDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'allotmentDate', 'error')} required">
	<label for="allotmentDate">
		<g:message code="contract.allotmentDate.label" default="Allotment Date" />
		<span class="required-indicator">*</span>
	</label>
	<rg:datePicker name="allotmentDate" precision="day"  value="${contractInstance?.allotmentDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'settlementDeadline', 'error')} required">
	<label for="settlementDeadline">
		<g:message code="contract.settlementDeadline.label" default="Settlement Deadline" />
		<span class="required-indicator">*</span>
	</label>
	<rg:datePicker name="settlementDeadline" precision="day"  value="${contractInstance?.settlementDeadline}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'settlementType', 'error')} ">
	<label for="settlementType">
		<g:message code="contract.settlementType.label" default="Settlement Type" />
		
	</label>
	<g:textField name="settlementType" value="${contractInstance?.settlementType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'buyerBrokerDesc', 'error')} ">
	<label for="buyerBrokerDesc">
		<g:message code="contract.buyerBrokerDesc.label" default="Buyer Broker Desc" />
		
	</label>
	<g:textField name="buyerBrokerDesc" value="${contractInstance?.buyerBrokerDesc}"/>
</div>

%{--<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'dealerBrokerDesc', 'error')} ">--}%
	%{--<label for="dealerBrokerDesc">--}%
		%{--<g:message code="contract.dealerBrokerDesc.label" default="Dealer Broker Desc" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:textField name="dealerBrokerDesc" value="${contractInstance?.dealerBrokerDesc}"/>--}%
%{--</div>--}%

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'customerDesc', 'error')} ">
	<label for="customerDesc">
		<g:message code="contract.customerDesc.label" default="Customer Desc" />
		
	</label>
	<g:textField name="customerDesc" value="${contractInstance?.customerDesc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'productSymbol', 'error')} ">
	<label for="productSymbol">
		<g:message code="contract.productSymbol.label" default="Product Symbol" />
		
	</label>
	<g:textField name="productSymbol" value="${contractInstance?.productSymbol}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'productDesc', 'error')} ">
	<label for="productDesc">
		<g:message code="contract.productDesc.label" default="Product Desc" />
		
	</label>
	<g:textField name="productDesc" value="${contractInstance?.productDesc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'totalShipments', 'error')} ">
	<label for="totalShipments">
		<g:message code="contract.totalShipments.label" default="Total Shipments" />
		
	</label>
	<g:textField name="totalShipments" value="${contractInstance?.totalShipments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'price', 'error')} ">
	<label for="price">
		<g:message code="contract.price.label" default="Price" />
		
	</label>
	<g:textField name="price" value="${contractInstance?.price}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'contractType', 'error')} ">
	<label for="contractType">
		<g:message code="contract.contractType.label" default="Contract Type" />
		
	</label>
	<g:textField name="contractType" value="${contractInstance?.contractType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'deliveryDate', 'error')} required">
	<label for="deliveryDate">
		<g:message code="contract.deliveryDate.label" default="Delivery Date" />
		<span class="required-indicator">*</span>
	</label>
	<rg:datePicker name="deliveryDate" precision="day"  value="${contractInstance?.deliveryDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'manufacturerDesc', 'error')} ">
	<label for="manufacturerDesc">
		<g:message code="contract.manufacturerDesc.label" default="Manufacturer Desc" />
		
	</label>
	<g:textField name="manufacturerDesc" value="${contractInstance?.manufacturerDesc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'deliveryPlace', 'error')} ">
	<label for="deliveryPlace">
		<g:message code="contract.deliveryPlace.label" default="Delivery Place" />
		
	</label>
	<g:textField name="deliveryPlace" value="${contractInstance?.deliveryPlace}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'productMainGroup', 'error')} ">
	<label for="productMainGroup">
		<g:message code="contract.productMainGroup.label" default="Product Main Group" />
		
	</label>
	<g:textField name="productMainGroup" value="${contractInstance?.productMainGroup}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'productGroup', 'error')} ">
	<label for="productGroup">
		<g:message code="contract.productGroup.label" default="Product Group" />
		
	</label>
	<g:textField name="productGroup" value="${contractInstance?.productGroup}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'productSubGroup', 'error')} ">
	<label for="productSubGroup">
		<g:message code="contract.productSubGroup.label" default="Product Sub Group" />
		
	</label>
	<g:textField name="productSubGroup" value="${contractInstance?.productSubGroup}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'weight', 'error')} ">
	<label for="weight">
		<g:message code="contract.weight.label" default="Weight" />
		
	</label>
	<g:textField name="weight" value="${contractInstance?.weight}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'quantity', 'error')} ">
	<label for="quantity">
		<g:message code="contract.quantity.label" default="Quantity" />
		
	</label>
	<g:textField name="quantity" value="${contractInstance?.quantity}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'buyerBrokerCode', 'error')} ">
	<label for="buyerBrokerCode">
		<g:message code="contract.buyerBrokerCode.label" default="Buyer Broker Code" />
		
	</label>
	<g:textField name="buyerBrokerCode" value="${contractInstance?.buyerBrokerCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'customerCode', 'error')} ">
	<label for="customerCode">
		<g:message code="contract.customerCode.label" default="Customer Code" />
		
	</label>
	<g:textField name="customerCode" value="${contractInstance?.customerCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'supplierCode', 'error')} ">
	<label for="supplierCode">
		<g:message code="contract.supplierCode.label" default="Supplier Code" />
		
	</label>
	<g:textField name="supplierCode" value="${contractInstance?.supplierCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'boursePrice', 'error')} ">
	<label for="boursePrice">
		<g:message code="contract.boursePrice.label" default="Bourse Price" />
		
	</label>
	<g:textField name="boursePrice" value="${contractInstance?.boursePrice}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'settlementDate', 'error')} required">
	<label for="settlementDate">
		<g:message code="contract.settlementDate.label" default="Settlement Date" />
		<span class="required-indicator">*</span>
	</label>
	<rg:datePicker name="settlementDate" precision="day"  value="${contractInstance?.settlementDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'contractID', 'error')} ">
	<label for="contractID">
		<g:message code="contract.contractID.label" default="Contract ID" />
		
	</label>
	<g:textField name="contractID" value="${contractInstance?.contractID}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'releaseDate', 'error')} required">
	<label for="releaseDate">
		<g:message code="contract.releaseDate.label" default="Release Date" />
		<span class="required-indicator">*</span>
	</label>
	<rg:datePicker name="releaseDate" precision="day"  value="${contractInstance?.releaseDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'importDate', 'error')} required">
	<label for="importDate">
		<g:message code="contract.importDate.label" default="Import Date" />
		<span class="required-indicator">*</span>
	</label>
	<rg:datePicker name="importDate" precision="day"  value="${contractInstance?.importDate}"  />
</div>

%{--<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'settlementCertificate', 'error')} required">--}%
	%{--<label for="settlementCertificate">--}%
		%{--<g:message code="contract.settlementCertificate.label" default="Settlement Certificate" />--}%
		%{--<span class="required-indicator">*</span>--}%
	%{--</label>--}%
	%{--<g:select id="settlementCertificate" name="settlementCertificate.id" from="${bahman.Attachment.list()}" optionKey="id" required="" value="${contractInstance?.settlementCertificate?.id}" class="many-to-one"/>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'valueAddedTax', 'error')} required">--}%
	%{--<label for="valueAddedTax">--}%
		%{--<g:message code="contract.valueAddedTax.label" default="Value Added Tax" />--}%
		%{--<span class="required-indicator">*</span>--}%
	%{--</label>--}%
	%{--<g:select id="valueAddedTax" name="valueAddedTax.id" from="${bahman.Attachment.list()}" optionKey="id" required="" value="${contractInstance?.valueAddedTax?.id}" class="many-to-one"/>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'applicationForm', 'error')} required">--}%
	%{--<label for="applicationForm">--}%
		%{--<g:message code="contract.applicationForm.label" default="Application Form" />--}%
		%{--<span class="required-indicator">*</span>--}%
	%{--</label>--}%
	%{--<g:select id="applicationForm" name="applicationForm.id" from="${bahman.Attachment.list()}" optionKey="id" required="" value="${contractInstance?.applicationForm?.id}" class="many-to-one"/>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'attachments', 'error')} ">--}%
	%{--<label for="attachments">--}%
		%{--<g:message code="contract.attachments.label" default="Attachments" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:select name="attachments" from="${bahman.Attachment.list()}" multiple="multiple" optionKey="id" size="5" value="${contractInstance?.attachments*.id}" class="many-to-many"/>--}%
%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'phases', 'error')} ">--}%
	%{--<label for="phases">--}%
		%{--<g:message code="contract.phases.label" default="Phases" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:select name="phases" from="${bahman.Phase.list()}" multiple="multiple" optionKey="id" size="5" value="${contractInstance?.phases*.id}" class="many-to-many"/>--}%
%{--</div>--}%

