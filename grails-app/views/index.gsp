<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Novin Kala</title>
    <style type="text/css" media="screen">
    #status {
        background-color: #eee;
        border: .2em solid #fff;
        margin: 2em 2em 1em;
        padding: 1em;
        width: 12em;
        float: left;
        -moz-box-shadow: 0px 0px 1.25em #ccc;
        -webkit-box-shadow: 0px 0px 1.25em #ccc;
        box-shadow: 0px 0px 1.25em #ccc;
        -moz-border-radius: 0.6em;
        -webkit-border-radius: 0.6em;
        border-radius: 0.6em;
    }

    .ie6 #status {
        display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
    }

    #status ul {
        font-size: 0.9em;
        list-style-type: none;
        margin-bottom: 0.6em;
        padding: 0;
    }

    #status li {
        line-height: 1.3;
    }

    #status h1 {
        text-transform: uppercase;
        font-size: 1.1em;
        margin: 0 0 0.3em;
    }

    #page-body {
        margin: 2em 1em 1.25em 18em;
    }

    h2 {
        margin-top: 1em;
        margin-bottom: 0.3em;
        font-size: 1em;
    }

    p {
        line-height: 1.5;
        margin: 0.25em 0;
    }

    #controller-list ul {
        list-style-position: inside;
    }

    #controller-list li {
        line-height: 1.3;
        list-style-position: inside;
        margin: 0.25em 0;
    }

    @media screen and (max-width: 480px) {
        #status {
            display: none;
        }

        #page-body {
            margin: 0 1em 1em;
        }

        #page-body h1 {
            margin-top: 0;
        }
    }
    </style>
</head>

<body>
<div class="row">
    <div class="span3">
        %{--bs-docs-sidebar">--}%
        %{--<ul class="nav nav-list bs-docs-sidenav">--}%
        %{--<li class="">--}%
        %{--<a href="<g:createLink action="importExcel" controller="contract"/>">--}%
        %{--<i class="icon-chevron-right"></i>--}%
        %{--<g:message code="index.import" default="Import" />--}%
        %{--</a>--}%

        %{--</li>--}%
        %{--<li class="">--}%
        %{--<a href="<g:createLink action="list" controller="contract" />"--}%
        %{--<i class="icon-chevron-right"></i>--}%
        %{--<g:message code="index.dashboard" default="Dashboard" />--}%
        %{--</a>--}%
        %{--</li>--}%
        %{--</ul>--}%
    </div>

    %{--<div class="nav" role="navigation">--}%
        %{--<ul>--}%
            %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
            %{--<li><g:link class="list" action="index" controller="logout"><g:message code="default.logut.label"--}%
                                                                                   %{--args="[entityName]"/></g:link></li>--}%
            %{--<sec:ifAllGranted roles="Customer">--}%
                %{--<g:link controller="customer" action="changePassword"><g:message--}%
                        %{--code="customer.change.password.label"></g:message></g:link>--}%
            %{--</sec:ifAllGranted>--}%
            %{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
        %{--</ul>--}%
    %{--</div>--}%

    <div class="span9">
        %{--<div class="row">--}%
        %{--<div class="span5">--}%
        <div style="height: 70px"></div>

        <sec:ifAllGranted roles="DealerBroker">
            <div style="height: 150px">
                <a href="<g:createLink action="importExcel" controller="contract"/>">
                    <img src="${resource(dir: "images", file: "import.png")} ">
                    <g:message code="index.import.label" default="Import"/>
                </a>
            </div>
        </sec:ifAllGranted>
        <sec:ifAnyGranted roles="DealerBroker,Manufacturer,Supplier,BuyerBroker,Customer">
            <div style="height: 150px">
                <a href="<g:createLink action="list" controller="contract"/>">
                    <img src="${resource(dir: "images", file: "pencil.png")} ">
                    <g:message code="index.list.label" default="Dashboard"/>
                </a>
            </div>
            <div style="height: 150px">
                <a href="<g:createLink action="report" controller="report"/>">
                    <img src="${resource(dir: "images", file: "report.png")} ">
                    <g:message code="index.report.label" default="Report"/>
                </a>
            </div>
        </sec:ifAnyGranted>
        <div class="span5">
        %{--<div style="height: 70px"></div>--}%
            <sec:ifAllGranted roles="Admin">
                <div style="height: 150px">
                    <a href="<g:createLink action="useradmin" controller="userAdmin"/>">
                        <img src="${resource(dir: "images", file: "userAdmin.png")} ">
                        <g:message code="index.userAdmin.label" default="User Admin"/>
                    </a>
                </div>
            </sec:ifAllGranted>
        %{--</div>--}%
        %{--</div>--}%

        </div>

        %{--<div><p><g:link action="importExcel" controller="contract">Import Contract</g:link></p></div>--}%

        %{--<div><p><g:link action="list" controller="contract">Dashboards</g:link></p></div>--}%

</body>
</html>
