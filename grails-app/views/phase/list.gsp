
<%@ page import="bahman.Phase" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'phase.label', default: 'Phase')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-phase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="list-phase" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="status" title="${message(code: 'phase.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="phase" title="${message(code: 'phase.phase.label', default: 'Phase')}" />
					
						<g:sortableColumn property="comment" title="${message(code: 'phase.comment.label', default: 'Comment')}" />
					
						<g:sortableColumn property="startDate" title="${message(code: 'phase.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'phase.endDate.label', default: 'End Date')}" />
					
						<th><g:message code="phase.organization.label" default="Organization" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${phaseInstanceList}" status="i" var="phaseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${phaseInstance.id}">${fieldValue(bean: phaseInstance, field: "status")}</g:link></td>
					
						<td>${fieldValue(bean: phaseInstance, field: "phase")}</td>
					
						<td>${fieldValue(bean: phaseInstance, field: "comment")}</td>
					
						<td><rg:formatJalaliDate date="${phaseInstance.startDate}" /></td>
					
						<td><rg:formatJalaliDate date="${phaseInstance.endDate}" /></td>
					
						<td>${fieldValue(bean: phaseInstance, field: "organization")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${phaseInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
