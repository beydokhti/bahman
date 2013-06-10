<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'freight', 'error')} ">
    <label for="description">
        <g:message code="contract.freight.label" default="freight" />

    </label>
    <g:textArea name="description" cols="40" rows="5" maxlength="100" value="${contractInstance?.freight}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'placeOfUnloading', 'error')} ">
    <label for="placeOfUnloading">
        <g:message code="contract.placeOfUnloading.label" default="place Of Unloading" />

    </label>
    <g:textArea name="placeOfUnloading" cols="40" rows="5" maxlength="500" value="${contractInstance?.freight}"/>
</div>