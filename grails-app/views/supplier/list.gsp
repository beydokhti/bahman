
<%@ page import="bahman.Supplier" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-supplier" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		%{--<div id="list-supplier" class="content scaffold-list" role="main">--}%
			%{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
			%{--<g:if test="${flash.message}">--}%
			%{--<div class="message" role="status">${flash.message}</div>--}%
			%{--</g:if>--}%
			%{--<table>--}%
				%{--<thead>--}%
					%{--<tr>--}%
					%{----}%
						%{--<g:sortableColumn property="username" title="${message(code: 'supplier.username.label', default: 'Username')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="password" title="${message(code: 'supplier.password.label', default: 'Password')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="code" title="${message(code: 'supplier.code.label', default: 'Code')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="description" title="${message(code: 'supplier.description.label', default: 'Description')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="accountExpired" title="${message(code: 'supplier.accountExpired.label', default: 'Account Expired')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="accountLocked" title="${message(code: 'supplier.accountLocked.label', default: 'Account Locked')}" />--}%
					%{----}%
					%{--</tr>--}%
				%{--</thead>--}%
				%{--<tbody>--}%
				%{--<g:each in="${supplierInstanceList}" status="i" var="supplierInstance">--}%
					%{--<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">--}%
					%{----}%
						%{--<td><g:link action="show" id="${supplierInstance.id}">${fieldValue(bean: supplierInstance, field: "username")}</g:link></td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: supplierInstance, field: "password")}</td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: supplierInstance, field: "code")}</td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: supplierInstance, field: "description")}</td>--}%
					%{----}%
						%{--<td><g:formatBoolean boolean="${supplierInstance.accountExpired}" /></td>--}%
					%{----}%
						%{--<td><g:formatBoolean boolean="${supplierInstance.accountLocked}" /></td>--}%
					%{----}%
					%{--</tr>--}%
				%{--</g:each>--}%
				%{--</tbody>--}%
			%{--</table>--}%
			%{--<div class="pagination">--}%
				%{--<g:paginate total="${supplierInstanceTotal}" />--}%
			%{--</div>--}%
		%{--</div>--}%
    <div id="list-supplier" ng-controller="supplierController" class="content scaffold-list" role="main">
        <rg:grid domainClass="${bahman?.Supplier}" caption="لیست بازرگانی">
        %{--<rg:criteria>--}%
        %{--<rg:eq name="supplierCode" value="${"asdasd"}"/>--}%
        %{--</rg:criteria>--}%
        </rg:grid>

        <rg:dialog id="supplier" title="supplier Form">
            <rg:fields bean="${new bahman.Supplier()}"></rg:fields>
            <rg:saveButton domainClass="${bahman?.Supplier}" conroller="supplier" params="[method:'post']"/>
            <rg:cancelButton/>
        </rg:dialog>
        <input type="button" ng-click="openSupplierCreateDialog()" value="create">

    </div>
    </body>
</html>
