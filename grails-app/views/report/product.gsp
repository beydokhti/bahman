<%--
  Created by IntelliJ IDEA.
  User: Mary
  Date: 1/29/13
  Time: 10:36 PM
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
<rg:criteria inline='true' >
    <rg:like name="productMainGroup"/>
    <rg:like name="productGroup"/>
    <rg:like name="productSymbol"/>
    <rg:like name="productDesc"/>
    <rg:filterGrid grid="ContractGrid" label="${message(code: "search")}"/>
</rg:criteria>
<rg:grid domainClass="${bahman.Contract}"
         columns="[[name: 'prevStatus' , expression: 'g.message([code: obj.prevStatus])'], [name: 'contractNo'], [name: 'contractPartNo'], [name: 'buyerBrokerDesc'], [name: 'dealerBrokerDesc'], [name: 'customerDesc']]">
    <rg:criteria>

    </rg:criteria>
</rg:grid>

</body>
</html>