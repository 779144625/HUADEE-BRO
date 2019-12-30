<%--
  Created by IntelliJ IDEA.
  User: PiKaChu
  Date: 2019/8/5
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改个人信息</title>
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
        #web p:nth-of-type(1),#web p:nth-of-type(4){
            color:green;
        }
        #web p,#web a{
            position:relative;
            left:20px;
            top:16px;
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
            text-align:right;
            width:250px;
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
            width:1480px;
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
            width:600px;
            border:1px solid #fff;
            padding:10px;
            background-color:#ddd;
        }
        #push{
            position: absolute;
            bottom: 273px;
            left:900px;
            font-size: 16px;
            padding:10px;
            margin:20px 20px 0 0;
            background-color: rgba(200,200,200,0.5);
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
    <p>个人信息</p>
</div>
<form action="/user/change" method="post">
    <div id="content">
        <table>
            <caption>修改个人信息</caption>
            <tr>
                <td>密码:</td>
                <td colspan="3"><input type="password" name="password"  placeholder="${UserList.password}"></td>
            </tr>
            <tr>
                <td>联系方式:</td>
                <td colspan="3"><input type="text" name="phoneNum"  placeholder="${UserList.phoneNum}"></td>
            </tr>
            <tr>
                <td>地址:</td>
                <td colspan="3"><input type="text" name="address"  placeholder="${UserList.address}"></td>
            </tr>
        </table>
        <button type="submit" value="提交修改" >提交修改</button>
    </div>
</form>
<form action="/user/upload" method="post">
    <button id="push" type="submit" >上传头像</button>
</form>
<div id="bottom">
        <p>Copyright © 2019/8/1 All rights reserved.&nbsp;&nbsp;JavaEE第四小组&nbsp;&nbsp;</p>
    </div>

</body>
</html>
