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
    <g:set var="entityName" value="${message(code: 'report.label', default: 'Report')}"/>
    <title><g:message code="report.label" args="[entityName]"/></title>
</head>

<body>
<div class="row">
    <div class="span3">

    </div>

    <div class="span9">
        <div style="height: 70px"> </div>

        <div style="height: 150px">
            <a href="<g:createLink action="contractPhase" controller="contractReport"/>">
                <img src="${resource(dir: "images", file: "search.png")} ">
                <g:message code="report.contract.phase.label" default="Search Contract"/>
            </a>
        </div>
        %{--<div style="height: 150px">--}%
            %{--<a href="<g:createLink action="product" controller="report"/>">--}%
                %{--<img src="${resource(dir: "images", file: "search.png")} ">--}%
                %{--<g:message code="report.product.label" default="Search Product"/>--}%
            %{--</a>--}%
        %{--</div>--}%

        %{--<div style="height: 150px">--}%
            %{--<a href="<g:createLink action="searchAll" controller="report"/>">--}%
                %{--<img src="${resource(dir: "images", file: "search.png")} ">--}%
                %{--<g:message code="report.searchAll.label" default="Search "/>--}%
            %{--</a>--}%
        %{--</div>--}%
    </div>
</div>
</body>
</html>