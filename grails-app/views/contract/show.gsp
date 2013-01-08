<%@ page import="bahman.Contract" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-contract" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>
%{--<div class="nav" role="navigation">--}%
%{--<ul>--}%
%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
%{--</ul>--}%
%{--</div>--}%
<div id="show-contract" class="content scaffold-show" role="main">
<h1><g:message code="default.show.label" args="[entityName]"/></h1>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<div class="detail-property-list">
<div class="row">
    <g:set var="counter" value="${0}"></g:set>
    <g:each in="${contractInstance?.properties?.sort()}" var="c">
    %{--status="i">--}%
        <g:if test="${(counter % 3) == 0}">
            </div>
            <div class="row">
        </g:if>
        <span>
        %{--<g:if test="contract.${c.key}.label" >--}%
        %{--<g:if test="${c.key}!='Attachments'">--}%
            <g:if test="${c.key.toString().equals('contractNo') ||
                    c.key.toString().equals('contractPartNo') ||
//                            c.key.toString().equals('contractDate') ||
//                            c.key.toString().equals('allotmentDate') ||
//                            c.key.toString().equals('settlementDeadline') ||
                    c.key.toString().equals('settlementType') ||
                    c.key.toString().equals('buyerBrokerDesc') ||
                    c.key.toString().equals('dealerBrokerDesc') ||
                    c.key.toString().equals('customerDesc') ||
                    c.key.toString().equals('productSymbol') ||
                    c.key.toString().equals('productDesc') ||
                    c.key.toString().equals('totalShipments') ||
                    c.key.toString().equals('price') ||
                    c.key.toString().equals('contractType') ||
//                            c.key.toString().equals('deliveryDate') ||
                    c.key.toString().equals('manufacturerDesc') ||
                    c.key.toString().equals('deliveryPlace') ||
                    c.key.toString().equals('productMainGroup') ||
                    c.key.toString().equals('productGroup') ||
                    c.key.toString().equals('productSubGroup') ||
                    c.key.toString().equals('weight') ||
                    c.key.toString().equals('quantity') ||
                    c.key.toString().equals('buyerBrokerCode') ||
                    c.key.toString().equals('dealerBrokerCode') ||
                    c.key.toString().equals('customerCode') ||
                    c.key.toString().equals('supplierCode') ||
                    c.key.toString().equals('boursePrice') ||
                    c.key.toString().equals('contractID')}">

                <div class="span2"><div class="field-label"><g:message code="contract.${c.key}.label" default=""/></div>
                </div>

                <div class="span2">${c.value}</div>
                <g:set var="counter" value="${counter + 1}"></g:set>
            </g:if>
        %{--<g:else></g:else>--}%
        %{--</g:if>--}%
        %{--</g:if>--}%
            <g:if test="${c.key.toString().equals('contractDate') ||
                    c.key.toString().equals('allotmentDate') ||
                    c.key.toString().equals('settlementDeadline') ||
                    c.key.toString().equals('deliveryDate') ||
                    c.key.toString().equals('settlementDate') ||
                    c.key.toString().equals('releaseDate') ||
                    c.key.toString().equals('importDate')}">
                <div class="span2"><div class="field-label"><g:message code="contract.${c.key}.label" default=""/></div>
                </div>

                <div class="span2"><g:formatDate format="yyyy/MM/dd" date="${c.value}"></g:formatDate></div>
                <g:set var="counter" value="${counter + 1}"></g:set>
            </g:if>

        </span>
    </g:each>
</div>
</div>
%{--<table>--}%
%{--<tr>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="contractNo-label" class="property-label-small"><g:message code="contract.contractNo.label" default="Contract No" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="contractNo-label"><g:fieldValue bean="${contractInstance}" field="contractNo"/></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="contractPartNo-label" class="property-label-small"><g:message code="contract.contractPartNo.label" default="Contract Part No" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="contractPartNo-label"><g:fieldValue bean="${contractInstance}" field="contractPartNo"/></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="contractDate-label" class="property-label-small"><g:message code="contract.contractDate.label" default="Contract Date" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="contractDate-label"><g:formatDate  date="${contractInstance?.contractDate}" /></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--</tr>--}%
%{--------------------------------------------------------------------------------------------------------}%
%{--<tr>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="allotmentDate-label" class="property-label-small"><g:message code="contract.allotmentDate.label" default="Allotment Date" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="allotmentDate-label"><g:formatDate  date="${contractInstance?.allotmentDate}" /></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="settlementDeadline-label" class="property-label-small"><g:message code="contract.settlementDeadline.label" default="Settlement Deadline" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="settlementDeadline-label"><g:formatDate  date="${contractInstance?.settlementDeadline}" /></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="settlementType-label" class="property-label-small"><g:message code="contract.settlementType.label" default="Settlement Type" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="settlementType-label"><g:fieldValue bean="${contractInstance}" field="settlementType"/></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%

%{--</tr>--}%
%{-------------------------------------------------------------------------------------------------------------------}%
%{--<tr>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="buyerBrokerDesc-label" class="property-label-small"><g:message code="contract.buyerBrokerDesc.label" default="Buyer Broker Desc" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="buyerBrokerDesc-label"><g:fieldValue bean="${contractInstance}" field="buyerBrokerDesc"/></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="dealerBrokerDesc-label" class="property-label-small"><g:message code="contract.dealerBrokerDesc.label" default="Dealer Broker Desc" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="dealerBrokerDesc-label"><g:fieldValue bean="${contractInstance}" field="dealerBrokerDesc"/></span>--}%

%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="customerDesc-label" class="property-label-small"><g:message code="contract.customerDesc.label" default="Customer Desc" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="customerDesc-label"><g:fieldValue bean="${contractInstance}" field="customerDesc"/></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--</tr>--}%
%{-------------------------------------------------------------------------------------------------------------------}%
%{--<tr>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="price-label" class="property-label-small"><g:message code="contract.price.label" default="Price" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="price-label"><g:fieldValue bean="${contractInstance}" field="price"/></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="contractType-label" class="property-label-small"><g:message code="contract.contractType.label" default="Contract Type" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="contractType-label"><g:fieldValue bean="${contractInstance}" field="contractType"/></span>--}%

