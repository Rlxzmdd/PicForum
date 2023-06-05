<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.picforum.model.User" %>
<html>
<head>
    <title>发表帖子</title>
    <%-- 引入富文本编辑器的js文件 --%>
    <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
</head>
<body>
<h1>发表帖子</h1>
<%-- 获取session中的用户对象 --%>
<% User user = (User) request.getSession().getAttribute("user"); %>

<%-- 判断用户是否登录 --%>
<% if (user == null) { %>
<%-- 未登录，跳转到登录页面 --%>
<script>alert("请先登录");location.href="login.jsp";</script>
<% } else { %>
<%-- 已登录，显示发表帖子的表单，提交到PostInfoServlet的add方法 --%>
<form action="post?action=add" method="post">
    <%-- 隐藏域，传递用户id和用户名 --%>
    <input type="hidden" name="postUid" value="<%= user.getUid() %>">
    <input type="hidden" name="postName" value="<%= user.getUsername() %>">
    标题：<input type="text" name="title"><br/>
    类型：<input type="radio" name="type" value="show">分享
    <input type="radio" name="type" value="apo">约拍<br/>
    内容：<textarea name="content" id="content"></textarea><br/>
    <input type="submit" value="发表">
</form>

<%-- 使用富文本编辑器替换内容文本域 --%>
<script>CKEDITOR.replace('content');</script>

<% } %>

</body>
</html>