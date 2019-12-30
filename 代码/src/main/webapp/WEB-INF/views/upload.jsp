<%--
  Created by IntelliJ IDEA.
  User: thinkpad
  Date: 2019/8/5
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>uploadPage</title>
</head>
<body>
    <form action="/user/fileUploadPage" method="post" enctype="multipart/form-data" >
        请选择一个文件：
        <input type="file" name="file"/>
        <input type="submit" value="提交上传">
    </form>
</body>
</html>
