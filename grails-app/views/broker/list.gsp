
<%@ page import="bahman.Broker" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'broker.label', default: 'Broker')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-broker" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		%{--<div id="list-broker" class="content scaffold-list" role="main">--}%
			%{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
			%{--<g:if test="${flash.message}">--}%
			%{--<div class="message" role="status">${flash.message}</div>--}%
			%{--</g:if>--}%
			%{--<table>--}%
				%{--<thead>--}%
					%{--<tr>--}%
					%{----}%
						%{--<g:sortableColumn property="username" title="${message(code: 'broker.username.label', default: 'Username')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="password" title="${message(code: 'broker.password.label', default: 'Password')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="code" title="${message(code: 'broker.code.label', default: 'Code')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="description" title="${message(code: 'broker.description.label', default: 'Description')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="brokerType" title="${message(code: 'broker.brokerType.label', default: 'Broker Type')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="accountExpired" title="${message(code: 'broker.accountExpired.label', default: 'Account Expired')}" />--}%
					%{----}%
					%{--</tr>--}%
				%{--</thead>--}%
				%{--<tbody>--}%
				%{--<g:each in="${brokerInstanceList}" status="i" var="brokerInstance">--}%
					%{--<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">--}%
					%{----}%
						%{--<td><g:link action="show" id="${brokerInstance.id}">${fieldValue(bean: brokerInstance, field: "username")}</g:link></td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: brokerInstance, field: "password")}</td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: brokerInstance, field: "code")}</td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: brokerInstance, field: "description")}</td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: brokerInstance, field: "brokerType")}</td>--}%
					%{----}%
						%{--<td><g:formatBoolean boolean="${brokerInstance.accountExpired}" /></td>--}%
					%{----}%
					%{--</tr>--}%
				%{--</g:each>--}%
				%{--</tbody>--}%
			%{--</table>--}%
			%{--<div class="pagination">--}%
				%{--<g:paginate total="${brokerInstanceTotal}" />--}%
			%{--</div>--}%
		%{--</div>--}%
    <div id="list-broker" ng-controller="brokerController" class="content scaffold-list" role="main">
        <rg:grid domainClass="${bahman.Broker}" caption="لیست  کارگزاری ها"
                 columns="[[name:'brokerTypeName'],[name:'username'],[name:'code'],[name:'description'],[name:'enabled']]"
        >
        %{--<rg:criteria>--}%
        %{--<rg:eq name="brokerCode" value="${"asdasd"}"/>--}%
        %{--</rg:criteria>--}%
        </rg:grid>

        <rg:dialog id="broker" title="broker Form">
            <rg:fields bean="${new bahman.Broker()}">
                <rg:modify>
                    <rg:ignoreField field="brokerTypeName"/>
                </rg:modify>
            </rg:fields>
            <rg:saveButton domainClass="${bahman.Broker}" conroller="broker" params="[method:'post']"/>
            <rg:cancelButton/>
        </rg:dialog>
        <input type="button" ng-click="openBrokerCreateDialog()" value="create">

    </div>
	</body>
</html>
