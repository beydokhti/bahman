
<%@ page import="bahman.Attachment" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'attachment.label', default: 'Attachment')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div id="list-attachment" class="content scaffold-list" role="main">

        <img id="attachmentImg"  src="<g:createLink action="getImage" params="[id:attachmentId]" />" width="150">
</div>
</body>
</html>
