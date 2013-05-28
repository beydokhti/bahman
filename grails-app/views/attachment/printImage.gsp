<%@ page import="bahman.Attachment" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="printLayout">
    <g:set var="entityName" value="${message(code: 'attachment.label', default: 'Attachment')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<script>
    var printpage = function () {
        $(this).remove();
        window.print();
    }
</script>
<img id="img" src="<g:createLink action="getImage" controller="attachment" id="${attachment?.id}"/>">


<div class="row">
    <div class="span2 offset6"><input id="printButton" type="button" value="${message(code:'index.Print.label')}"></div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#printButton").on("click", printpage)
    })
</script>
</div>
</body>
</html>