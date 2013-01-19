    <!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>

    <script language="JavaScript" type="text/javascript">
        function HandleBrowseClick()
        {
            var fileinput = document.getElementById("file");
            fileinput.click();
        }
        function Handlechange()
        {
            var fileinput = document.getElementById("file");
            var textinput = document.getElementById("filename");
            textinput.value = fileinput.value;
        }
    </script>

</head>
<body>


<div id="list-contract"  class="content scaffold-list" role="main">
<br>
<g:form action="upload" method="post" enctype="multipart/form-data" style="margin-top: 100px">
    <span class="btn btn-file">
    <g:message code="importexcel.file.label" default="Management System"/>
    <input type="file" name="file" id="file" style="display: none" onChange="Handlechange();"/>
    <input type="text" id="filename" readonly="true" style="margin-top: 19px ; width:300px"/>
    <input type="button" value="<g:message code="click-to-browse" />" id="fakeBrowse" onclick="HandleBrowseClick();">
    <input class="save" type="submit" value="<g:message code="send-file" />"/>
    </span>
    %{--<input type="file" id="browse" name="fileupload" style="display: none" onChange="Handlechange();"/>--}%


</g:form>
</div>
</body>
</html>