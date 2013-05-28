<%@ page import="bahman.Contract" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="printLayout">
    <g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<script>
    var printpage = function () {
        $(this).remove();
        window.print();
    }
</script>

<br>

<div class="row" style="font-weight: bold"><g:message code="contract.details.label"/></div>
<br>

<div id="show-contract" class="content scaffold-show">

    <div class="row">

        <div class="span4"><g:message code="contract.contractDate.label" default=""/>:
        <rg:formatJalaliDate date="${contractInstance.contractDate}"></rg:formatJalaliDate>
        </div>

        <div class="span4"><g:message code="contract.contractPartNo.label" default=""/>:
        ${contractInstance.contractPartNo}
        </div>

        <div class="span4"><g:message code="contract.contractNo.label" default=""/>:
        ${contractInstance.contractNo}
        </div>

    </div>

    <div class="row">
        <div class="span4"><g:message code="contract.settlementType.label" default=""/>:
        ${contractInstance.settlementType}
        </div>

        <div class="span4"><g:message code="contract.customerDesc.label" default=""/>:
        ${contractInstance.customerDesc}
        </div>

        <div class="span4"><g:message code="contract.productSymbol.label" default=""/>:
        ${contractInstance.productSymbol}
        </div>

    </div>

    <div class="row">
        <div class="span4"><g:message code="contract.price.label" default=""/>:
        ${contractInstance.price}
        </div>

        <div class="span4"><g:message code="contract.freight.label" default=""/>:
        ${contractInstance.freight}
        </div>

        <div class="span4"><g:message code="contract.contractType.label" default=""/>:
        ${contractInstance.contractType}
        </div>

    </div>

    <div class="row">
        <div class="span4"><g:message code="contract.deliveryPlace.label" default=""/>:
        ${contractInstance.deliveryPlace}
        </div>

        <div class="span4"><g:message code="contract.settlementDeadline.label" default=""/>:
        <rg:formatJalaliDate date="${contractInstance.settlementDeadline}"></rg:formatJalaliDate>
        </div>

        <div class="span4"><g:message code="contract.deliveryDate.label" default=""/>:
        <rg:formatJalaliDate date="${contractInstance.deliveryDate}"></rg:formatJalaliDate>
        </div>
    </div>

    <div class="row">
        <div class="span4"><g:message code="contract.settlementDate.label" default=""/>:
        ${contractInstance.settlementDate}
        </div>

        <div class="span4"><g:message code="contract.releaseDate.label" default=""/>:
        <rg:formatJalaliDate date="${contractInstance.releaseDate}"></rg:formatJalaliDate>
        </div>

        <div class="span4"><g:message code="contract.draft.label" default=""/>:
        ${contractInstance?.amendments?.contractNo}
        </div>

    </div>

</div>



<br>

<div class="row" style="font-weight: bold"><g:message code="customer.details.label"/></div>
<br>

<div class="row">
    <g:if test="${customer.nId}">
        <div class="span4"><g:message code="customer.nId.label" default=""/>:
        ${customer.nId}
        </div>
    </g:if>
    <div class="span4"><g:message code="customer.description.label" default=""/>:
    ${customer.description}
    </div>

    <div class="span4"><g:message code="customer.code.label" default=""/>:
    ${customer.code}
    </div>

</div>

<div class="row">
    <g:if test="${customer.businessId}">
        <div class="span4"><g:message code="customer.businessId.label" default=""/>:
        ${customer.businessId}
        </div>
    </g:if>
    <g:if test="${customer.address}">
        <div class="span4"><g:message code="customer.address.label" default=""/>:
        ${customer.address}
        </div>
    </g:if>

    <g:if test="${customer.postalCode}">
        <div class="span4"><g:message code="customer.postalCode.label" default=""/>:
        ${customer.postalCode}
        </div>
    </g:if>
</div>

<div class="row">
    <g:if test="${customer.phoneNo}">
        <div class="span4"><g:message code="customer.phoneNo.label" default=""/>:
        ${customer.phoneNo}
        </div>
    </g:if>

    <g:if test="${customer.mobileNo}">
        <div class="span4"><g:message code="customer.mobileNo.label" default=""/>:
        ${customer.mobileNo}
        </div>
    </g:if>
</div>

<br>

<div class="row" style="font-weight: bold"><g:message code="accounting.details.label"/></div>
<br>

<div class="row">
    <div class="span4"><g:message code=".contractValue.label"
                                  default=""/>
    ${contractValue}
    </div>

    <div class="span4"><g:message code="accounting.addedTax.label"
                                  default=""/>
    ${addedTax}
    </div>

    <div class="span4"><g:message code="accounting.fees.label"
                                  default=""/>
    ${fees}
    </div>

</div>

<br>
<br>

<div class="row">
    <div class="span2 offset6"><input id="printButton" type="button" value="${message(code:'index.Print.label')}"></div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#printButton").on("click", printpage)
    })
</script>
</div>
</body>
</html>