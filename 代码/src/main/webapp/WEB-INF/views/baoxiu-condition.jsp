<%@page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--状态查询界面-->
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
    <title>报修状态查询</title>
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
        #web img{
            padding-top: 10px;
            margin-right: 500px;
            width: 50px;
            float: right;
        }
        #web a:hover{
            color:green;
            text-decoration:underline;
        }
        #web p:nth-of-type(1),#web p:nth-of-type(6){
            color:green;
        }
        #web p,#web a{
            position:relative;
            left:20px;
            top:16px;
        }
        #content{
            position: relative;
            width:1000px;
            margin:200px auto;
        }
        #content table{
            padding:10px;
            border:2px solid #999;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 1em;
        }
        #content caption{
            color:green;
            font-style: italic;
            font-size: 50px;
            font-weight: 500;
            -webkit-text-stroke: 2.0px #666;
            text-shadow:#666 5px 5px 5px;
            letter-spacing: 5px;
            font-size: 50px;
            margin-bottom: 20px;
        }
        #content td{
            text-align:right;
            width:200px;
            border:1px solid #fff;
            padding:10px;
            margin:0 20px;
            background-color: rgba(100,100,0,0.3);
        }
        #content td:nth-of-type(even){
            text-align: left;
            background-color:#ddd;
        }
        #bottom {
            position: absolute;
            top: 1000px;
            left:120px;
            clear: both;
        }
        #bottom p{
            font-size: 20px;
            font-weight: 500;
            font-style: italic;
            text-align: center;
        }
    </style>
</head>
<body>
<div id="web">
    <p>您当前的位置:</p>
    <a href="/user/login">登录页面</a>
    <p> > </p>
    <a href="/user/main">主页面</a>
    <p> > </p>
    <a href="/admin/guzhang ">故障报修</a>
    <p> > </p>
    <a href="/fix/studentPage ">学生报修</a>
    <p> > </p>
    <p>报修状态查询</p>&nbsp;&nbsp;
    <p>姓名：${UserList.name}</p>&nbsp;&nbsp;
    <p>身份：${UserList.userType}</p>&nbsp;&nbsp;
    <p>时间：</p>
    <p id="time"></p>&nbsp;&nbsp;
    <img src="${UserList.picUrl}">
</div>
<div id="content">
    <table>
        <caption>报修状态查询</caption>
        <c:forEach items="${allMission}" var="mission">
        <tr>
            <td>报修序号:</td>
            <td>${mission.missionId}</td>
            <td>类别：</td>
            <td>${mission.missionType}</td>
            <td>报修时间</td>
            <td>${mission.missionTime}</td>
            <td>任务状态</td>
            <td>${mission.missionStatus}</td>
            <td>产生费用</td>
            <td>${mission.staffCost}</td>
        </tr>
        </c:forEach>
    </table>
</div>
<div id="bottom">
    <p>Copyright © 2019/8/1 All rights reserved.&nbsp;&nbsp;JavaEE第四小组&nbsp;&nbsp;</p>
</div>
<script>
    var time = new Date();
    document.getElementById("time").innerHTML = time.getFullYear() + "/" + (time.getMonth()+1) + "/" + time.getDate();
</script>
</body>
</html>