<%--
  Created by IntelliJ IDEA.
  User: Mary
  Date: 1/8/13
  Time: 11:14 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'userAdmin.label', default: 'Phase')}"/>
    <title><g:message code="report.label" args="[entityName]"/></title>
</head>

<body>
%{--<div class="detail-property-list">--}%
%{--<div class="row">--}%
    %{--<g:set var="counter" value="${0}"></g:set>--}%
    %{--<g:each in="${contractInstance?.properties?.sort()}" var="c">--}%
        %{--<g:if test="${(counter % 3) == 0}">--}%
            %{--</div>--}%
            %{--<div class="row">--}%
        %{--</g:if>--}%
        %{--<span>--}%
            %{--<g:if test="${c.key.toString().equals('contractNo') ||--}%
                    %{--c.key.toString().equals('contractPartNo') ||--}%
                    %{--c.key.toString().equals('settlementType') ||--}%
                    %{--c.key.toString().equals('buyerBrokerDesc') ||--}%
                    %{--c.key.toString().equals('dealerBrokerDesc') ||--}%
                    %{--c.key.toString().equals('customerDesc') ||--}%
                    %{--c.key.toString().equals('productSymbol') ||--}%
                    %{--c.key.toString().equals('productDesc') ||--}%
                    %{--c.key.toString().equals('totalShipments') ||--}%
                    %{--c.key.toString().equals('price') ||--}%
                    %{--c.key.toString().equals('contractType') ||--}%
                    %{--c.key.toString().equals('manufacturerDesc') ||--}%
                    %{--c.key.toString().equals('deliveryPlace') ||--}%
                    %{--c.key.toString().equals('productMainGroup') ||--}%
                    %{--c.key.toString().equals('productGroup') ||--}%
                    %{--c.key.toString().equals('productSubGroup') ||--}%
                    %{--c.key.toString().equals('weight') ||--}%
                    %{--c.key.toString().equals('quantity') ||--}%
                    %{--c.key.toString().equals('buyerBrokerCode') ||--}%
                    %{--c.key.toString().equals('dealerBrokerCode') ||--}%
                    %{--c.key.toString().equals('customerCode') ||--}%
                    %{--c.key.toString().equals('supplierCode') ||--}%
                    %{--c.key.toString().equals('boursePrice') ||--}%
                    %{--c.key.toString().equals('contractID')}">--}%

                %{--<div class="span2"><div class="field-label"><g:message code="contract.${c.key}.label" default=""/></div>--}%
                %{--</div>--}%

                %{--<div class="span2"><g:textField name="txt${c.key}" maxlength="200" required="" value="${c.value}" style="width: 70px"/></div>--}%
                %{--<g:set var="counter" value="${counter + 1}"></g:set>--}%
            %{--</g:if>--}%

        %{--</span>--}%
    %{--</g:each>--}%

    %{--<g:set var="counter" value="${0}"></g:set>--}%
    %{--<g:each in="${contractInstance?.properties?.sort()}" var="c">--}%
        %{--<g:if test="${(counter % 2) == 0}">--}%
            %{--</div>--}%
            %{--<div class="row">--}%
        %{--</g:if>--}%
        %{--<span>--}%
             %{--<g:if test="${c.key.toString().equals('contractDate') ||--}%
                    %{--c.key.toString().equals('allotmentDate') ||--}%
                    %{--c.key.toString().equals('settlementDeadline') ||--}%
                    %{--c.key.toString().equals('deliveryDate') ||--}%
                    %{--c.key.toString().equals('settlementDate') ||--}%
                    %{--c.key.toString().equals('releaseDate') ||--}%
                    %{--c.key.toString().equals('importDate')}">--}%
                %{--<div class="span2"><div class="field-label"><g:message code="contract.${c.key}.label" default=""/></div>--}%
                %{--</div>--}%

                %{--<div class="span10"><g:datePicker name="txt${c.key}" precision="day"  value="${c.value}" /></div>--}%
                %{--<g:set var="counter" value="${counter + 1}"></g:set>--}%
            %{--</g:if>--}%

        %{--</span>--}%
    %{--</g:each>--}%
%{--</div>--}%
%{--</div>--}%
<rg:criteria inline='true'>
    <rg:like name="contractNo"/>
    <rg:like name="contractPartNo"/>
    <rg:like name="buyerBrokerDesc"/>
    <rg:like name="customerDesc"/>
    <rg:filterGrid grid="ContractGrid" label="${message(code: "search")}"/>
</rg:criteria>
<rg:grid domainClass="${bahman.Contract}"
         columns="[[name: 'prevStatus' , expression: 'g.message([code: obj.prevStatus])'], [name: 'contractNo'], [name: 'contractPartNo'], [name: 'buyerBrokerDesc'], [name: 'dealerBrokerDesc'], [name: 'customerDesc']]">
</rg:grid>
</body>
</html>