<%@page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<!--维修结果记录填写界面-->
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
	<title>维修进度填写</title>
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
			width: 1480px;
		}
		#web img{
			padding-top: 0px;
			margin-right: 300px;
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
		#content table input{
			display:inline-block;
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
			height: 50px;
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
			width:600px;
			border:1px solid #fff;
			padding:10px;
			background-color:#ddd;
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
		<a href="/admin/worker">报修处理</a>
		<p> > </p>
		<a href="/admin/admin">管理人员登录</a>
        <p> > </p>
        <p>维修进度填写</p>&nbsp;&nbsp;
		<p>姓名：${UserList.name}</p>&nbsp;&nbsp;
		<p>身份：${UserList.userType}</p>&nbsp;&nbsp;
		<p>时间：</p>
		<p id="time"></p>&nbsp;&nbsp;
		<img src="${UserList.picUrl}">
	</div>


<form action="/admin/resultsave" method="post">
	<div id="content">
		<table>
			<caption>维修进度</caption>
			<tr>
				<td>员工ID:</td>
				<td colspan="3" style="height:50px;"><input id="staffId" name="staffId" type="text" placeholder="请填写您的ID"></td>
			</tr>
			<tr>
				<td>任务单号:</td>
				<td colspan="3" style="height:50px;"><input id="missionId" name="missionId" type="text" placeholder="请填写您的任务单号"></td>
			</tr>
			<tr>
				<td>人工费用:</td>
				<td colspan="3" style="height:50px;"><input id="staffCost" name="staffCost" type="text" placeholder="请填写您的人工费用"></td>
			</tr>
			<tr>
				<td>任务结果:</td>
				<td colspan="3" rowspan="3">
					完成  <input style="width: 20px;height: 20px;" name="missionStatus" type="radio" value="finish"  checked/>
					拒绝  <input style="width: 20px;height: 20px;" name="missionStatus" type="radio" value="deny"/>
					分配  <input style="width: 20px;height: 20px;" name="missionStatus" type="radio" value="Deliveried"/>
				</td>
			</tr>
		</table>
		<input type="submit" value="提交记录"/>

	</div>
</form>





	<!--bottom-->
    <div id="bottom">
    	<p>Copyright © 2019/8/1 All rights reserved.&nbsp;&nbsp;JavaEE第四小组&nbsp;&nbsp;</p>
	</div>
	

	<script>
		var time = new Date();
		document.getElementById("time").innerHTML = time.getFullYear() + "/" + (time.getMonth()+1) + "/" + time.getDate();
	</script>



</body>
</html>