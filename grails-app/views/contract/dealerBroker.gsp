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
    <div style="height: 100px; vertical-align: bottom">
        <g:message code="contract.new.label" default="" />
    </div>
    <rg:criteria inline='true'>
        <rg:like name="contractNo" />
        <rg:like name="contractPartNo" />
        <rg:like name="buyerBrokerDesc" />
        <rg:like name="dealerBrokerDesc" />
        <rg:like name="customerDesc" />
        <rg:eq name="dealerBrokerCode" value="${organization?.code}" hidden="true"/>
        <rg:filterGrid grid="ContractNewGrid" />
    </rg:criteria>
    <rg:grid domainClass="${bahman?.Contract}" idPostfix="New">
        <rg:criteria>
            <rg:eq name="dealerBrokerCode" value="${organization?.code}"/>
            <rg:alias name='phases' value='m'/>
            <rg:eq name='m.status' value='Waiting'/>
            <rg:eq name='m.phase' value='DealerBroker'/>
        </rg:criteria>
    </rg:grid>
    %{--<rg:dialog id="contract" title="Contract Form">--}%
        %{--<rg:fields bean="${new bahman.Contract()}">--}%
            %{--<rg:modify>--}%
                %{--<rg:hiddenReference field="phases"></rg:hiddenReference>--}%
                %{--<rg:hiddenReference field="attachments"></rg:hiddenReference>--}%
                %{--<rg:hiddenReference field="applicationForm"></rg:hiddenReference>--}%
                %{--<rg:hiddenReference field="valueAddedTax"></rg:hiddenReference>--}%
                %{--<rg:hiddenReference field="settlementCertificate"></rg:hiddenReference>--}%
                %{--<rg:hiddenReference field="importDate"></rg:hiddenReference>--}%
                %{--<rg:ignoreField field="prevStatus"></rg:ignoreField>--}%
                %{--<rg:ignoreField field="lastPhase"></rg:ignoreField>--}%
            %{--</rg:modify>--}%
        %{--</rg:fields>--}%
        %{--<rg:saveButton domainClass="${bahman?.Contract}"/>--}%
        %{--<rg:cancelButton/>--}%
    %{--</rg:dialog>--}%

    <div style="height: 100px; vertical-align: bottom">
        <g:message code="contract.all.label" default="" />
    </div>
    <rg:criteria inline='true'>
        <rg:like name="contractNo" />
        <rg:like name="contractPartNo" />
        <rg:like name="buyerBrokerDesc" />
        <rg:like name="dealerBrokerDesc" />
        <rg:like name="customerDesc" />
        <rg:eq name="dealerBrokerCode" value="${organization?.code}" hidden="true"/>
        <rg:filterGrid grid="ContractRejectGrid" />
    </rg:criteria>
    <rg:grid domainClass="${bahman?.Contract}" idPostfix="Reject">
        <rg:criteria>
            <rg:eq name="dealerBrokerCode" value="${organization?.code}"/>
            <rg:alias name='phases' value='m'/>
            <rg:eq name='m.status' value='Waiting'/>
            <rg:ne name='m.phase' value='DealerBroker'/>
        </rg:criteria>
    </rg:grid>

    %{--<p>--}%
        %{--<g:message code="contract.reject.label" default="" />--}%
    %{--</p>--}%
    %{--<rg:grid domainClass="${bahman.Contract}">--}%
        %{--<rg:criteria>--}%
            %{--<rg:eq name="dealerBrokerCode" value="${organization.code}"/>--}%
            %{--<rg:alias name='phases' value='m'/>--}%
            %{--<rg:eq name='m.status' value='Reject'/>--}%
            %{--<rg:eq name='m.phase' value='Supplier'/>--}%
        %{--</rg:criteria>--}%
    %{--</rg:grid>--}%
    %{--<rg:dialog id="contractReject" title="Contract Form">--}%
        %{--<rg:fields bean="${new bahman.Contract()}">--}%
            %{--<rg:modify>--}%
                %{--<rg:hiddenReference field="phases"></rg:hiddenReference>--}%
                %{--<rg:hiddenReference field="attachments"></rg:hiddenReference>--}%
                %{--<rg:hiddenReference field="applicationForm"></rg:hiddenReference>--}%
                %{--<rg:hiddenReference field="valueAddedTax"></rg:hiddenReference>--}%
                %{--<rg:hiddenReference field="settlementCertificate"></rg:hiddenReference>--}%
                %{--<rg:hiddenReference field="importDate"></rg:hiddenReference>--}%
                %{--<rg:ignoreField field="prevStatus"></rg:ignoreField>--}%
                %{--<rg:ignoreField field="lastPhase"></rg:ignoreField>--}%
            %{--</rg:modify>--}%
        %{--</rg:fields>--}%
        %{--<rg:saveButton domainClass="${bahman.Contract}"/>--}%
        %{--<rg:cancelButton/>--}%
    %{--</rg:dialog>--}%
    <input type="button" ng-click="openContractCreateDialog()" value="create">
    <input type="button" ng-click="openContractEditDialog()" value="edit">
</div>
</body>
</html>
