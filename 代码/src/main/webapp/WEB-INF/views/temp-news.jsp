<%--
  Created by IntelliJ IDEA.
  User: 59150
  Date: 2019/8/8
  Time: 1:30
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>新闻发布系统</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Microsoft YaHei", "微软雅黑", "consolas";
            background: url(/image/green1.jpg);
            width: 1480px;
        }

        a {
            text-decoration: none;
            color: #000;
        }

        .clearfix {
            *zoom: 1;
        }

        .clearfix:before, .clearfix:after {
            display: table;
            line-height: 0;
            content: "";
        }

        .clearfix:after {
            clear: both;
        }

        .container{
            width: 1200px;
            margin: 0 auto;
        }

        #web p {
            display: inline-block;
        }

        #web a {
            text-decoration: none;
            color: #000;
        }

        #web p, #web a {
            position: relative;
            left: 20px;
        }

        #web p:nth-of-type(1), #web p:nth-of-type(5) {
            color: green;
        }
        #web img{
            padding-top: 10px;
            margin-right: 500px;
            width: 50px;
            float: right;
        }

        .container h1 {
            margin: 10px 0 50px 0;
            font-style: italic;
            color: green;
            font-size: 50px;
            font-weight: 500;
            -webkit-text-stroke: 2.0px #666;
            text-shadow: #666 5px 5px 5px;
            letter-spacing: 5px;
        }

        .index-bg {
            width: 100%;

            position: absolute;
            top: -50px;
            z-index: -10;
        }

        .news-list{
            display: block;
            position:relative;
            width: 1200px;
            margin: 50px 0;
            background-color: #fff;
            border-radius: 5px;
            border: 1px solid #DDD;
            padding: 30px 20px;
            overflow:hidden;
            height: 700px;
        }

        .news-list:hover {
            box-shadow: 0 0 5px 3px #CCC;
        }

        .about .about-des {
            border-left: 5px solid #CCC;
            margin-top: 15px;
        }

        .about .about-des p {
            padding-left: 10px;
            line-height: 28px;
            text-indent: 2em;
        }

        .news-list-left {
            position: absolute;
            left:50px;
            width: 729px;
            display:inline-block;
            margin-bottom: 50px;
        }

        .news-list-right {
            display: inline-block;
            position: absolute;
            right:-400px;
            top:0;
            width: 229px;
        }

        .news-list-item {
            padding: 20px 30px;
        }

        .author-time {
            font-size: 14px;
        }

        .news-des {
            padding-bottom: 20px;
            border-bottom: 2px solid #CCC;
        }

        .news-title {
            font-size: 23px;
        }

        .news-title i {
            display: inline-block;
            width: 47px;
            height: 43px;
            margin-right: 10px;
            vertical-align: middle;
        }

        .news-title a {
            color: green;
        }

        .news-title a:hover {
            text-decoration: underline;
        }

        .news-content-des {
            line-height: 28px;
        }

        .copyright {
            clear: both;
            text-align: center;
            color: gray;

            border-top: 2px solid #CCC;
            margin-top: 50px;
            padding: 20px 0;
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
    <a href="/news/news">新闻界面</a>
    <p> > </p>
    <p>新闻通知</p>
    <p>姓名：${UserList.name}</p>&nbsp;&nbsp;
    <p>身份：${UserList.userType}</p>&nbsp;&nbsp;
    <p>时间：</p>
    <p id="time"></p>&nbsp;&nbsp;
    <img src="${UserList.picUrl}">
</div>

<div class="container">
    <h1>新闻通知</h1>
    <h4></h4>

    <div class="news-list">
        <div class="news-list-left">
            <c:forEach items="${newsLists}" var="news">
            <div class="news-list-item">
                <div class="author-time">
                    <span>后勤保障部</span> 发表于 <span>${news.newsTime}</span>
                </div>
                <div class="news-des">
                    <h3 class="news-title"><i></i><a href="#">${news.newsType}</a></h3>
                    <div class="news-content-des">
                        ${news.newsContent}
                    </div>
                </div>
            </div>
            </c:forEach>

            <div class="news-list-right">
                <div class="about">
                    <h4>关于我们</h4>
                    <div class="about-des">
                        <p>我们致力于及时为学生提供最新的信息，并且能够帮助有需要的人发表文章。如果有问题或者要发表文章请私信或者邮箱联系我们，我们一定会仔细阅读，给您一个良好的答复。</p>
                    </div>
                </div>
            </div>

                   
            <footer class="copyright">
                <p>Copyright © 2019/8/1 All rights reserved.&nbsp;&nbsp;JavaEE第四小组&nbsp;&nbsp;</p>
                       
            </footer>
                 
        </div>
           
    </div>
</div>
<script>
    var time = new Date();
    document.getElementById("time").innerHTML = time.getFullYear() + "/" + (time.getMonth()+1) + "/" + time.getDate();
</script>
 
</body>
</html>
