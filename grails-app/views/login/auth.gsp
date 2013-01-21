<html>
<head>
    <meta name='layout' content='main'/>
    <title><g:message code="springSecurity.login.title"/></title>
    <style type='text/css' media='screen'>
    .content-box {
        width: 400px;
    }
    #login {
        margin: 15px 0px;
        padding: 0px;
        text-align: center;
    }
    #login .inner {
        width: 340px;
        padding-bottom: 6px;
        margin: 60px auto;
        text-align: right;
        border: 1px solid #aab;
        background-color: #f0f0fa;
        -moz-box-shadow: 2px 2px 2px #eee;
        -webkit-box-shadow: 2px 2px 2px #eee;
        -khtml-box-shadow: 2px 2px 2px #eee;
        box-shadow: 2px 2px 2px #eee;
    }
    #login .inner .fheader {
        padding: 18px 26px 14px 26px;
        background-color: #f7f7ff;
        margin: 0px 0 14px 0;
        color: #2e3741;
        font-size: 18px;
        font-weight: bold;
    }
    #login .inner .cssform p {
        clear: right;
        margin: 0;
        /*padding: 4px 0 3px 0;*/
        /*padding-right: 105px;*/
        /*margin-bottom: 20px;*/
        height: 1%;
    }
    #login .inner .cssform input[type='text'] {
        width: 160px;
    }
    #login .inner .cssform label {
        font-weight: bold;
        /*float: right;*/
        text-align: right;
        /*margin-right: -105px;*/
        width: 110px;
        padding-top: 3px;
        padding-right: 10px;
    }
    #login #remember_me_holder {
        padding-right: 5px;
        display: block;
    }
    #login #submit {
        margin-right: 160px;
    }
    #login #remember_me_holder label {
        float: none;
        margin-right: 0;
        text-align: right;
        width: 150px;
        display: inline;
    }
    #login .content-box .login_message {
        padding: 6px 25px 20px 25px;
        color: #c33;
    }
    #login .content-box .text_ {
        width: 110px;
        margin-right: 10px;
        line-height: 14px;
        /*display: inline-block;*/
    }
    #login .content-box .lbl {
        display: inline;
        vertical-align: super;
        width: 50px;
    }
    #login .content-box .chk {
        height: 12px;
    }
    #login .content-box-header h3{
        font-size: 14px;
        font-weight: normal;
    }
        /*#login .content-box .in_ {*/
        /*padding: 0px,100px;*/
        /*}*/
    </style>
</head>
<body>
<h2>سامانه مديريت گردش حواله تحويل کالا</h2>
%{--<div id="content">--}%
<div id='login'>
%{--<div class='inner'>--}%
%{--<div class='fheader'><g:message code="springSecurity.login.header"/></div>--}%
    <g:if test='${flash.message}'>
        <div class='login_message'>${flash.message}</div>
    </g:if>
    <div class="content-box">
        <div class="content-box-header">
            <h3>ورود به سيستم</h3>
        </div>
        <div class="content-box-content">
            <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
                <p>
                    <label for='username' class='lbl'><g:message code="springSecurity.login.username.label"/>:</label>
                    <input type='text' class='text_' name='j_username' id='username'/>
                </p>
                <p>
                    <br>
                    <label for='password' class='lbl'><g:message code="springSecurity.login.password.label"/>:</label>
                    <input type='password' class='text_' name='j_password' id='password'/>
                </p>
                <p id="remember_me_holder">
                    <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me'
                           <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                    <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
                </p>
                %{--<p>--}%
                <input type='submit' id="submit" class='in_'value='${message(code: "springSecurity.login.button")}'/>
                %{--</p>--}%
            </form>
        </div>
    </div>
</div>
%{--</div>--}%
<script type='text/javascript'>
    <!--
    (function () {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
</script>
</body>
</html>