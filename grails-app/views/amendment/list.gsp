<%@ page import="bahman.Amendment" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'amendment.label', default: 'Amendment')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-amendment" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        %{--<li><g:link class="create" action="create"><g:message code="default.new.label"--}%
        %{--args="[entityName]"/></g:link></li>--}%

    </ul>
</div>

<div id="list-amendment" ng-controller="amendmentController" class="content scaffold-list" role="main">
    <rg:grid domainClass="${bahman.Amendment}"
             caption="${message(code: "amendment-list")}"
             maxColumns="5"
             columns="[[name: 'amendmentDate'], [name: 'fileName'], [name: 'phases', expression: 'obj.phases?.sort{it.startDate}?.last()?.phase'], [name: 'contractNo'], [name: 'contractPartNo']]">
        <rg:criteria>
            <rg:eq name="contractNo" value="${contractInstance.contractNo}"/>
            <rg:eq name="contractPartNo" value="${contractInstance.contractPartNo}"/>
            %{--<rg:eq name="${amendmentType}" value="Y"></rg:eq>--}%
            <rg:alias name='phases' value='m'/>
            %{--<rg:ne name='m.status' value=''  hidden="true"/>--}%
            <rg:eq name='m.phase' value="${userType}" hidden="true"/>
        </rg:criteria>
    </rg:grid>

    <g:if test="${createAmendment == "True"}">

        <rg:dialog id="amendment" title="Amendment Form">
            <rg:fields bean="${new bahman.Amendment()}">
                <rg:modify>
                    <rg:ignoreField field="amendmentDate"/>
                    <rg:ignoreField field="contractNo"/>
                    <rg:ignoreField field="contractPartNo"/>
                    <rg:ignoreField field="dealerBroker"/>
                    <rg:ignoreField field="buyerBroker"/>
                    <rg:ignoreField field="supplier"/>
                    <rg:ignoreField field="manufacturer"/>
                    <rg:ignoreField field="finished"/>
                    <rg:ignoreField field="phases"/>
                    <rg:ignoreField field="fileName"/>
                    <rg:ignoreField field="contentType"/>
                    <rg:ignoreField field="status"/>
                </rg:modify>
                <g:hiddenField name="contractId" value="${contractInstance?.id}"/>
            </rg:fields>
            <rg:saveButton domainClass="${bahman.Amendment}" conroller="amendment" params="[method: 'post']"/>
            <rg:cancelButton/>
        </rg:dialog>
        <input type="button" ng-click="openAmendmentCreateDialog()" value="<g:message code="create"/>">
    %{--<g:link class="create" action="create" >sds</g:link>--}%
    </g:if>

</body>
</html>
