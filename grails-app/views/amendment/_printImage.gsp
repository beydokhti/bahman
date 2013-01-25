
<%@ page import="bahman.Amendment" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'amendment.label', default: 'Amendment')}" />
    <title><g:message code="default.print.label" args="[entityName]" /></title>
    <script>
        function printpage()
        {
            window.print()
        }
    </script>
</head>
<body>
<g:message code='amendment.label' default='Amendment'></g:message>
<a href="#show-amendment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<img id="img" src="<g:createLink action="getImage" controller="amendment" id="${amendment?.id}"/>">
%{--alt="" style="max-width: 150px;max-height: 200px">--}%
<input type="button" value="Print this page" onclick="printpage()">
</div>
</body>
</html>
