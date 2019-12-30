<%@page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
	<title>信息门户</title>
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
        #web p:nth-of-type(1),#web p:nth-of-type(3){
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
            margin-right: 500px;
            width: 50px;
            float: right;
        }
        #content{
            position: relative;
            margin: 200px 0 0 0;
            height:400px;
            padding:0 200px;
        }
        #paple{
            position:absolute;
            left:200px;
            background-color: #fff;
            width:800px;
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
            padding-top: 50px;
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
		<p>主页面</p>&nbsp;&nbsp;
		<p>姓名：${UserList.name}</p>&nbsp;&nbsp;
		<p>身份：${UserList.userType}</p>&nbsp;&nbsp;
		<p>时间：</p>
		<p id="time"></p>&nbsp;&nbsp;
		<img src="${UserList.picUrl}">
        <%--<img src="/image/head.jpg" />--%>
	</div>
    <!--middle-->
    <div id="content">
    	<div id="paple">
    		<ul>
    			<li>
                    <a href="/user/message"><img src="/image/message.png"/>
                        <h3>我的信息</h3>
                    </a>	
                </li>
                <li>
                    <a href="/news/news"><img src="/image/news.png"/>
                        <h3>查阅新闻</h3>
                    </a>		
                </li>
                <li>
                    <a href="/admin/guzhang"><img src="/image/wrong.png"/>
                        <h3>故障报修</h3>
                    </a>		
                </li>
                <li>
                    <a href="/comments/select"><img src="/image/luntan.png"/>
                        <h3>高校论坛</h3>
                    </a>		
                </li>
    		</ul>
    	</div>
    	<div id="part-right">
    		<h3>新闻公告</h3>
            <ul>
                <li>
                1.尊敬的用户们们：
                   本科高校后勤管理系统一直在持续研发和努力优化中，感谢所有用户随时对我们系统的研发和管理提供宝贵意见。谢谢您的支持！
                </li>
                <li>
                2.使用IE8浏览器访问系统不流畅的用户可以点击下面链接下载相应浏览器进行访问。<br><br>
                <a href="http://soft.hao123.com/index.php?ct=stat&amp;ac=aladdin&amp;bd=1&amp;id=15724&amp;f=aHR0cDovL3NvZnRkb3dubG9hZC5oYW8xMjMuY29tL2hhbzEyMy1zb2Z0LW9ubGluZS1iY3Mvc29mdC9GL0ZpcmVmb3gtc2V0dXAuZXhl">火狐浏览器</a>
                <br/>
                <a href="https://dl.softmgr.qq.com/original/Browser/73.0.3683.86_chrome_installer.exe">谷歌浏览器</a>
                </li>
            </ul>
    	</div>
    </div>
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