<%--
  Created by IntelliJ IDEA.
  User: PiKaChu
  Date: 2019/8/6
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--组内人员查询界面-->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>维修成员表</title>
    <style>
        * {
            margin:0;
            padding:0;
            font-family: sans-serif;
            box-sizing: border-box;
        }
        body{
            font-family:"Microsoft YaHei", "微软雅黑", "consolas";
            background: url('/image/green1.jpg');
            width: 1480px;
        }
        #web img{
            padding-top: 0px;
            margin-right: 400px;
            width: 50px;
            float: right;
        }
        #web p{
            display: inline-block;
        }
        #web a{
            text-decoration: none;
            color:#000;
        }
        #web p:nth-of-type(1),#web p:nth-of-type(7){
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
            margin:170px auto;
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
            text-align:center;
            width:160px;
            border:1px solid #fff;
            padding:10px;
            margin:0 20px;
            background-color: rgba(100,100,0,0.3);
        }
        #content td:nth-of-type(even){
            width:140px;
            text-align: left;
            background-color:#ddd;
        }
        #bottom {
            position: absolute;
            top: 650px;
            width:100%;
            clear: both;
        }
        #bottom p{
            font-size: 20px;
            font-weight: 500;
            font-style: italic;
            text-align: center;
        }
        #content button{
            background-color: rgba(200,200,200,0.5);
            color:#333;
            float:right;
            margin:20px 20px 0 0;
            padding:10px;
            font-size: 16px;
            border:2px solid #999;
        }
        #content td img{
            width:200px;
            height:140px;
        }
        #content table tr td:nth-of-type(5){
            padding:0;
            margin:0;
        }
    </style>
</head>
<body>
<div id="web">
    <p>您当前的位置:</p>
    <a href="/user/login">登录页面</a>
    <p> > </p>
    <a href="/user/main  ">主页面</a>
    <p> > </p>
    <a href="/admin/guzhang  ">故障报修</a>
    <p> > </p>
    <a href="/admin/worker  ">报修处理</a>
    <p> > </p>
    <a href="/admin/admin  ">管理人员登陆</a>
    <p> > </p>
    <p>组员信息</p>&nbsp;&nbsp;
    <p>姓名：${UserList.name}</p>&nbsp;&nbsp;
    <p>身份：${UserList.userType}</p>&nbsp;&nbsp;
    <p>时间：</p>
    <p id="time"></p>&nbsp;&nbsp;
    <img src="${UserList.picUrl}">
</div>
<div id="content">
    <table>
        <caption>维修成员信息</caption>
        <c:forEach items="${allStaff}" var="staff">
            <tr>
                <td>维修成员编号:</td>
                <td>${staff.staffId}</td>
                <td>姓名:</td>
                <td>${staff.staffName}</td>
                <td>工作情况:</td>
                <td>${staff.workStatus}</td>
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
