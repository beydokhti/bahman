<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'addedTaxReceipt', 'error')} required">
    <label for="addedTaxReceipt">
        <g:message code="contract.addedTaxReceipt.label" default="addedTax Receipt" />
    </label>
    <g:textField name="addedTaxReceipt" value="${contractInstance?.addedTaxReceipt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'addedTaxReceiptDate', 'error')} required">
    <label for="addedTaxReceiptDate">
        <g:message code="contract.addedTaxReceiptDate.label" default="addedTax Receipt Date" />
    </label>
    <rg:datePicker name="addedTaxReceiptDate" precision="day"  value="${contractInstance?.addedTaxReceiptDate}"  />
</div>