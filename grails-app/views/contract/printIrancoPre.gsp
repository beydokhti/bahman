<%@ page import="bahman.Contract" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    
</head>

<body>
<a href="#show-contract" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               %{--default="Skip to content&hellip;"/></a>

<div id="show-contract" class="content scaffold-show" role="main">
<g:form action="printIranco">
    <g:hiddenField name="id" value="${contract.id}"/>
    <table>
        <tr>
            <td>تاریخ:</td>
            <td><g:textField name="letterDate" value="${letterDate}"/></td>
        </tr>
        <tr>
            <td>شماره نامه:</td>
            <td><g:textField name="letterNo" value="${letterNo}"/></td>
        </tr>
    </table>
    <g:submitButton name="submit" value="print"/>
</g:form>
</div>
</body>
</html>
