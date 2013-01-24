<%@ page import="bahman.Contract" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>
<div id="list-contract"  class="content scaffold-list" role="main">
    <rg:criteria inline='true'>
        <rg:like name="contractNo"/>
        <rg:like name="contractPartNo"/>
        <rg:like name="buyerBrokerDesc"/>
        <rg:like name="customerDesc"/>
        <rg:eq name="supplierCode" value="${organization?.code}" hidden="true"/>
        <rg:alias name='phases' value='m'/>
        <rg:eq name='m.status' value='Waiting' hidden="true"/>
        <rg:eq name='m.phase' value='Manufacturer' hidden="true"/>
        <rg:filterGrid grid="ContractGrid"/>
    </rg:criteria>
    <rg:grid domainClass="${bahman.Contract}" caption="فرارداد های در انتظار تایید">
        <rg:criteria>
            <rg:eq name="supplierCode" value="${organization?.code}" />
            <rg:alias name='phases' value='m'/>
            <rg:eq name='m.status' value='Waiting'/>
            <rg:eq name='m.phase' value='Manufacturer'/>
        </rg:criteria>
    </rg:grid>
    <rg:criteria inline='true'>
        <rg:like name="contractNo"/>
        <rg:like name="contractPartNo"/>
        <rg:like name="buyerBrokerDesc"/>
        <rg:like name="customerDesc"/>
        <rg:eq name="supplierCode" value="${organization?.code}" hidden="true"/>
        <rg:alias name='phases' value='m'/>
        <rg:eq name='m.status' value='Waiting' hidden="true"/>
        <rg:ne name='m.phase' value='Manufacturer' hidden="true"/>
        <rg:filterGrid grid="ContractAllGrid"/>
    </rg:criteria>
    <rg:grid domainClass="${bahman.Contract}" idPostfix='All' caption="مابقی قراردادها">
        <rg:criteria>
            %{--<rg:eq name="manufacturerDesc" value="${organization?.description}"/>--}%
            <rg:eq name="supplierCode" value="${organization?.code}" />
            <rg:alias name='phases' value='m'/>
            <rg:eq name='m.status' value='Waiting'/>
            <rg:ne name='m.phase' value='Manufacturer'/>
        </rg:criteria>
    </rg:grid>

    <rg:criteria inline='true'>
        <rg:like name="contractNo"/>
        <rg:like name="contractPartNo"/>
        <rg:like name="buyerBrokerDesc"/>
        <rg:like name="customerDesc"/>
        <rg:eq name="supplierCode" value="${organization?.code}" hidden="true"/>
        <rg:alias name='phases' value='m'/>
        <rg:eq name='m.phase' value='Finished' hidden="true"/>
        <rg:filterGrid grid="ContractFinishedGrid"/>
    </rg:criteria>
    <rg:grid domainClass="${bahman.Contract}" idPostfix='Finished' caption="قراردادهای تحویل شده"
             columns="[[name:'contractNo'],[name:'contractPartNo'],[name:'buyerBrokerDesc'],[name:'dealerBrokerDesc'],[name:'customerDesc']]"    >
        <rg:criteria>
            <rg:eq name="supplierCode" value="${organization?.code}" />
            <rg:alias name='phases' value='m'/>
            <rg:eq name='m.phase' value='Finished'/>
        </rg:criteria>
    </rg:grid>


</div>
</body>
</html>
