<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <script>
        function printpage()
        {
            window.print()
        }
    </script>
</head>
<body>
<img id="img" src="<g:createLink action="getImage" controller="attachment" id="${attachment?.id}"/>">
%{--alt="" style="max-width: 150px;max-height: 200px">--}%
<input type="button" value="Print this page" onclick="printpage()">

</body>
</html>