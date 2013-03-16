
<%@ page import="bahman.Customer" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		%{--<div id="list-customer" class="content scaffold-list" role="main">--}%
			%{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
			%{--<g:if test="${flash.message}">--}%
			%{--<div class="message" role="status">${flash.message}</div>--}%
			%{--</g:if>--}%
			%{--<table>--}%
				%{--<thead>--}%
					%{--<tr>--}%
					%{----}%
						%{--<g:sortableColumn property="username" title="${message(code: 'customer.username.label', default: 'Username')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="password" title="${message(code: 'customer.password.label', default: 'Password')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="code" title="${message(code: 'customer.code.label', default: 'Code')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="description" title="${message(code: 'customer.description.label', default: 'Description')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="mobileNo" title="${message(code: 'customer.mobileNo.label', default: 'Mobile No')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="accountExpired" title="${message(code: 'customer.accountExpired.label', default: 'Account Expired')}" />--}%
					%{----}%
					%{--</tr>--}%
				%{--</thead>--}%
				%{--<tbody>--}%
				%{--<g:each in="${customerInstanceList}" status="i" var="customerInstance">--}%
					%{--<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">--}%
					%{----}%
						%{--<td><g:link action="show" id="${customerInstance.id}">${fieldValue(bean: customerInstance, field: "username")}</g:link></td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: customerInstance, field: "password")}</td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: customerInstance, field: "code")}</td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: customerInstance, field: "description")}</td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: customerInstance, field: "mobileNo")}</td>--}%
					%{----}%
						%{--<td><g:formatBoolean boolean="${customerInstance.accountExpired}" /></td>--}%
					%{----}%
					%{--</tr>--}%
				%{--</g:each>--}%
				%{--</tbody>--}%
			%{--</table>--}%
			%{--<div class="pagination">--}%
				%{--<g:paginate total="${customerInstanceTotal}" />--}%
			%{--</div>--}%
		%{--</div>--}%
    <div id="list-customer" ng-controller="customerController" class="content scaffold-list" role="main">
        <rg:criteria inline='true'>
            <rg:like name="username" />
            <rg:like name="code"/>
            <rg:like name="description"/>
            <rg:like name="mobileNo"/>
            <rg:filterGrid grid="CustomerGrid" />
        </rg:criteria>

        <rg:grid domainClass="${bahman.Customer}" caption="لیست مشتری">
        </rg:grid>

        <rg:dialog id="customer" title="Customer Form">
            <rg:fields bean="${new bahman.Customer()}"></rg:fields>
            <rg:saveButton domainClass="${bahman.Customer}" conroller="customer" params="[method:'post']"/>
            <rg:cancelButton/>
        </rg:dialog>
        <input type="button" ng-click="openCustomerCreateDialog()" value="create">

    </div>

	</body>
</html>
