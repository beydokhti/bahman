
<%@ page import="bahman.Manufacturer" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'manufacturer.label', default: 'Manufacturer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-manufacturer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
                <li><g:link class="list" action="userAdmin" controller="userAdmin"><g:message code="userAdmin" /></g:link></li>
			</ul>
		</div>
		%{--<div id="list-manufacturer" class="content scaffold-list" role="main">--}%
			%{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
			%{--<g:if test="${flash.message}">--}%
			%{--<div class="message" role="status">${flash.message}</div>--}%
			%{--</g:if>--}%
			%{--<table>--}%
				%{--<thead>--}%
					%{--<tr>--}%
					%{----}%
						%{--<g:sortableColumn property="username" title="${message(code: 'manufacturer.username.label', default: 'Username')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="password" title="${message(code: 'manufacturer.password.label', default: 'Password')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="code" title="${message(code: 'manufacturer.code.label', default: 'Code')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="description" title="${message(code: 'manufacturer.description.label', default: 'Description')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="accountExpired" title="${message(code: 'manufacturer.accountExpired.label', default: 'Account Expired')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="accountLocked" title="${message(code: 'manufacturer.accountLocked.label', default: 'Account Locked')}" />--}%
					%{----}%
					%{--</tr>--}%
				%{--</thead>--}%
				%{--<tbody>--}%
				%{--<g:each in="${manufacturerInstanceList}" status="i" var="manufacturerInstance">--}%
					%{--<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">--}%
					%{----}%
						%{--<td><g:link action="show" id="${manufacturerInstance.id}">${fieldValue(bean: manufacturerInstance, field: "username")}</g:link></td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: manufacturerInstance, field: "password")}</td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: manufacturerInstance, field: "code")}</td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: manufacturerInstance, field: "description")}</td>--}%
					%{----}%
						%{--<td><g:formatBoolean boolean="${manufacturerInstance.accountExpired}" /></td>--}%
					%{----}%
						%{--<td><g:formatBoolean boolean="${manufacturerInstance.accountLocked}" /></td>--}%
					%{----}%
					%{--</tr>--}%
				%{--</g:each>--}%
				%{--</tbody>--}%
			%{--</table>--}%
			%{--<div class="pagination">--}%
				%{--<g:paginate total="${manufacturerInstanceTotal}" />--}%
			%{--</div>--}%
		%{--</div>--}%
    <div id="list-manufacturer" ng-controller="manufacturerController" class="content scaffold-list" role="main">
        <rg:grid domainClass="${bahman?.Manufacturer}" caption="لیست تولید کننده">
        %{--<rg:criteria>--}%
        %{--<rg:eq name="manufacturerCode" value="${"asdasd"}"/>--}%
        %{--</rg:criteria>--}%
        </rg:grid>

        <rg:dialog id="manufacturer" title="Manufacturer Form">
            <rg:fields bean="${new bahman.Manufacturer()}"></rg:fields>
            <rg:saveButton domainClass="${bahman?.Manufacturer}" conroller="manufacturer" params="[method:'post']"/>
            <rg:cancelButton/>
        </rg:dialog>
        <input type="button" ng-click="openManufacturerCreateDialog()" value="create">

    </div>    
	</body>
</html>