%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="deliveryDate-label" class="property-label-small"><g:message code="contract.deliveryDate.label" default="Delivery Date" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="deliveryDate-label"><g:formatDate date="${contractInstance?.deliveryDate}" /></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--</tr>--}%
%{-------------------------------------------------------------------------------------------------------------------}%
%{--<tr>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="productSymbol-label" class="property-label-small"><g:message code="contract.productSymbol.label" default="product Symbol" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="productSymbol-label"><g:fieldValue bean="${contractInstance}" field="productSymbol"/></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="productDesc-label" class="property-label-small"><g:message code="contract.productDesc.label" default="Product Desc" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="productDesc-label"><g:fieldValue bean="${contractInstance}" field="productDesc"/></span>--}%

%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="totalShipments-label" class="property-label-small"><g:message code="contract.totalShipments.label" default="Total Shipments" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="totalShipments-label"><g:fieldValue bean="${contractInstance}" field="totalShipments" /></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--</tr>--}%

%{-------------------------------------------------------------------------------------------------------------------}%
%{--<tr>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="manufacturerDesc-label" class="property-label-small"><g:message code="contract.manufacturerDesc.label" default="Manufacturer Desc" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="manufacturerDesc-label"><g:fieldValue bean="${contractInstance}" field="manufacturerDesc"/></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="deliveryPlace-label" class="property-label-small"><g:message code="contract.deliveryPlace.label" default="Delivery Place" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="deliveryPlace-label"><g:fieldValue bean="${contractInstance}" field="deliveryPlace"/></span>--}%

%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="productMainGroup-label" class="property-label-small"><g:message code="contract.productMainGroup.label" default="Product Main Group" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="productMainGroup-label"><g:fieldValue bean="${contractInstance}" field="productMainGroup"/></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--</tr>--}%
%{-------------------------------------------------------------------------------------------------------------------}%
%{--<tr>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="productGroup-label" class="property-label-small"><g:message code="contract.productGroup.label" default="Product Group" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="productGroup-label"><g:fieldValue bean="${contractInstance}" field="productGroup"/></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="productSubGroup-label" class="property-label-small"><g:message code="contract.productSubGroup.label" default="Product Sub Group" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="productSubGroup-label"><g:fieldValue bean="${contractInstance}" field="productSubGroup"/></span>--}%

%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="weight-label" class="property-label-small"><g:message code="contract.weight.label" default="Weight" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="weight-label"><g:fieldValue bean="${contractInstance}" field="weight"/></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--</tr>--}%
%{-------------------------------------------------------------------------------------------------------------------}%
%{--<tr>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="quantity-label" class="property-label-small"><g:message code="contract.quantity.label" default="Quantity" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="quantity-label"><g:fieldValue bean="${contractInstance}" field="quantity"/></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="buyerBrokerCode-label" class="property-label-small"><g:message code="contract.buyerBrokerCode.label" default="Buyer Broker Code" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="buyerBrokerCode-label"><g:fieldValue bean="${contractInstance}" field="buyerBrokerCode"/></span>--}%

%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="dealerBrokerCode-label" class="property-label-small"><g:message code="contract.dealerBrokerCode.label" default="Dealer Broker Code" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="dealerBrokerCode-label"><g:fieldValue bean="${contractInstance}" field="dealerBrokerCode"/></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--</tr>--}%
%{-------------------------------------------------------------------------------------------------------------------}%
%{--<tr>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="customerCode-label" class="property-label-small"><g:message code="contract.customerCode.label" default="Customer Code" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="customerCode-label"><g:fieldValue bean="${contractInstance}" field="customerCode"/></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="supplierCode-label" class="property-label-small"><g:message code="contract.supplierCode.label" default="Supplier Code" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="supplierCode-label"><g:fieldValue bean="${contractInstance}" field="supplierCode"/></span>--}%

