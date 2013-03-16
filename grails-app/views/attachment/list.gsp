
<%@ page import="bahman.Attachment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'attachment.label', default: 'Attachment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-attachment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="list-attachment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'attachment.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="document" title="${message(code: 'attachment.document.label', default: 'Document')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'attachment.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="uploadDate" title="${message(code: 'attachment.uploadDate.label', default: 'Upload Date')}" />
					
						<th><g:message code="attachment.responsible.label" default="Responsible" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${attachmentInstanceList}" status="i" var="attachmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${attachmentInstance.id}">${fieldValue(bean: attachmentInstance, field: "description")}</g:link></td>
					
						<td><img src="<g:createLink action="getImage" params="[id:attachmentInstance?.id]" />" width="100"></td>
					
						<td>${fieldValue(bean: attachmentInstance, field: "status")}</td>

						<td><rg:formatJalaliDate date="${attachmentInstance.uploadDate}" /></td>
					
						<td>${fieldValue(bean: attachmentInstance, field: "responsible")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${attachmentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
