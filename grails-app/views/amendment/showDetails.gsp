<%@ page import="bahman.Amendment" %>
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

<div id="show-amendment" class="content scaffold-show" role="main">
    <div class="detail-property-list">
        <div class="row">
            <div class="span2"><div id="contractNo-label" class="field-label"><g:message
                    code="amendment.contractNo.label" default="Contract No"/></div></div>

            <div class="span2"><div class="property-value" aria-labelledby="contractNo-label"><g:fieldValue
                    bean="${amendmentInstance}" field="contractNo"/></div></div>

            <div class="span2"><div id="contractPartNo-label" class="field-label"><g:message
                    code="amendment.contractPartNo.label" default="Contract Part No"/></div></div>

            <div class="span2"><div class="property-value" aria-labelledby="contractPartNo-label"><g:fieldValue
                    bean="${amendmentInstance}" field="contractPartNo"/></div></div>
        </div>

        <div class="row">
            <div class="span2"><div id="amendmentDate-label" class="field-label"><g:message
                    code="amendment.amendmentDate.label" default="Amendment Date"/></div></div>

            <div class="span2"><div class="property-value" aria-labelledby="amendmentDate-label"><rg:formatJalaliDate
                    date="${amendmentInstance?.amendmentDate}"/></div></div>

            <div class="span2"><div id="comment-label" class="field-label"><g:message code="amendment.comment.label"
                                                                                      default="Comment"/></div></div>

            <div class="span2"><div class="property-value" aria-labelledby="comment-label"><g:fieldValue
                    bean="${amendmentInstance}" field="comment"/></div></div>
        </div>

        <div class="row">
            <div class="span2"><div id="amendmentDocument-label" class="field-label"><g:message
                    code="amendment.amendmentDocument.label" default="Amendment Document"/></div></div>
            <a href="<g:createLink action="getDocument" params="[id: amendmentInstance?.id]"/>" target="_blank">
                <g:if test="${amendmentInstance?.contentType?.contains("/") && amendmentInstance?.contentType[0..amendmentInstance?.contentType?.indexOf("/") - 1] == 'image'}">
                    <img src="<g:createLink action="getDocument" params="[id: amendmentInstance?.id]"/>"
                         style="max-width: 100px;">
                </g:if>
                <g:else>
                    ${amendmentInstance?.fileName}
                </g:else>
            </a>
        </div>
    </div>

    <div style="height: 100px"></div>

    <div class="row">
        <div class="row">

            <div class="span2"><div class="phase-td-head"><g:message code="phase.phase.label" default="Phase"/></div>
            </div>

            <div class="span2"><div class="phase-td-head"><g:message code="phase.status.label" default="Status"/></div>
            </div>

            <div class="span2"><div class="phase-td-head"><g:message code="phase.comment.label"
                                                                     default="Comment"/></div></div>

            <div class="span2"><div class="phase-td-head"><g:message code="phase.startdate.label"
                                                                     default="Start Date"/></div></div>

            <div class="span2"><div class="phase-td-head"><g:message code="phase.enddate.label"
                                                                     default="End Date"/></div></div>

            <div class="span1"></div>
        </div>
        <g:each in="${amendmentInstance?.phases?.sort { it.id }}" var="p">
            <div class="row">
                <div class="span1"></div>

                <div class="span2"><span class="property-value-small">${p.phaseName}</span></div>

                <div class="span2"><span class="property-value-small">${p.statusName}</span></div>

                <div class="span2"><span class="property-value-small">${p.comment}&nbsp</span></div>

                <div class="span2"><span class="property-value-small"><rg:formatJalaliDate
                        date="${p.startDate}"/></span>
                </div>

                <div class="span2"><span class="property-value-small"><rg:formatJalaliDate date="${p.endDate}"/></span>
                </div>

                <div class="span1"></div>
            </div>
        </g:each>
    </div>

</div>
</body>
</html>
