<%--
  Created by IntelliJ IDEA.
  User: 59150
  Date: 2019/8/8
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="content-style-type" content="text/css">
    <meta http-equiv="content-script-type" content="text/javascript">
    <title>学生报修</title>
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
        }

        #web p {
            display: inline-block;
        }

        #web a {
            text-decoration: none;
            color: #000;
        }

        #web p:nth-of-type(1), #web p:nth-of-type(6) {
            color: green;
        }

        #web p, #web a {
            position: relative;
            left: 20px;
            top: 16px;
        }

        #web img {
            padding-top: 10px;
            margin-right: 500px;
            width: 50px;
            float: right;
        }

        #content {
            position: relative;
            margin-top: 80px;
            height: 300px;
            padding: 0 300px;
        }

        #paple {
            position: absolute;
            left: 500px;
            background-color: #fff;
            width: 370px;
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
            padding-top: 450px;
            font-size: 20px;
            font-weight: 500;
            font-style: italic;
        }

        .wrap {

            width: 400px;

            height: 30px;

            margin-left: auto;
            margin-right: auto;

            position: relative;

        }

        button.btn1 {

            display: block;
            width: 140px;
            height: 40px;

            line-height: 40px;
            text-align: center;
            background: #ff0099;
            color: #fff;
            position: absolute;
            left: 620px;
            top: 270px;

        }
        #content b{
            font-size: 25px;
        }
        #btn1{
            width:200px;
            font-size: 16px;
            padding:10px;
            margin:20px 20px 0 0;
            background-color: rgba(200,200,200);
            border:2px solid #999;
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
    <a href="/news/news">新闻界面</a>
    <p> > </p>
    <a href="/news/manage">管理新闻</a>
    <p> > </p>
    <p>发布新闻</p>&nbsp;&nbsp;
    <p>姓名：${UserList.name}</p>&nbsp;&nbsp;
    <p>身份：${UserList.userType}</p>&nbsp;&nbsp;
    <p>时间：</p>
    <p id="time"></p>&nbsp;&nbsp;
    <img src="${UserList.picUrl}"/>
</div>

<!--middle-->
<%--<form action="/user/insertfunction" method="post">--%>
    <%--<div id="content">--%>
        <%--<ul>--%>
            <%--<li>--%>
                <%--<div class="wrap"><b>请填写新闻：</b></div>--%>
                <%--<textarea id="situation" type="text" placeholder="请填写新闻"--%>
                          <%--style="vertical-align:top;height:500px;width:900px;"></textarea>--%>
            <%--</li>--%>
        <%--</ul>--%>
    <%--</div>--%>
    <%--<div class="wrap">--%>
        <%--<button type="submit" class="btn1">提交</button>--%>
    <%--</div>--%>
<%--</form>--%>
<div id="content">

    <form method="post" action="/news/insertfunction">
        <b>新闻标题:</b><br />

        <input name ="newsType" type="text" placeholder="请填写新闻标题" style="width:200px;padding:5px; "/><br />

        <b>新闻内容:</b><br />
        <textarea name ="newscontent" type="text" placeholder="请填写新闻" style="width:800px;height:400px;padding:5px;" ></textarea>

        <div class="wrap">
            <button type="submit" id="btn1">发布新闻</button>
        </div>
    </form>
</div>
<script>
    var time = new Date();
    document.getElementById("time").innerHTML = time.getFullYear() + "/" + (time.getMonth() + 1) + "/" + time.getDate();
</script>


</body>
</html>
