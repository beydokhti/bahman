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
    <rg:grid domainClass="${bahman.Amendment}" caption="لیست اصلاحیه ها">
        <rg:criteria>
            <rg:eq name="contractNo" value="${contractInstance.contractNo}"/>
            <rg:eq name="contractPartNo" value="${contractInstance.contractPartNo}"/>
            <rg:eq name="dealerBroker" value="Y"></rg:eq>
        </rg:criteria>
    </rg:grid>

    <rg:dialog id="amendment" title="Amendment Form">
        <rg:fields bean="${new bahman.Amendment()}">
            <rg:modify>
                <rg:hiddenReference field="amendmentDate"></rg:hiddenReference>
                <rg:hiddenReference field="contractNo"></rg:hiddenReference>
                <rg:hiddenReference field="contractPartNo"></rg:hiddenReference>
                <rg:hiddenReference field="dealerBroker"></rg:hiddenReference>
                <rg:hiddenReference field="buyerBroker"></rg:hiddenReference>
                <rg:hiddenReference field="supplier"></rg:hiddenReference>
                <rg:hiddenReference field="manufacturer"></rg:hiddenReference>
                <rg:hiddenReference field="finished"></rg:hiddenReference>
                <rg:hiddenReference field="attachments"></rg:hiddenReference>
                <rg:hiddenReference field="phases"></rg:hiddenReference>
            </rg:modify>
        </rg:fields>
        <rg:saveButton domainClass="${bahman.Amendment}" conroller="amendment" params="[method:'post',contractId:contractInstance.id]"/>
        <rg:cancelButton/>
    </rg:dialog>
    <input type="button" ng-click="openAmendmentCreateDialog()" value="create">
    %{--<g:link class="create" action="create" >sds</g:link>--}%

</body>
</html>