%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="boursePrice-label" class="property-label-small"><g:message code="contract.boursePrice.label" default="Bourse Price" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="boursePrice-label"><g:fieldValue bean="${contractInstance}" field="boursePrice"/></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--</tr>--}%
%{-------------------------------------------------------------------------------------------------------------------}%
%{--<tr>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="settlementDate-label" class="property-label-small"><g:message code="contract.settlementDate.label" default="Settlement Date" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="settlementDate-label"><g:formatDate date="${contractInstance?.settlementDate}" /></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="contractID-label" class="property-label-small"><g:message code="contract.contractID.label" default="Contract ID" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="contractID-label"><g:fieldValue bean="${contractInstance}" field="contractID"/></span>--}%

%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--<td class="detail-td">--}%
%{--<div class="detail-property-list">--}%

%{--<div class="detailcontain">--}%
%{--<span id="releaseDate-label" class="property-label-small"><g:message code="contract.releaseDate.label" default="Release Date" /></span>--}%

%{--<span class="property-value-small" aria-labelledby="releaseDate-label"><g:formatDate date="${contractInstance?.releaseDate}" /></span>--}%
%{--</div>--}%
%{--</div>--}%
%{--</td>--}%
%{--</tr>--}%
%{--</table>--}%
<table>
    <tr>
        <td class="phase-td"></td>
        <td>
            <div class="phasecontain">
                <table class="pashe-table">
                    <tr>
                        <td class="phase-td-head"><g:message code="phase.phase.label" default="Phase"/></td>
                        <td class="phase-td-head"><g:message code="phase.status.label" default="Status"/></td>
                        <td class="phase-td-head"><g:message code="phase.comment.label" default="Comment"/></td>
                        <td class="phase-td-head"><g:message code="phase.startdate.label" default="Start Date"/></td>
                        <td class="phase-td-head"><g:message code="phase.enddate.label" default="End Date"/></td>
                        %{--<td class="phase-td-head"><g:message code="phase.organization.label" default="Organization"/></td>--}%
                    </tr>
                    <g:each in="${contractInstance.phases?.sort { it.id }}" var="p">
                        <tr>
                            %{--<span class="property-value-small" aria-labelledby="phases-label"><g:link controller="phase" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>--}%
                            <td class="phase-table"><span class="property-value-small">${p.phaseName}</span></td>
                            <td class="phase-table"><span class="property-value-small">${p.statusName}</span></td>
                            <td class="phase-table"><span class="property-value-small">${p.comment}</span></td>
                            <td class="phase-table"><span class="property-value-small"><rg:formatJalaliDate
                                    date="${p.startDate}"/></span></td>
                            <td class="phase-table"><span class="property-value-small"><rg:formatJalaliDate
                                    date="${p.endDate}"/></span></td>
                            %{--<td class="phase-table"><span  class="property-value-small">${p.organization.description}</span></td>--}%
                        </tr>
                    </g:each>
                </table>
            </div>


        </td>
        <td class="phase-td"></td>
    </tr>
</table>

%{--<div class="row">--}%
    %{--<div class=" class="phasecontain"">--}%
    %{--<div class="span1 offset2" ><g:message code="phase.phase.label" default="Phase"/></div>--}%
    %{--<div class="span1" ><g:message code="phase.status.label" default="Status"/></div>--}%
    %{--<div class="span1" ><g:message code="phase.comment.label" default="Comment"/></div>--}%
    %{--<div class="span3" ><g:message code="phase.startdate.label" default="Start Date"/></div>--}%
    %{--<div class="span1" ><g:message code="phase.enddate.label" default="End Date"/></div>--}%
    %{--<div class="span1" ><g:message code="phase.organization.label" default="Organization"/></div>--}%
%{--</div>--}%
%{--</div>--}%


<g:form>
    <fieldset class="buttons">
        <g:hiddenField name="id" value="${contractInstance?.id}"/>
        <g:if test="${limit == "Allowed"}">
            <g:if test="${userType == "Supplier"}">
                <g:link class="edit" action="editAttachmentPhaseDraft" id="${contractInstance?.id}"><g:message
                        code="default.button.edit.label" default="Edit"/></g:link>
            </g:if>
            <g:else>
                <g:link class="edit" action="editAttachmentPhase" id="${contractInstance?.id}"><g:message
                        code="default.button.edit.label" default="Edit"/></g:link>
            </g:else>
        </g:if>
        <g:else>
            <g:if test="${userType == "Supplier"}">
                <g:link class="edit" action="showAttachmentPhaseDraft" id="${contractInstance?.id}"><g:message
                        code="default.button.edit.label" default="Edit"/></g:link>
            </g:if>
            <g:else>
                <g:link class="show" action="showAttachmentPhase" id="${contractInstance?.id}"><g:message
                        code="default.button.show.label" default="Show"/></g:link>
            </g:else>
        </g:else>
        <g:if test="${userType == "dealerBroker"}">
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </g:if>
    </fieldset>
</g:form>
</div>
</body>
</html>
