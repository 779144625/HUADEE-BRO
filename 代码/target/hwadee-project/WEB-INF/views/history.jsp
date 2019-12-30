<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--报修状态查询界面-->
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
    <title>维修结果记录查询</title>
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
            padding-top: 0px;
            margin-right: 300px;
            width: 50px;
            float: right;
        }
        #web p:nth-of-type(1),#web p:nth-of-type(7){
            color:green;
        }
        #web a:hover{
            color:green;
            text-decoration:underline;
        }
        #web p,#web a{
            position:relative;
            left:20px;
            top:16px;
        }
        #content{
            position: relative;
            width:1300px;
            height:450px;
            margin:130px 120px;
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
            font-weight: 500;
            -webkit-text-stroke: 2.0px #666;
            text-shadow:#666 5px 5px 5px;
            letter-spacing: 5px;
            font-size: 50px;
            margin-bottom: 20px;
        }
        #content td{
            text-align:left;
            border:1px solid #fff;
            padding:8px;
            margin:0 20px;
            background-color: rgba(100,100,0,0.3);
        }
        #content td:nth-of-type(odd){
            text-align: center;
            width:100px;
        }
        #content td:nth-of-type(even){
            background-color:#ddd;
        }
        #bottom {
            position: absolute;
            top: 700px;
            left:450px;
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
    <a href="/admin/guzhang">故障报修</a>
    <p> > </p>
    <a href="/admin/worker">报修处理</a>
    <p> > </p>
    <a href="/admin/admin">管理人员登陆</a>
    <p> > </p>
    <p>维修结果记录查询</p>&nbsp;&nbsp;
    <p>姓名：${UserList.name}</p>&nbsp;&nbsp;
    <p>身份：${UserList.userType}</p>&nbsp;&nbsp;
    <p>时间：</p>
    <p id="time"></p>&nbsp;&nbsp;
    <img src="${UserList.picUrl}">
</div>
<div id="content">
    <table>
        <caption>维修历史查询</caption>
        <c:forEach items="${allMission}" var="mission">
            <tr>
                <td>报修序号：</td>
                <td>${mission.missionId}</td>
                <td>报修账号：</td>
                <td>${mission.userId}</td>
                <td>报修时间：</td>
                <td>${mission.missionTime}</td>
                <td>报修类型：</td>
                <td>${mission.missionType}</td>
                <td>维修地点：</td>
                <td>${mission.address}</td>
                <td>任务情况：</td>
                <td>${mission.missionStatus}</td>
                <td>更新时间：</td>
                <td>${mission.finishTime}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<div id="bottom">
    <p>Copyright © 2019/8/1 All rights reserved.&nbsp;&nbsp;JavaEE第四小组&nbsp;&nbsp;</p>
</div>
<script>
    var time = new Date();
    document.getElementById("time").innerHTML = time.getFullYear() + "/" + (time.getMonth() + 1) + "/" + time.getDate();
</script>
</body>
</html>