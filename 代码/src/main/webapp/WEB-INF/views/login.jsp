<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>高校后勤综合管理平台</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            box-sizing: border-box;
        }

        body {
            text-align: center;
            font-family:"Microsoft YaHei", "微软雅黑", "consolas";
            background-image: url("/image/background.jpg");
            width: 1480px;
            margin: 0 auto;
        }

        #header {
        }

        #header p {
            -webkit-text-stroke: 2.0px #666;
            text-shadow: #666 5px 5px 10px;
            color: #ccc;
            font-size: 45px;
            margin-top: 160px;
        }

        #login {
            width: 450px;
            height: 330px;
            border: 2px solid #666;
            margin: 50px auto;
        }

        #login #title {
            height: 80px;
            width: 100%;
            background-color: rgba(100, 100, 100, 0.4);
        }

        #title p {
            color: #333;
            font-size: 20px;
            padding-top: 25px;
        }

        #content p {
            text-align: left;
            padding-left: 10%;
            font-size: 15px;
            color: #000;
            margin-top: 20px;
        }

        #content input {
            color: #000;
            padding: 10px;
            width: 80%;
            background-color: rgba(200, 200, 200, 0.4);
            border: 1px solid #666;
        }

        #content input::-webkit-input-placeholder {
            color: #000;
        }

        #content button {
            font-size: 20px;
            margin-top: 20px;
            width: 80%;
            height: 40px;
            background-color: rgba(100, 100, 100, 0.4);
            border: 1px solid #666;
        }
    </style>
</head>
<body onload="distinguish()">
<div id="header">
    <p>高校后勤综合管理平台</p>
</div>
<div id="login">
    <div id="title">
        <p>用户登录 Login</p>
    </div>

    <div id="content">
        <form action="/user/log" method="post">
            <p>用户名:</p>
            <input name="userId" id="userId" type="text" placeholder="填写您的账号"/>
            <p>密码:</p>
            <input name="password" id="password" type="password" placeholder="填写您的密码"/>
            <div id="error_box"></div>
            <button type="submit" >点击登陆</button>
        </form>
    </div>
</div>
<script type="text/javascript">
    var i = 0;
    i=${i};
    function distinguish() {
        if (i==1){
            alert("账号或密码输入错误，请重新输入。");
        }
    }
</script>
</body>
</html>