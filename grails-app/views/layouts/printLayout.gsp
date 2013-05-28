<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js" ng-app><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(plugin: 'rapid-grails', dir: 'css', file: 'jquery-ui-rtl.css')}"
          type="text/css">
    <r:require modules="bootstrap"/>
    <ckeditor:resources/>
    <g:javascript plugin="rapid-grails" src="angular.min.js"></g:javascript>

    <g:javascript library="jquery"></g:javascript>

    <r:layoutResources/>
    <jqui:resources theme="cobalt"></jqui:resources>

    %{--<g:javascript plugin="rapid-grails" src="jquery.form.js"></g:javascript>--}%
    %{--<g:javascript plugin="rapid-grails" src="utils.js"></g:javascript>--}%
    %{--<g:javascript plugin="rapid-grails" src="grid_utils.js"></g:javascript>--}%
    %{--<g:javascript plugin="rapid-grails" src="jquery.json-2.3.min.js"></g:javascript>--}%

</head>

<body dir="rtl">

        <div id="content">
            <g:layoutBody/>
        </div>
</body>
</html>

