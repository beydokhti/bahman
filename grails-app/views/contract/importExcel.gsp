<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>

    %{--<script language="JavaScript" type="text/javascript">--}%
        %{--function HandleBrowseClick() {--}%
            %{--var fileinput = document.getElementById("file");--}%
            %{--fileinput.click();--}%
        %{--}--}%
        %{--function Handlechange() {--}%
            %{--var fileinput = document.getElementById("file");--}%
            %{--$(fileinput).css('z-index',-100);--}%
            %{--var textinput = document.getElementById("filename");--}%
            %{--textinput.value = fileinput.value;--}%
        %{--}--}%
    %{--</script>--}%
    %{--<style>--}%
    %{--.fake_file_input {--}%
        %{--background-color: #F9F9F9;--}%
        %{--border: 1px solid #DCDCDC;--}%
        %{--border-radius: 6px 6px 6px 6px;--}%
        %{--box-shadow: 0 1px 0 0 #FFFFFF inset;--}%
        %{--color: #666666;--}%
        %{--display: inline-block;--}%
        %{--font-family: arial;--}%
        %{--font-size: 12px;--}%
        %{--font-weight: bold;--}%
        %{--margin-top: 10px;--}%
        %{--padding: 3px 0px;--}%
        %{--text-decoration: none;--}%
        %{--text-shadow: 1px 1px 0 #FFFFFF;--}%
        %{--cursor: pointer;--}%
        %{--width: 150px;--}%
        %{--height: 23px;--}%
        %{--overflow: hidden;--}%
        %{--vertical-align: inherit;--}%
        %{--position: relative;--}%
        %{--display: inline-block;--}%
        %{--z-index: 100;--}%
        %{--*display: inline;--}%
        %{--*zoom: 1;--}%
    %{--}--}%

    %{--.fake_file_input input {--}%
        %{--position: absolute;--}%
        %{--top: 0;--}%
        %{--left: -99999px;--}%
        %{--opacity: 0;--}%
        %{--filter: alpha(opacity = 0);--}%
        %{---ms-filter: 'progid:DXImageTransform.Microsoft.Alpha(Opacity=0)';--}%
    %{--}--}%

        %{--/*--}%
        %{--Hack for Firefox:--}%
        %{--*/--}%
    %{--@-moz-document url-prefix() {--}%
        %{--.fake_file_input input {--}%
            %{--left: 0;--}%
            %{--right: 0;--}%
            %{--bottom: 0;--}%
            %{--width: 150px;--}%
            %{--height: 30px;--}%
        %{--}--}%
    %{--}--}%
        %{--/*--}%
        %{--Degrade for IE6:--}%
        %{--*/--}%
    %{--* html .fake_file_input {--}%
        %{--background: none;--}%
        %{--cursor: default;--}%
        %{--overflow: visible;--}%
        %{--position: static;--}%
        %{--width: auto;--}%
        %{--height: auto;--}%
    %{--}--}%

    %{--* html .fake_file_input input {--}%
        %{--position: static;--}%
        %{--filter: alpha(opacity = 100);--}%
    %{--}--}%
    %{--</style>--}%
    <style>
        #submitId {
            margin-top: 0px;
        }
    </style>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>

<div id="list-contract" class="content scaffold-list" role="main">
    <br>
    <g:form action="upload" method="post" enctype="multipart/form-data" style="margin-top: 100px">
        <span class="btn btn-file">
            <g:message code="importexcel.file.label" default="Management System"/>
            %{--<input type="text" id="filename" readonly="true" style="margin-top: 19px ; width:300px"/>--}%
            %{--<label for="file" class="fake_file_input">--}%
                %{--<g:message code="click-to-browse"/>--}%
                %{--<input type="file" name="file" id="file" onchange="Handlechange()"/>--}%
            %{--</label>--}%
            <input type="file" name="file" id="file" />
            <input class="save" type="submit" id="submitId" value="<g:message code="send-file"/>"/>
        </span>
    </g:form>
</div>
</body>
</html>