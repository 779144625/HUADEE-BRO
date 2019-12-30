<%--
  Created by IntelliJ IDEA.
  User: 59150
  Date: 2019/8/8
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--个人信息修改界面-->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加用户</title>
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
        #web a:hover{
            color:green;
            text-decoration:underline;
        }
        #web p,#web a{
            position:relative;
            left:20px;
            top:16px;
        }
        #web img{
            padding-top: 10px;
            margin-right: 550px;
            width: 50px;
            float: right;
        }
        #content{
            position: relative;
            width:830px;
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
            width:150px;
            border:1px solid #fff;
            background-color: rgba(100,100,0,0.3);
        }
        #content td:nth-of-type(odd){
            padding-right: 10px;
        }
        #content td:nth-of-type(even){
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
        #content button,#content >input{
            margin-left:20px;
            background-color: rgba(200,200,200,0.5);
            color:#333;
            float:right;
            margin:20px 20px 0 0;
            padding:10px;
            font-size: 16px;
            border:2px solid #999;
        }
        #content table input{
            width:150px;
            border:1px solid #fff;
            padding:10px;
            background-color:#eee;
        }
        #content td img{
            width:200px;
            height:140px;
        }
        #content table td:nth-of-type(4){
            padding:0;
            margin:0;
        }
        #content table select{
            width:150px;
            height: 30px;
            padding:5px 0;
        }
        form button{
            background-color: rgba(200,200,200,0.5);
            color:#333;
            float:right;
            font-size: 16px;
            border:2px solid #999;
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
    <p>创建用户<p>&nbsp;&nbsp;
    <p>姓名：${UserList.name}</p>&nbsp;&nbsp;
    <p>身份：${UserList.userType}</p>&nbsp;&nbsp;
    <p>时间：</p>
    <p id="time"></p>&nbsp;&nbsp;
    <img src="${UserList.picUrl}">
</div>
<form action="/user/addfunction" method="post">
    <div id="content">
        <table>
            <caption>添加用户</caption>
            <tr>
                <td>姓名:</td>
                <td><input type="text" name="uname"/></td>
                <td>用户类型:</td>
                <td>
                    <select name="userType">
                        <option value="学生">学生</option>
                        <option value="管理人员">管理人员</option>
                        <option value="维修人员">维修人员</option>
                    </select>
                </td>
                <td>账号:</td>
                <td><input name="userID" type="text"/></td>
            </tr>
            <tr>
                <td>密码:</td>
                <td><input type="password" name="password1"/></td>
                <td>确认密码:</td>
                <td><input type="password" name="password2"/></td>
                <td>联系方式:</td>
                <td><input name="phoneNum" type="text"/></td>
            </tr>
            <tr>
                <td>地址:</td>
                <td colspan="5"><input name="address" type="text" style="width:100%"/></td>
            </tr>
        </table>
        <button type="submit" id="push2">创建用户</button>
    </div>
</form>
<%--<form action="/user/upload" method="post">--%>
    <%--<button id="push" type="submit" >上传头像</button>--%>
<%--</form>--%>
    <div id="bottom">
        <p>Copyright © 2019/8/1 All rights reserved.&nbsp;&nbsp;JavaEE第四小组&nbsp;&nbsp;</p>
    </div>

</body>
<script>
    var time = new Date();
    document.getElementById("time").innerHTML = time.getFullYear() + "/" + (time.getMonth()+1) + "/" + time.getDate();
</script>
</html>
