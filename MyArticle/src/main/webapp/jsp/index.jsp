<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link type="text/css" rel="stylesheet" href="static/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="static/css/font-awesome.min.css"/>
    <link type="text/css" rel="stylesheet" href="static/layui/css/layui.css"/>
    <style type="text/css">
        .header{
            background-image: url("<%=basePath%>/static/img/color.jpeg");
            background-size: 100%;
            height: 240px;
        }
        #code{
            font-family:Arial;
            font-style:italic;
            font-weight:bold;
            letter-spacing:2px;
            color: #393D49;
            width: 70px;
        }
        #content{
            width:40%;
            margin: 6% 30% 0 30%;
            height: 53%;
        }

    </style>
</head>
<body>
<div class="header">
    <div style="margin: 0 45% 0 45%;padding-top:5%;text-align:center;">
        <div style="height:16%;width:90%;background:black;text-align:center;">
            <h3 style="font-family: Menlo;color:white;padding-top:5%;"><strong>CodeData©</strong></h3>
        </div>
        <h4 style="margin-top:16%;margin-left:-10%;">
            &nbsp;
            <span style="font-size:20px;" class="fa fa-github fa-fw"></span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="font-size:20px;" class="fa fa-home fa-fw"></span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="font-size:20px;" class="fa fa-linkedin fa-fw"></span>
            <br/>
            <label><a href="https://github.com/xuesenLi">GitHub</a></label>
            &nbsp;&nbsp;&nbsp;
            <label><a href="https://www.zhihu.com/people/xuesenLi">ZhiHu</a></label>
        </h4>
    </div>
</div>

<div class="container">
    <div id="content">
        <h2 class="text-nowrap" style="color: #393D49;text-align:center;padding-top:10%;font-family: Menlo">自媒体文章管理系统</h2>
        <div style="text-align: center;">
            <br/>
            <br/>
            <label style="font-size:20px;color:white;padding-right:8%;">
                <a href="#" id="login" style="text-decoration: none;border-bottom:2px solid #009688;color:#009688">登录</a>
            </label>
            <label style="font-size:20px;color:white;padding-left:8%;">
                <a href="#" id="register" style="text-decoration:none;">注册</a>
            </label>
        </div>
        <hr style="color: #484848;text-align:center;"/>
        <!-- 登录的表单 -->
        <form action="users/login" id="loginform" method="post" class="layui-form" style="text-align: center;margin-right:12%;margin-top:10%;">
            <%--<input name="a_id" hidden="hidden" value="${a_id}"/>--%>
            <div>
                <div class="layui-form-item layui-inline" style="width:110%">
                    <label class="layui-form-label" style="margin-left:13%;"><i class="fa fa-user fa-fw"></i></label>
                    <div class="layui-input-inline">
                        <input type="text" name="username" class="layui-input" style="background:none;border: none;border-bottom:1px solid white;" placeholder="Username"/>
                    </div>
                </div>

                <br/>
                <div class="layui-form-item layui-inline">
                    <label class="layui-form-label">
                        <span class="fa fa-lock fa-fw"></span>
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" name="password" class="layui-input" style="background:none;border: none;border-bottom:1px solid white;" placeholder="Password"/>
                    </div>
                </div>
                <br/>
                <br/>
                <div style="text-align:center;color: #009688;background-color: #01AAED;width:48%;margin-left:138px;">
                    <input type="submit" class="layui-btn layui-btn-lg" style="background: none;" value="Sign in"/>
                </div>
            </div>
        </form>
        <!-- 注册的表单 -->
        <form action="users/register" id="registerform" method="post" class="layui-form" hidden="hidden" style="text-align: center;margin-right:12%;margin-top:10%;">
            <div>
                <div class="layui-form-item layui-inline" style="width:110%">
                    <label class="layui-form-label" style="margin-left:13%;"><i class="fa fa-user fa-fw"></i></label>
                    <div class="layui-input-inline">
                        <input type="text" name="username" id="username" onblur="return checkName();" class="layui-input" style="background:none;border: none;border-bottom:1px solid white;" placeholder="Username"/>
                    </div>
                    <span id="info"></span>
                </div>
                <br/>
                <div class="layui-form-item layui-inline">
                    <label class="layui-form-label" style="font-size:16px;">
                        <span class="fa fa-lock fa-fw"></span>
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" name="password" id="password" class="layui-input" style="background:none;border: none;border-bottom:1px solid white;" placeholder="Password"/>
                    </div>
                </div>
                <br/>
                <div class="layui-form-item layui-inline" style="margin-left: 14%;">
                    <label class="layui-form-label">
                        <span class="fa fa-envelope fa-fw"></span>
                    </label>
                    <div class="layui-input-inline" style="width: 32%;">
                        <input type="text" id="checkCode" class="layui-input" style="background:none;border: none;border-bottom:1px solid white;"/>
                    </div>
                    <div class="layui-input-inline">
                        <input id="code" onclick="createCode()" type="button" style="background:none;border: none;margin-left:198px;margin-top:-14%;"/>
                    </div>
                </div>
                <br/>
                <br/>
                <div style="text-align:center;color: #009688;background-color: #01AAED;width:48%;margin-left:34%;">
                    <input type="button" class="layui-btn layui-btn-lg" style="background: none;" value="Sign up" onclick="register()"/>
                </div>
            </div>
        </form>

    </div>
