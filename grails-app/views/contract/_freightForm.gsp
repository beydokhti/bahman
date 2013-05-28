<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'freight', 'error')} ">
    <label for="description">
        <g:message code="contract.freight.label" default="freight" />

    </label>
    <g:textArea name="description" cols="40" rows="5" maxlength="1024" value="${contractInstance?.freight}"/>
</div>