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
    <rg:criteria inline='true'>
        <rg:like name="contractNo" />
        <rg:like name="contractPartNo" />
        <rg:like name="buyerBrokerDesc" />
        <rg:like name="dealerBrokerDesc" />
        <rg:eq name="customerCode" value="${customer?.code}" hidden="true"/>
        <rg:filterGrid grid="ContractGrid" />
    </rg:criteria>
    <rg:grid domainClass="${bahman.Contract}"
             columns="[[name: 'prevStatus' , expression: 'g.message([code: obj.prevStatus])'], [name: 'contractNo'], [name: 'contractPartNo'], [name: 'buyerBrokerDesc'], [name: 'dealerBrokerDesc'], [name: 'customerDesc'],
                     [name: 'phase',expression: 'g.message(code:obj?.phases?.sort{-it.id}?.find{true}?.phase)'],
                     [name: 'draft',expression: 'obj?.drafts?.sort{-it.id}.find{true}?.description']]">
        <rg:criteria>
            <rg:eq name="customerCode" value="${customer?.code}"/>
        </rg:criteria>
    </rg:grid>
</div>
</body>
</html>
