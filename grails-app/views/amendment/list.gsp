<%@ page import="bahman.Amendment" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'amendment.label', default: 'Amendment')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-amendment" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        %{--<li><g:link class="create" action="create"><g:message code="default.new.label"--}%
                                                              %{--args="[entityName]"/></g:link></li>--}%

    </ul>
</div>

%{--<div id="list-amendment" class="content scaffold-list" role="main">--}%
    %{--<h1><g:message code="default.list.label" args="[entityName]"/></h1>--}%
    %{--<g:if test="${flash.message}">--}%
        %{--<div class="message" role="status">${flash.message}</div>--}%
    %{--</g:if>--}%
    %{--<table>--}%
        %{--<thead>--}%
        %{--<tr>--}%

            %{--<g:sortableColumn property="amendmentDate"--}%
                              %{--title="${message(code: 'amendment.amendmentDate.label', default: 'Amendment Date')}"/>--}%

            %{--<g:sortableColumn property="contractNo"--}%
                              %{--title="${message(code: 'amendment.contractNo.label', default: 'Contract No')}"/>--}%

            %{--<g:sortableColumn property="contractPartNo"--}%
                              %{--title="${message(code: 'amendment.contractPartNo.label', default: 'Contract Part No')}"/>--}%

            %{--<g:sortableColumn property="comment"--}%
                              %{--title="${message(code: 'amendment.comment.label', default: 'Comment')}"/>--}%

        %{--</tr>--}%
        %{--</thead>--}%
        %{--<tbody>--}%
        %{--<g:each in="${amendmentInstanceList}" status="i" var="amendmentInstance">--}%
            %{--<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">--}%

                %{--<td><g:link action="show"--}%
                            %{--id="${amendmentInstance.id}">${fieldValue(bean: amendmentInstance, field: "amendmentDate")}</g:link></td>--}%

                %{--<td>${fieldValue(bean: amendmentInstance, field: "contractNo")}</td>--}%

                %{--<td>${fieldValue(bean: amendmentInstance, field: "contractPartNo")}</td>--}%

                %{--<td>${fieldValue(bean: amendmentInstance, field: "comment")}</td>--}%

            %{--</tr>--}%
        %{--</g:each>--}%
        %{--</tbody>--}%
    %{--</table>--}%

    %{--<div class="pagination">--}%
        %{--<g:paginate total="${amendmentInstanceTotal}"/>--}%
    %{--</div>--}%
%{--</div>--}%
<div id="list-amendment" ng-controller="amendmentController" class="content scaffold-list" role="main">
    <rg:grid domainClass="${bahman.Amendment}" caption="لیست اصلاحیه ها">
    <rg:criteria>
    <rg:eq name="contractNo" value="${contractInstance.contractNo}"/>
        <rg:eq name="contractPartNo" value="${contractInstance.contractPartNo}"/>
        <rg:eq name="dealerBroker" value="${userType}"></rg:eq>
    </rg:criteria>
    </rg:grid>

    <rg:dialog id="customer" title="Customer Form">
        <rg:fields bean="${new bahman.Amendment()}"></rg:fields>
        <rg:saveButton domainClass="${bahman.Amendment}" conroller="amendment" params="[method:'post',contractId:contractInstance.id]"/>
        <rg:cancelButton/>
    </rg:dialog>
    <input type="button" ng-click="openAmendmentCreateDialog()" value="create">

</body>
</html>
