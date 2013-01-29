<%@ page import="bahman.Contract" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <script type="text/javascript">
        $(function(){
            $(".tab-pane").removeClass("active").first().addClass("active")
        })
    </script>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>

<div id="list-contract" class="content scaffold-list" role="main">
    <div class="tabbable tabs-right">
        <ul class="nav nav-tabs">
            <li class="active">
                <a data-toggle="tab" href="#rA"><g:message code="contract.confirm.label"
                                                           default="در انتظار تایید"></g:message></a>
            </li>
            <li class="">
                <a data-toggle="tab" href="#rB"><g:message code="contract.others.label"
                                                           default="مابقی "></g:message></a>
            </li>
            <li class="">
                <a data-toggle="tab" href="#rC"><g:message code="contract.finished.label"
                                                           default=" تحویل شده"></g:message></a>
            </li>
            <li class="">
                <a data-toggle="tab" href="#rD"><g:message code="contract.amendment.label"
                                                           default="اصلاحیه"></g:message></a>
            </li>
        </ul>

        <div class="tab-content">
            <div id="rA" class="tab-pane active">
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
                <rg:grid domainClass="${bahman.Contract}"
                         columns="[[name: 'prevStatus' , expression: 'g.message([code: obj.prevStatus])'], [name: 'contractNo'], [name: 'contractPartNo'], [name: 'buyerBrokerDesc'], [name: 'dealerBrokerDesc'], [name: 'customerDesc']]">
                    <rg:criteria>
                        <rg:eq name="supplierCode" value="${organization?.code}"/>
                        <rg:alias name='phases' value='m'/>
                        <rg:eq name='m.status' value='Waiting'/>
                        <rg:eq name='m.phase' value='Manufacturer'/>
                    </rg:criteria>
                </rg:grid>
            </div>

            <div id="rB" class="tab-pane active">
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
                        <rg:eq name="supplierCode" value="${organization?.code}"/>
                        <rg:alias name='phases' value='m'/>
                        <rg:eq name='m.status' value='Waiting'/>
                        <rg:ne name='m.phase' value='Manufacturer'/>
                    </rg:criteria>
                </rg:grid>
            </div>

            <div id="rC" class="tab-pane active">
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
                <rg:grid domainClass="${bahman.Contract}" idPostfix='Finished'
                         columns="[[name: 'prevStatus' , expression: 'g.message([code: obj.prevStatus])'], [name: 'contractNo'], [name: 'contractPartNo'], [name: 'buyerBrokerDesc'], [name: 'dealerBrokerDesc'], [name: 'customerDesc']]">
                    <rg:criteria>
                        <rg:eq name="supplierCode" value="${organization?.code}"/>
                        <rg:alias name='phases' value='m'/>
                        <rg:eq name='m.phase' value='Finished'/>
                    </rg:criteria>
                </rg:grid>
            </div>

            <div id="rD" class="tab-pane active">
                <rg:criteria inline='true'>
                    <rg:like name="contractNo"/>
                    <rg:like name="contractPartNo"/>
                    <rg:like name="buyerBrokerDesc"/>
                    <rg:like name="customerDesc"/>
                    <rg:eq name="supplierCode" value="${organization?.code}" hidden="true"/>
                    <rg:isNotEmpty name="amendment"></rg:isNotEmpty>
                    <rg:filterGrid grid="ContractAmendmentGrid"/>
                </rg:criteria>
                <rg:grid domainClass="${bahman.Contract}" idPostfix='Amendment'
                         columns="[[name: 'prevStatus' , expression: 'g.message([code: obj.prevStatus])'], [name: 'contractNo'], [name: 'contractPartNo'], [name: 'buyerBrokerDesc'], [name: 'dealerBrokerDesc'], [name: 'customerDesc']]">
                    <rg:criteria>
                        <rg:eq name="supplierCode" value="${organization?.code}"/>
                        <rg:isNotEmpty name="amendment"></rg:isNotEmpty>
                    </rg:criteria>
                </rg:grid>
            </div>
        </div>
    </div>
</body>
</html>
