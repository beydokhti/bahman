<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

<div id="list-contract"  class="content scaffold-list" role="main">
<br>
<g:form action="upload" method="post" enctype="multipart/form-data">
    <label for="file">File:</label>
    <input type="file" name="file" id="file"/>
    <input class="save" type="submit" value="Upload"/>
</g:form>
</div>
</body>
</html>