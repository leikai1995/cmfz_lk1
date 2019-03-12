<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <title>注册</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<style>
    #form{
        width: 500px;
        height: 1000px;
        padding-top: 50px;
        margin: 0 auto;
    }
    #welcome{
        height: 100px;
        text-align: center;
        margin-bottom: 75px;
    }
    #fm{
        width: 500px;
        height: 400px;
        margin: 0;
    }
    .zi{
        float: left;
        height: 60px;
        margin: 0 0 20px 0;
        color: #666;
        font-size: 18px;
    }
    .zil{
        float: left;
        display: block;
        height: 60px;
        width: 90px;
        text-align:left;
        line-height: 60px;
        margin-right: 5px;
        font-weight: 600;
    }
    .i{
        border-radius: 4px;
        border: 1px solid #ddd;
        float: left;
        height: 50px;
        width:400px;
        font-size: 18px;
    }
    #ii{
        display: block;
        float: right;
        height: 60px;
        width: 440px;
        font-size: 24px;
        font-weight: lighter;
        background-color: #3487ff;
        color: aliceblue;
        border: 1px #3083ff solid;
        border-radius: 4px;
        margin: 30px 30px 0px 30px;
        cursor:pointer;
    }
    #ii:hover{
        transition: 0.5s;
        background-color:#1373FF;
    }
    #zc{
        float: right;
        color: #225592;
        font-size: 20px;
        text-decoration:none;
    }
    #zc:hover{
        text-decoration: underline
    }
</style>
<body>
<div id="form">
    <div id="welcome">
        <font id="" style="font-size: 40px;line-height: 100px;">欢迎注册</font>
    </div>
    <form id="fm" action="${pageContext.request.contextPath}/user/register.do" method="post" >
        <p class="zi">
            <label class="zil" >法名：</label>
            <input class="i" type="text" name="dharmaName" />
        </p>
        <p class="zi">
            <label class="zil" >真实姓名：</label>
            <input class="i" type="text" name="realname" />
        </p>
        <p class="zi">
            <label class="zil" >性别：</label>
            <input class="i" type="text" name="sex" />
        </p>
        <p class="zi">
            <label class="zil" >省份：</label>
            <input class="i" type="text" name="province"/>
        </p>
        <p class="zi">
            <label class="zil" >城市：</label>
            <input class="i" type="text" name="city" />
        </p>
        <p class="zi">
            <label class="zil" >签名：</label>
            <input class="i" type="text" name="sign" />
        </p>
        <p class="zi">
            <label class="zil" >电话：</label>
            <input class="i" type="text" name="phone" />
        </p>
        <p class="zi">
            <label class="zil" >密码：</label>
            <input class="i" type="password" name="password"/>
        </p>
        <button id="ii" type="submit" value="登陆">注册</button>
    </form>
</div>
</body>
</html>

