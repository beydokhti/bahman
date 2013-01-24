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

<input type="button" value="Print this page" onclick="printpage()">

</body>
</html>