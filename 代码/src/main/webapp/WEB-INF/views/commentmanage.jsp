<%--
  Created by IntelliJ IDEA.
  User: thinkpad
  Date: 2019/8/7
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--评论界面-->
<html lang="en">
<heda>
    <meta charset="UTF-8">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="content-style-type" content="text/css">
    <meta http-equiv="content-script-type" content="text/javascript">
    <title>管理评论</title>
    <style type="text/css">
        body{
            width:1480px;
        }
        .container{
            padding: 10px;
            width:900px;
            height: 800px;
            min-height: 10px;
            margin:50px auto;
            background-color: #e5e9ef;
            border-radius: 1em;
        }
        .cls {
            clear: both;
        }
        .comment {
            min-height: 60px;
            /* border: 1px solid red; */
        }
        .comment_list{
            top:100px;
            position: relative;
        }
        .comment_image{
            margin:20px 0 0 20px;
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }
        .comment_image img{
            position: relative;
            top:20px;
            width: 40px;
            height: 40px;
        }
        .comment_send{
            position: relative;
            margin-bottom: 30px;
        }
        .comment_send_input{
            outline: none;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            transition: all 0.3s;
            position: absolute;
            top:15px;
            left: 95px;
            resize: none;
            width: 605px;
            height: 65px;
            padding: 10px;
            border-radius: 4px;
            background: #f4f5f7;
            border:1px solid #e5e9ef;
        }
        .comment_send_input:hover, .comment_send_input:active {
            background: #fff;
            color: #555;
        }
        .comment_send_button {
            border: none;
            cursor: pointer;
            user-select: none;
            -moz-user-select: none;
            transition: all 0.3s;
            position: absolute;
            top: 15px; right: 0px;
            width: 65px;
            height: 65px;
            border-radius: 4px;
            background: #1aa2d4;
            color: #fff;
            font-size: 14px;
            text-align: center;
        }
        .comment-send-button:hover {
            background: #1eb6e3;
        }
        .comment_content {
            float: right;
            width: 685px;
            padding-top: 15px;
            border-top: 1px solid #dfdfdf;
        }
        .comment_content button{
            float:right;
        }
        .comment_content_name {
            color: #6d757a;
            font-size: 12px;
            margin-bottom: 5px;
        }
        .comment_content_article {
            font-size: 14px;
            margin-bottom: 10px;
        }
        .comment_content_footer {
            color: #6d757a;
            font-size: 12px;
            margin-bottom: 15px;
        }
        .comment_content_footer span {
            margin-right: 10px;
        }
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
        #web p:nth-of-type(1),#web p:nth-of-type(5){
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
        #comment{
            position: relative;
            top:0px;
            width:830px;
            margin:170px auto;
        }
        #bottom {
            clear: both;
            text-align: center;
        }
        #bottom p{
            padding-top: 45px;
            padding-bottom: 60px;
            font-size: 20px;
            font-weight: 500;
            font-style: italic;
        }
    </style>
</heda>
<body>
<div id="web">
    <p>您当前的位置:</p>
    <a href="/user/login">登录页面</a>
    <p> > </p>
    <a href="/user/main">主页面</a>
    <p> > </p>
    <a href="/comments/select">高校论坛</a>
    <p> > </p>
    <p>管理评论</p>
    <p>姓名：${UserList.name}</p>&nbsp;&nbsp;
    <p>身份：${UserList.userType}</p>&nbsp;&nbsp;
    <p>时间：</p>
    <p id="time"></p>&nbsp;&nbsp;
</div>
<div class="container">
    <div class="comment_send">
        <form id="commentForm" method="post" action="/comments/newcomment">
                    <span class="comment_image">
                            <img src="${UserList.picUrl}" alt="头像">
                    </span>
            <textarea class="comment_send_input" name="comment" form="commentForm" cols="80" rows="5"
                      placeholder="请自觉遵守互联网相关的政策法规，严禁发布色情、暴力、反动的言论。"></textarea>
            <input class="comment_send_button" type="submit" value="发表评论">
        </form>
    </div>

    <div class="comment_list">
        <c:forEach items="${allComments}" var="comment">
            <div class="comment">
                <span class="comment_image">
                    <img src="${UserList.picUrl}" alt="头像">
                </span>
                <div class="comment_content">
                    <p class="comment_content_name">ID:${comment.userId}</p>
                    <p class="comment_content_article">${comment.commentContent}</p>
                    <p class="comment_content_footer">
                        <span class="comment_content_footer_id">${comment.commentId}楼</span>
                        <span class="comment_content_footer_timestamp">${comment.commentTime}</span>
                    </p>
                    <form action="/comments/delete?id=${comment.commentId}" method="post">
                        <button type="submit">删除</button>
                    </form>
                </div>
                <div class="cls"></div>
            </div>
        </c:forEach>
    </div>

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