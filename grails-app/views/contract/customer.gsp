<%@ page import="bahman.Contract" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

<div id="list-contract" ng-controller="contractController" class="content scaffold-list" role="main">
    %{--<rg:grid domainClass="${bahman.Contract}">--}%
        %{--<rg:criteria>--}%
            %{--<rg:eq name="customerCode" value="${customer.code}"/>--}%
        %{--</rg:criteria>--}%
    %{--</rg:grid>--}%
    %{--<rg:dialog id="contract" title="Contract Form">--}%
        %{--<rg:fields bean="${new bahman.Contract()}"></rg:fields>--}%
        %{--<rg:saveButton domainClass="${bahman.Contract}"/>--}%
        %{--<rg:cancelButton/>--}%
    %{--</rg:dialog>--}%

    <rg:criteria inline='true'>
        <rg:like name="contractNo" />
        <rg:like name="contractPartNo" />
        <rg:like name="buyerBrokerDesc" />
        <rg:like name="dealerBrokerDesc" />
        %{--<rg:like name="customerDesc" />--}%
        <rg:eq name="customerCode" value="${organization?.code}" hidden="true"/>
        <rg:filterGrid grid="ContractGrid" />
    </rg:criteria>
    <rg:grid domainClass="${bahman?.Contract}"
    columns="[[name:'contractNo'],[name:'contractPartNo'],[name:'buyerBrokerDesc'],[name:'dealerBrokerDesc']]"
    >
        <rg:criteria>
            <rg:eq name="customerCode" value="${organization?.code}"/>
        %{--<rg:alias name='phases' value='m'/>--}%
        %{--<rg:eq name='m.status' value='Waiting'/>--}%
        %{--<rg:eq name='m.phase' value='DealerBroker'/>--}%
        </rg:criteria>
        %{--<rg:modify>--}%
            %{--<rg:hiddenReference field="prevStatus"></rg:hiddenReference>--}%
            %{--<rg:hiddenReference field="lastPhase"></rg:hiddenReference>--}%

        %{--</rg:modify>--}%
    </rg:grid>
    <rg:dialog id="contract" title="Contract Form">
        <rg:fields bean="${new bahman.Contract()}">
            <rg:modify>
                <rg:hiddenReference field="phases"></rg:hiddenReference>
                <rg:hiddenReference field="attachments"></rg:hiddenReference>
                <rg:hiddenReference field="applicationForm"></rg:hiddenReference>
                <rg:hiddenReference field="valueAddedTax"></rg:hiddenReference>
                <rg:hiddenReference field="settlementCertificate"></rg:hiddenReference>
                <rg:hiddenReference field="importDate"></rg:hiddenReference>
                <rg:ignoreField field="prevStatus"></rg:ignoreField>
                <rg:ignoreField field="lastPhase"></rg:ignoreField>
            </rg:modify>
        </rg:fields>
        <rg:saveButton domainClass="${bahman?.Contract}"/>
        <rg:cancelButton/>
    </rg:dialog>

    %{--<input type="button" ng-click="openContractCreateDialog()" value="create">--}%
    %{--<input type="button" ng-click="openContractEditDialog()" value="edit">--}%

</div>
</body>
</html>
