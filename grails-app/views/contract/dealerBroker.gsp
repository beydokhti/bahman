<%@ page import="bahman.Contract" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
<script type="text/javascript">
    $('.nav li a').click(function(e) {
        var $this = $(this);
        if (!$this.hasClass('active')) {
            $this.addClass('active');
        }
        var $content
        if ($this.name=="rAm"){
            $content=$("#rA")
        }
        if ($this.name=="rBm"){
            $content=$("#rB")
        }
        if ($this.name=="rCm"){
            $content=$("#rC")
        }
        if (!$content.hasClass('active')) {
            $content.addClass('active');
        }
        e.preventDefault();
    });

//    $(document).ready(function() {
//        var $content=$("#rB")
//        if ($content.hasClass('active')) {
//            $content.removeClass('active');
//              $content.addClass('displayNone')
//        }
//        $content=$("#rC")
//        if ($content.hasClass('active')) {
//            $content.removeClass('active');
//        }
//    });
</script>
<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>

<div id="list-contract" ng-controller="contractController" class="content scaffold-list" role="main">

    <div class="tabbable tabs-right">
        <ul class="nav nav-tabs">
            <li class="active" name="rAm">
                <a data-toggle="tab" href="#rA">Section 1</a>
            </li>
            <li class="" name="rBm">
                <a data-toggle="tab" href="#rB">Section 2</a>
            </li>
            <li class="" name="rCm">
                <a data-toggle="tab" href="#rC">Section 3</a>
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
                <rg:grid domainClass="${bahman.Contract}" caption="در انتظار تایید"
                         columns="[[name: 'prevStatus' , expression: 'g.message([code: obj.prevStatus])'], [name: 'contractNo'], [name: 'contractPartNo'], [name: 'buyerBrokerDesc'], [name: 'dealerBrokerDesc'], [name: 'customerDesc']]">
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
                    <rg:ne name='m.status' value='Waiting' hidden="true"/>
                    <rg:eq name='m.phase' value='DealerBroker' hidden="true"/>
                    <rg:filterGrid grid="ContractRejectGrid" label="${message(code: "search")}"/>
                </rg:criteria>
                <rg:grid domainClass="${bahman.Contract}" idPostfix="Reject" caption="مابقی قرارداد ها"
                         columns="[[name: 'prevStatus', expression: 'g.message([code: obj.prevStatus])'], [name: 'contractNo'], [name: 'contractPartNo'], [name: 'buyerBrokerDesc'], [name: 'dealerBrokerDesc'], [name: 'customerDesc']]">
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
                <rg:grid domainClass="${bahman.Contract}" idPostfix="Finished" caption="قراردادهای تحویل شده"
                         columns="[[name: 'contractNo'], [name: 'contractPartNo'], [name: 'buyerBrokerDesc'], [name: 'dealerBrokerDesc'], [name: 'customerDesc']]">
                    <rg:criteria>
                        <rg:eq name="dealerBrokerCode" value="${organization?.code}"/>
                        <rg:alias name='phases' value='m'/>
                        <rg:eq name='m.phase' value='Finished'/>
                    </rg:criteria>
                </rg:grid>

            </div>
        </div>
    </div>

</div>
</body>
</html>
