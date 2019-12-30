<%@ page import="org.springframework.web.context.request.RequestScope" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--填写报修信息界面-->
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
    <title>网络报修</title>
    <style>
        * {
            margin:0;
            padding:0;
            font-family: sans-serif;
            box-sizing: border-box;
        }
        body{
            font-family:"Microsoft YaHei", "微软雅黑", "consolas";
            background: url(/image/green1.jpg);
            width:1480px;
        }

        #web p{
            display: inline-block;
        }
        #web a{
            text-decoration: none;
            color:#000;
        }
        #web p:nth-of-type(1),#web p:nth-of-type(6){
            color:green;
        }
        #web p,#web a{
            position:relative;
            left:20px;
            top:16px;
        }
        #web a:hover{
            color:green;
            text-decoration:underline;
        }
        #web img{
            padding-top: 10px;
            margin-right: 500px;
            width: 50px;
            float: right;
        }
        #content{
            position: relative;
            margin-top: 120px;
            height:500px;
            padding:0 500px;
        }
        #content h1{
            display: inline-block;
            font-size: 30px;
            font-weight: 700;
        }
        #content b{
            font-size: 25px;
            font-weight: 600;
        }
        #content #localtime{
            display: inline-block;
            font-size: 20px;
        }
        #content #item{
            margin-bottom: 10px;
            padding-left: 10px;
            font-size:16px;
            height:40px;
            width:120px;
            display: inline-block;
        }
        #content textarea{
            font-size: 16px;
            padding:10px;
            margin-top: 15px;
        }
        #content input{
            display: inline-block;
            width:100px;
            margin:15px 0;
            padding:5px 10px;
            font-size: 16px;
        }
        #content .wrap{
            display: inline-block;
        }
        #paple{
            position:absolute;
            left:500px;
            background-color: #fff;
            width:370px;
            height:200px;
            border:2px solid #aaa;
        }
        #paple li{
            display: inline-block;
            margin:40px 15px;
        }
        #paple li a{
            text-decoration:none;
        }
        #paple li h3{
            color:#000;
            text-align: center;
        }
        #paple li a:hover> h3{
            color:red;
        }
        #paple li a:hover> img{
            border:2px solid green;
            border-radius: 5px;
        }
        #paple li a img{
            width: 150px;
            height: 90px;
        }
        #part-right{
            position: absolute;
            padding-left: 20px;
            left:1050px;
            height:280px;
            width:250px;
            border-left:5px solid #aaa;
        }
        #part-right h3{
            font-weight: 600;
            font-size: 25px;
            text-align:center;
        }
        #part-right ul{
            list-style: none;
        }
        #part-right li a{
            text-decoration: none;
            margin-bottom: 5px;
        }
        #part-right a:hover{
            color:red;
            text-decoration: underline;
        }
        #bottom {
            clear: both;
            text-align: center;
        }
        #bottom p{
            padding-top: 30px;
            font-size: 20px;
            font-weight: 500;
            font-style: italic;
            position: absolute;
            right: 0;
            width:1480px;
            clear: both;
            margin: 0 auto;
        }
        #btn1{
            font-size: 16px;
            padding:10px;
            margin:20px 20px 0 0;
            background-color: rgba(200,200,200,0.5);
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
    <a href="/admin/guzhang">故障报修</a>
    <p> > </p>
    <p>网络报修</p>&nbsp;&nbsp;
    <p>姓名：${UserList.name}</p>&nbsp;&nbsp;
    <p>身份：${UserList.userType}</p>&nbsp;&nbsp;
    <p>时间：</p>
    <p id="time"></p>&nbsp;&nbsp;
    <img src="${UserList.picUrl}">
</div>

<!--middle-->
<div id="content">

    <form method="post" action="/fix/network-baoxiu">

        <h1>报修项目：</h1>
        <select name="reportType">
            <option>停电</option>
            <option value="停水">停水</option>
            <option value="网络问题">网络问题</option>
            <option value="桌子">桌子</option>
            <option value="椅子">椅子</option>
            <option value="水龙头">水龙头</option>
            <option value="灯泡">灯泡</option>
            <option value="空调">空调</option>
            <option value="花洒">花洒</option>
            <option value="窗户">窗户</option>
            <option value="窗帘">窗帘</option>
            <option value="门锁">门锁</option>
        </select>
        <div></div>
        <div class="wrap"><b>具体情况:</b></div>
        <textarea name ="description" type="text" placeholder="填写您的具体情况" cols='50' rows='6'></textarea>


        <div class="wrap"><b>报修学生学号:&nbsp&nbsp</b></div>

        <input name ="userId" type="text" value="${UserList.userId}" style="width:200px; "/>

        <div class="wrap"><b>报修地址：&nbsp&nbsp</b></div>
        <input name="address" type="text" value="${UserList.address}"style="width:200px; "/><br/>

        <div class="wrap">
            <button type="submit" id="btn1">提交</button>
        </div>
    </form>


    <!--bottom-->
    <div id="bottom">
        <p>Copyright © 2019/8/1 All rights reserved.&nbsp;&nbsp;JavaEE第四小组&nbsp;&nbsp;</p>
    </div>



</div>
<script>
    var time = new Date();
    document.getElementById("time").innerHTML = time.getFullYear() + "/" + (time.getMonth() + 1) + "/" + time.getDate();
</script>
</body>

</html>










