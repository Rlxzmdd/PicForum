<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.picforum.model.PostInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.picforum.model.User" %>
<html>
<head>
    <title>搜索结果</title>
</head>
<body>
<h1>搜索结果</h1>

<%-- 获取request属性中的帖子列表数据和关键字 --%>
<% List<PostInfo> postList = (List<PostInfo>) request.getAttribute("postList"); %>
<% String keyword = (String) request.getAttribute("keyword"); %>
<%-- 获取session中的用户对象 --%>
<% User user = (User) request.getSession().getAttribute("user"); %>

<%-- 显示置顶banner --%>
<div style="background-color: lightblue; height: 100px; padding: 10px;">
    <%-- 判断用户是否登录 --%>
    <% if (user == null) { %>
    <%-- 未登录，显示注册和登录按钮 --%>
    <a href="register.jsp">注册</a>
    <a href="login.jsp">登录</a>
    <% } else { %>
    <%-- 已登录，显示用户名和登出按钮 --%>
    <p>欢迎，<%= user.getUsername() %>！</p>
    <a href="user?action=logout">登出</a>
    <% } %>

</div>

<%-- 显示搜索框，提交到PostInfoServlet的search方法，并传递关键字参数 --%>
<div style="margin: 10px;">
    <form action="post?action=search" method="get">
        <input type="hidden" name="action" value="search">
        搜索：<input type="text" name="keyword" value="<%= keyword %>">
        <input type="submit" value="搜索">
    </form>
</div>

<%-- 显示帖子类型选择框，单选框的值对应数据库中的type字段 --%>
<div style="margin: 10px;">
    帖子类型：
    <input type="radio" name="type" value="" checked>全部
    <input type="radio" name="type" value="show">分享
    <input type="radio" name="type" value="apo">约拍
</div>

<%-- 显示帖子列表 --%>
<h2>帖子列表</h2>

<%-- 判断帖子列表是否为空 --%>
<% if (postList == null || postList.isEmpty()) { %>

<p>暂无帖子</p>

<% } else { %>

<%-- 遍历帖子列表，显示每个帖子的标题，内容，类型，更新时间和详情链接 --%>
<% for (PostInfo post : postList) { %>

<div style="border: 1px solid black; margin: 10px; padding: 10px;">
    <p>标题：<%= post.getTitle() %></p>
    <p>内容：<%= post.getContent() %></p>
    <p>类型：<%= post.getType() %></p>
    <p>更新时间：<%= post.getTimeUpdate() %></p>

    <%-- 显示详情链接，跳转到PostInfoServlet的detail方法，并传递帖子id参数 --%>
    <a href="post?action=detail&pid=<%= post.getPid() %>">查看详情</a>

</div>

<% } %>

<%-- 获取request属性中的总页数和当前页码 --%>
<% int noOfPages = (Integer) request.getAttribute("noOfPages"); %>
<% int currentPage = (Integer) request.getAttribute("currentPage"); %>

<%-- 显示分页导航栏，根据总页数和当前页码生成链接 --%>
<div style="margin: 10px;">
    <%-- 如果当前页码不是1，显示上一页链接 --%>
    <% if (currentPage != 1) { %>
    <a href="post?action=search&keyword=<%=keyword%>&page=<%= currentPage - 1 %>">上一页</a>
    <% } %>

    <%-- 循环生成每一页的链接 --%>
    <% for (int i = 1; i <= noOfPages; i++) { %>
    <%-- 如果是当前页，不生成链接，只显示页码 --%>
    <% if (i == currentPage) { %>
    <%= i %>
    <% } else { %>
    <%-- 如果不是当前页，生成链接，传递页码和关键字参数 --%>
    <a href="post?action=search&keyword=<%=keyword%>&page=<%= i %>&keyword=<%= keyword %>"><%= i %></a>
    <% } %>
    <% } %>

    <%-- 如果当前页码不是最后一页，显示下一页链接 --%>
    <% if (currentPage != noOfPages) { %>
    <a href="post?action=search&keyword=<%=keyword%>&page=<%= currentPage + 1 %>">下一页</a>
    <% } %>
</div>

<% } %>


</body>
</html>