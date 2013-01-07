<%--
  Created by IntelliJ IDEA.
  User: Mary
  Date: 1/7/13
  Time: 9:25 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title></title>
    <g:javascript src="publicUtility.js"></g:javascript>
    %{--<script type="text/javascript">--}%

    %{--function addCustomer() {--}%
        %{--loadOverlayAttachmentPhase('<g:createLink action="form" controller="customer" />',--}%
                %{--'<g:createLink action="save" controller="customer"/>',--}%
                %{--function () {--}%
                    %{--window.location = "<g:createLink controller="customer" action="list"/>"--}%
                %{--}, undefined, {width:400})--}%
    %{--}--}%
    %{--</script>--}%

</head>
<body>
<div class="row">
    <div class="span3">

    </div>
    <div class="span9">
        <div style="height: 70px"> </div>

        <div style="height: 150px">
            <a href="<g:createLink action="list" controller="customer" />">
                <img src="${resource(dir:"images",file:"user.png" )} ">
                <g:message code="customer.list.label" default="Dashboard"/>
            </a>
        </div>

    </div>
</body>
</html>