</div>
</body>
<script src="static/js/jquery-3.3.1.min.js"></script>
<script src="static/layui/layui.all.js"></script>
<script type="text/javascript">
    layui.use(['layer','element'], function(){
        var layer = layui.layer;
        var element = layui.element;
    });
    $("#register").click(function(){
        $("#login").css({'border':'none','color':'#393D49'});
        $(this).css({'border-bottom':'2px solid #009688','color':'#009688'});
        $("#loginform").hide();
        $("#registerform").show();
    });
    $("#login").click(function(){
        $("#register").css({'border':'none','color':'#393D49'});
        $(this).css({'border-bottom':'2px solid #009688','color':'#009688'});
        $("#registerform").hide();
        $("#loginform").show();
    });

</script>
<script type="text/javascript">
    //设置一个全局的变量，便于保存验证码
    var code;
    function createCode(){
        //首先默认code为空字符串
        code = '';
        //设置长度，这里看需求，我这里设置了4
        var codeLength = 4;
        var codeV = document.getElementById('code');
        //设置随机字符
        var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R', 'S','T','U','V','W','X','Y','Z');
        //循环codeLength 我设置的4就是循环4次
        for(var i = 0; i < codeLength; i++){
            //设置随机数范围,这设置为0 ~ 36
            var index = Math.floor(Math.random()*36);
            //字符串拼接 将每次随机的字符 进行拼接
            code += random[index];
        }
        //将拼接好的字符串赋值给展示的Value
        codeV.value = code;
    }

    //下面验证输入验证码 是否正确
    function register(){
        //toUpperCase() 将所有小写字符全部被转换为了大写字符。
        var check = document.getElementById('checkCode').value.toUpperCase();
        if(check == ""){
            layer.open({
                title: '警告信息',
                content: '请输入验证码'
            });
        }else if(check != code){
            $("#checkCode").val("");
            layer.open({
                title: '警告信息',
                content: '您输入的验证码不正确，请重新输入'
            });
            //更新验证码
            createCode();
        }else{
            $("#registerform").submit();
        }
    }


    function checkName(){
        var username = $("#username").val();
        if(username != ''){
            $.ajax({
                url: 'users/findByName?username='+username,
                type: 'post',
                dataType: 'json',
                success: function(result){
                    if(result.success){
                        $("#info").text("可以注册").css({'color':'green','font-size':'1px'});
                    }else{
                        $("#info").text("该用户名已注册").css({'color':'red','font-size':'1px'});
                    }
                }
            });
        }
        /*if(username == ''){
            $("#info").text("");
        }*/
    }

    //设置此处的原因是每次进入界面展示一个随机的验证码，不设置则为空
    window.onload = function (){
        createCode();
        if("${msg}"!=""){
            layer.msg("${msg}",{
                icon: 5,
                time:2000,
            });
        }
    }
</script>


</html>
