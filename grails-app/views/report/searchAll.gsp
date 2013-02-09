<%--
  Created by IntelliJ IDEA.
  User: Mary
  Date: 2/2/13
  Time: 12:42 PM
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
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>
<%@ page import="bahman.Contract" %>

<g:form action="showSearchAllReport" controller="report">
    <div class="row">

        <div class="fieldcontain">

            <div class="span2">
                <g:message code="contract.contractNo.label" default="Contract No"/>
            </div>

            <div class="span3">
                <g:textField name="contractNoFrom"/>
            </div>

            <div class="span1">
                <g:message code="report.to.label" style="text-align: center"/>
            </div>

            <div class="span3">
                <g:textField name="contractNoTo"/>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="fieldcontain">
            <div class="span2">
                <g:message code="contract.contractPartNo.label" default="Contract Part No"/>
            </div>

            <div class="span3">
                <g:textField name="contractPartNoFrom"/>
            </div>

            <div class="span1">
                <g:message code="report.to.label" style="text-align: center"/>
            </div>

            <div class="span1">
                <g:textField name="contractPartNoTo"/>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="fieldcontain">
            <div class="span2">
                <g:message code="contract.contractDate.label" default="Contract Date"/>

            </div>

            <div class="span3">
                <rg:datePicker name="contractDateFrom" precision="day"/>
            </div>

            <div class="span1">
                <g:message code="report.to.label" style="text-align: center"/>
            </div>

            <div class="span3">
                <rg:datePicker name="contractDateTo" precision="day"/>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="fieldcontain">
            <div class="span2">
                <g:message code="contract.buyerBrokerCode.label" default="Buyer Broker"/>

            </div>

            <div class="span3">
                <g:textField name="buyerBrokerCodeFrom"/>
            </div>

            <div class="span1">
                <g:message code="report.to.label" style="text-align: center"/>
            </div>

            <div class="span3">
                <g:textField name="buyerBrokerCodeTo"/>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="fieldcontain">
            <div class="span2">
                <g:message code="contract.customerCode.label" default="Customer Code"/>

            </div>

            <div class="span3">
                <g:textField name="customerCodeFrom"/>
            </div>

            <div class="span1">
                <g:message code="report.to.label" style="text-align: center"/>
            </div>

            <div class="span3">
                <g:textField name="customerCodeTo"/>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="fieldcontain">
            <div class="span2">
                <g:message code="contract.supplierCode.label" default="Supplier Code"/>

            </div>

            <div class="span3">
                <g:textField name="supplierCodeFrom"/>
            </div>

            <div class="span1">
                <g:message code="report.to.label" style="text-align: center"/>
            </div>

            <div class="span3">
                <g:textField name="supplierCodeTo"/>
            </div>
        </div>
    </div>
    <g:submitButton name="showReport" class="show" value="${message(code: 'report.show.label', default: 'Show')}"/>
%{--<g:submitButton name="exportExcel" class="show" value="${message(code: 'report.export.excel.label', default: 'Export Excel')}" />--}%
</g:form>
<rg:grid domainClass="${bahman.Contract}" maxColumns="30" showFirstColumn="false" footerRow="true" showAllRows="true"
         width="2000px"
         source="${[service: "searchAllReport", method: "report",
                 params: [contractNoFrom: "${reportParams.contractNoFrom}", contractNoTo: "${reportParams.contractNoTo}",
                         contractPartNoFrom: "${reportParams.contractPartNoFrom}", contractPartNoTo: "${reportParams.contractPartNoTo}",
                         contractDateFrom: "${reportParams.contractDateFrom}", contractDateTo: "${reportParams.contractDateTo}",
                         buyerBrokerCodeFrom: "${reportParams.buyerBrokerCodeFrom}", buyerBrokerCodeTo: "${reportParams.buyerBrokerCodeTo}",
                         customerCodeFrom:"${reportParams.customerCodeFrom}",customerCodeTo:"${reportParams.customerCodeTo}"]]}"/>

</body>
</html>