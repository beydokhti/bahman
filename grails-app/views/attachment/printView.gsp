
<%@ page import="bahman.Attachment" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'attachment.label', default: 'Attachment')}" />
    <title><g:message code="default.print.label" args="[entityName]" /></title>
    <script>
        function printpage()
        {
            window.print()
        }
    </script>
</head>
<body>
<a href="#show-attachment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<img id="img" src="<g:createLink action="getImage" controller="attachment" id="${attachment?.id}"/>">
%{--alt="" style="max-width: 150px;max-height: 200px">--}%
<input type="button" value="Print this page" onclick="printpage()">
</div>
</body>
</html>
