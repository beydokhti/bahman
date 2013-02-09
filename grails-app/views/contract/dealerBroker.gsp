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

<div id="list-contract" ng-controller="contractController" class="content scaffold-list" role="main">

    <div class="tabbable tabs-right">
        <ul class="nav nav-tabs">
            <li class="active" >
                <a data-toggle="tab" href="#rA"><g:message code="contract.confirm.label" default="در انتظار تایید"></g:message> </a>
            </li>
            <li class="">
                <a data-toggle="tab" href="#rB"><g:message code="contract.others.label" default="در حال انجام"></g:message></a>
            </li>
            <li class="">
                <a data-toggle="tab" href="#rC"><g:message code="contract.finished.label" default=" تحویل شده"></g:message></a>
            </li>
            <li class="">
                <a data-toggle="tab" href="#rD"><g:message code="contract.amendment.label" default="اصلاحیه"></g:message></a>
            </li>
            <li class="">
                <a data-toggle="tab" href="#rE"><g:message code="contract.sent.label" default="ارسالی"></g:message></a>
            </li>
        </ul>

        <div class="tab-content">
            <div id="rA" class="tab-pane active" >

                <rg:criteria inline='true'>
                    <rg:like name="contractNo"/>
                    <rg:like name="contractPartNo"/>
                    <rg:like name="buyerBrokerDesc"/>
                    <rg:like name="customerDesc"/>
                    <rg:eq name="dealerBrokerCode" value="${organization?.code}" hidden="true"/>
                    <rg:alias name='phases' value='m'/>
                    <rg:eq name='m.status' value='Waiting' hidden="true"/>
                    <rg:eq name='m.phase' value='DealerBroker' hidden="true"/>
                    <rg:filterGrid grid="ContractGrid" label="${message(code: "search")}"/>
                </rg:criteria>
                <rg:grid domainClass="${bahman.Contract}"  caption="در انتظار تایید"
                         columns="[[name: 'prevStatus' , expression: 'g.message([code: obj?.prevStatus])'],
                                 [name: 'contractNo'],
                                 [name: 'contractPartNo'],
                                 [name: 'buyerBrokerDesc'],
                                 [name: 'dealerBrokerDesc'],
                                 [name: 'customerDesc'],
                                 [name: 'phase',expression: 'g.message(code:obj?.phases?.sort{-it.id}?.find{true}?.phase)'],
                                 [name: 'draft',expression: 'obj?.drafts?.sort{-it.id}.find{true}?.description']]">
                    <rg:criteria>
                        <rg:eq name="dealerBrokerCode" value="${organization?.code}"/>
                        <rg:alias name='phases' value='m'/>
                        <rg:eq name='m.status' value='Waiting'/>
                        <rg:eq name='m.phase' value='DealerBroker'/>
                    </rg:criteria>
                </rg:grid>

            </div>

            <div id="rB" class="tab-pane active">
                <rg:criteria inline='true'>
                    <rg:like name="contractNo"/>
                    <rg:like name="contractPartNo"/>
                    <rg:like name="buyerBrokerDesc"/>
                %{--<rg:like name="dealerBrokerDesc" />--}%
                    <rg:like name="customerDesc"/>
                    <rg:eq name="dealerBrokerCode" value="${organization?.code}" hidden="true"/>
                    <rg:alias name='phases' value='m'/>
                    <rg:eq name='m.status' value='Waiting' hidden="true"/>
                    <rg:ne name='m.phase' value='DealerBroker' hidden="true"/>
                    <rg:filterGrid grid="ContractRejectGrid" label="${message(code: "search")}"/>
                </rg:criteria>
                <rg:grid domainClass="${bahman.Contract}" idPostfix="Reject" caption="در حال انجام"
                         columns="[[name: 'prevStatus', expression: 'g.message([code: obj.prevStatus])'],
                                 [name: 'contractNo'],
                                 [name: 'contractPartNo'],
                                 [name: 'buyerBrokerDesc'],
                                 [name: 'dealerBrokerDesc'],
                                 [name: 'customerDesc'],
                                 [name:'phase',expression: 'g.message(code:obj?.phases?.sort{-it.id}?.find{true}?.phase)'],
                                 [name: 'draft',expression: 'obj?.drafts?.sort{-it.id}.find{true}?.description']]">
                    <rg:criteria>
                        <rg:eq name="dealerBrokerCode" value="${organization?.code}"/>
                        <rg:alias name='phases' value='m'/>
                        <rg:eq name='m.status' value='Waiting'/>
                        <rg:ne name='m.phase' value='DealerBroker'/>
                    </rg:criteria>
                </rg:grid>
                <rg:dialog id="contract" title="Contract Form">
                    <rg:fields bean="${new bahman.Contract()}">
                        <rg:modify>
                            <rg:hiddenReference field="phases"></rg:hiddenReference>
                            <rg:hiddenReference field="attachments"></rg:hiddenReference>
                            <rg:hiddenReference field="importDate"></rg:hiddenReference>
                            <rg:hiddenReference field="drafts"></rg:hiddenReference>
                            <rg:hiddenReference filed="dealerBrokerCode"></rg:hiddenReference>
                            <rg:hiddenReference filed="dealerBrokerDesc"></rg:hiddenReference>
                            <rg:ignoreField field="prevStatus"></rg:ignoreField>
                            <rg:ignoreField field="lastPhase"></rg:ignoreField>
                        </rg:modify>
                    </rg:fields>
                    <rg:saveButton domainClass="${bahman.Contract}" saveCallback="refresh" conroller="contract"
                                   params="[method: 'post']"/>
                    <rg:cancelButton/>
                </rg:dialog>
                <g:javascript>
                    function refresh(resp) {
                        $("#ContractRejectGrid").trigger("reloadGrid")
                    }
                </g:javascript>
                <input type="button" ng-click="openContractCreateDialog()" value="<g:message code="create"/>">

            </div>

            <div id="rC" class="tab-pane active">
                <rg:criteria inline='true'>
                    <rg:like name="contractNo"/>
                    <rg:like name="contractPartNo"/>
                    <rg:like name="buyerBrokerDesc"/>
                    <rg:like name="customerDesc"/>
                    <rg:eq name="dealerBrokerCode" value="${organization?.code}" hidden="true"/>
                    <rg:alias name='phases' value='m'/>
                    <rg:eq name='m.phase' value='Finished' hidden="true"/>
                    <rg:filterGrid grid="ContractFinishedGrid" label="${message(code: "search")}"/>
                </rg:criteria>
                <rg:grid domainClass="${bahman.Contract}" idPostfix="Finished" caption="تحویل شده"
                         columns="[[name: 'contractNo'],
                                 [name: 'contractPartNo'],
                                 [name: 'buyerBrokerDesc'],
                                 [name: 'dealerBrokerDesc'],
                                 [name: 'customerDesc'],
                                 [name: 'draft',expression: 'obj?.drafts?.sort{-it.id}.find{true}?.description']]">
                    <rg:criteria>
                        <rg:eq name="dealerBrokerCode" value="${organization?.code}"/>
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
                    <rg:eq name="dealerBrokerCode" value="${organization?.code}" hidden="true"/>
                    <rg:isNotEmpty name="amendments"></rg:isNotEmpty>
                    %{--<rg:isNotEmpty name="amendments"/>--}%
                    <rg:filterGrid grid="ContractAmendmentGrid" label="${message(code: "search")}"/>
                </rg:criteria>
                <rg:grid domainClass="${bahman.Contract}" idPostfix="Amendment" caption="اصلاحیه"
                         columns="[[name: 'contractNo'],
                                 [name: 'contractPartNo'],
                                 [name: 'buyerBrokerDesc'],
                                 [name: 'dealerBrokerDesc'],
                                 [name: 'customerDesc'],
                                 [name:'phase',expression: 'g.message(code:obj?.phases?.sort{-it.id}?.find{true}?.phase)'],
                                 [name: 'draft',expression: 'obj?.drafts?.sort{-it.id}.find{true}?.description']]">
                    <rg:criteria>
                        <rg:eq name="dealerBrokerCode" value="${organization?.code}"/>
                        <rg:isNotEmpty name="amendments"></rg:isNotEmpty>
                        %{--<rg:alias name='phases' value='m'/>--}%
                        %{--<rg:eq name='m.phase' value='Finished'/>--}%
                    </rg:criteria>
                </rg:grid>

            </div>

            <div id="rE" class="tab-pane active" >

                <rg:criteria inline='true'>
                    <rg:like name="contractNo"/>
                    <rg:like name="contractPartNo"/>
                    <rg:like name="buyerBrokerDesc"/>
                    <rg:like name="customerDesc"/>
                    <rg:eq name="dealerBrokerCode" value="${organization?.code}" hidden="true"/>
                    <rg:alias name='phases' value='m'/>
                    <rg:eq name='m.status' value='Pass' hidden="true"/>
                    <rg:eq name='m.phase' value='DealerBroker' hidden="true"/>
                    <rg:filterGrid grid="ContractSentGrid" label="${message(code: "search")}"/>
                </rg:criteria>
                <rg:grid domainClass="${bahman.Contract}" idPostfix="Sent" caption="ارسالی"
                         columns="[[name: 'prevStatus' , expression: 'g.message([code: obj.prevStatus])'],
                                 [name: 'contractNo'],
                                 [name: 'contractPartNo'],
                                 [name: 'buyerBrokerDesc'],
                                 [name: 'dealerBrokerDesc'],
                                 [name: 'customerDesc'],
                                 [name:'phase',expression: 'g.message(code:obj?.phases?.sort{-it.id}?.find{true}.phase)'],
                                 [name: 'draft',expression: 'obj?.drafts?.sort{-it.id}.find{true}?.description']]">
                    <rg:criteria>
                        <rg:eq name="dealerBrokerCode" value="${organization?.code}"/>
                        <rg:alias name='phases' value='m'/>
                        <rg:eq name='m.status' value='Pass'/>
                        <rg:eq name='m.phase' value='DealerBroker'/>
                    </rg:criteria>
                </rg:grid>

            </div>


        </div>
    </div>

</div>
</body>
</html>
