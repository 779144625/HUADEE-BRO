<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<!--故障报修第一界面-->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="content-style-type" content="text/css">
    <meta http-equiv="content-script-type" content="text/javascript">
    <title>故障报修</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            box-sizing: border-box;
        }

        body {
            font-family: "Microsoft YaHei", "微软雅黑", "consolas";
            background: url(/image/green1.jpg);
            width: 1480px;
        }

        #web p {
            display: inline-block;
        }

        #web a {
            text-decoration: none;
            color: #000;
        }

        #web p:nth-of-type(1), #web p:nth-of-type(4) {
            color: green;
        }

        #web a:hover {
            color: green;
            text-decoration: underline;
        }

        #web p, #web a {
            position: relative;
            left: 20px;
            top: 16px;
        }

        #web img {
            padding-top: 10px;
            margin-right: 600px;
            width: 50px;
            float: right;
        }

        #content {
            position: relative;
            margin-top: 200px;
            height: 400px;
            padding: 0 200px;
        }

        #paple {
            padding: 0 20px;
            position: absolute;
            left: 530px;
            background-color: #fff;
            width: 410px;
            height: 200px;
            border: 2px solid #aaa;
        }

        #paple li {
            display: inline-block;
            margin: 40px 15px;
        }

        #paple li a {
            text-decoration: none;
        }

        #paple li h3 {
            color: #000;
            text-align: center;
        }

        #paple li a:hover > h3 {
            color: red;
        }

        #paple li a:hover > img {
            border: 2px solid green;
            border-radius: 5px;
        }

        #paple li a img {
            width: 150px;
            height: 90px;
        }

        #part-right {
            position: absolute;
            padding-left: 20px;
            left: 1050px;
            height: 280px;
            width: 250px;
            border-left: 5px solid #aaa;
        }

        #part-right h3 {
            font-weight: 600;
            font-size: 25px;
            text-align: center;
        }

        #part-right ul {
            list-style: none;
        }

        #part-right li a {
            text-decoration: none;
            margin-bottom: 5px;
        }

        #part-right a:hover {
            color: red;
            text-decoration: underline;
        }

        #bottom {
            clear: both;
            text-align: center;
        }

        #bottom p {
            font-size: 20px;
            font-weight: 500;
            font-style: italic;
        }
    </style>
</head>

<body>
<!--top-->
<div id="web">
    <p>您当前的位置:</p>
    <a href="/user/login">登录页面</a>
    <p> > </p>
    <a href="/user/main">主页面</a>
    <p> > </p>
    <p>故障报修</p>&nbsp;&nbsp;
    <p>姓名：${UserList.name}</p>&nbsp;&nbsp;
    <p>身份：${UserList.userType}</p>&nbsp;&nbsp;
    <p>时间：</p>
    <p id="time"></p>&nbsp;&nbsp;
    <img src="${UserList.picUrl}">
</div>

<!--middle-->
<div id="content">
    <div id="paple">
        <ul>
            <li>
                <a href="/fix/studentPage"><img src="/image/message.png"/>
                    <h3>学生报修</h3>
                </a>
            </li>
            <li>
                <a href="/admin/worker" onclick="distinguish()"><img src="/image/news.png"/>
                    <h3>报修处理</h3>
                </a>
            </li>

        </ul>
    </div>
</div>

<!--bottom-->
<div id="bottom">
    <p>Copyright © 2019/8/1 All rights reserved.&nbsp;&nbsp;JavaEE第四小组&nbsp;&nbsp;</p>
</div>


<script type="text/javascript">
    var time = new Date();
    document.getElementById("time").innerHTML = time.getFullYear() + "/" + (time.getMonth() + 1) + "/" + time.getDate();

    var type1 ="${UserList.userType}";
    var type2 = "管理人员";
    var type3 = "维修人员";

    function distinguish() {
        if (type1 != type2 && type1 != type3) {
            alert("没有权限");
        }
    }
</script>


</body>
</html>









