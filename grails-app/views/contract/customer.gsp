<%@ page import="bahman.Contract" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>

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
    columns="[[name:'contractNo'],[name:'contractPartNo'],[name:'buyerBrokerDesc'],[name:'dealerBrokerDesc']]"
    >
        <rg:criteria>
            <rg:eq name="customerCode" value="${customer?.code}"/>
        </rg:criteria>
    </rg:grid>
</div>
</body>
</html>
