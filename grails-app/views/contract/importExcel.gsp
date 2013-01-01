<%--
  Created by IntelliJ IDEA.
  User: Mary
  Date: 1/1/13
  Time: 9:28 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title></title>
</head>
<body>
<g:form action="upload" method="post" enctype="multipart/form-data">
    <label for="file">File:</label>
    <input type="file" name="file" id="file"/>
    <input class="save" type="submit" value="Upload"/>
</g:form>

</body>
</html>