
<%@ page import="bahman.Draft" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'draft.label', default: 'Draft')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-draft" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-draft" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'draft.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="document" title="${message(code: 'draft.document.label', default: 'Document')}" />
					
						<g:sortableColumn property="uploadDate" title="${message(code: 'draft.uploadDate.label', default: 'Upload Date')}" />
					
						<th><g:message code="draft.responsible.label" default="Responsible" /></th>
					
						<g:sortableColumn property="fileName" title="${message(code: 'draft.fileName.label', default: 'File Name')}" />
					
						<g:sortableColumn property="contentType" title="${message(code: 'draft.contentType.label', default: 'Content Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${draftInstanceList}" status="i" var="draftInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${draftInstance.id}">${fieldValue(bean: draftInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: draftInstance, field: "document")}</td>
					
						<td><g:formatDate date="${draftInstance.uploadDate}" /></td>
					
						<td>${fieldValue(bean: draftInstance, field: "responsible")}</td>
					
						<td>${fieldValue(bean: draftInstance, field: "fileName")}</td>
					
						<td>${fieldValue(bean: draftInstance, field: "contentType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${draftInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
