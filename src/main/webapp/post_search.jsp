<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.picforum.model.PostInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.picforum.model.User" %>
<html>
<head>
    <title>搜索结果</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f7f8fe;
            /*background-color: #f5f5f5;*/
        }
        .container{
            margin: 50px auto;
            max-width: 80%;
        }
        .top {
            height: 450px;
            background-image: url("image/4.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;

        }

        .top1 {
            height: 200px;
            display: flex;
            align-items: center;
        }
        .title {
            font-size: 36px;
            font-weight: bold;
            margin-left: 30px;
            color: white;
        }
        .menu {
            margin-left: 30px;

        }
        .menu a {
            font-size: 24px;
            text-decoration: none;
            color: white;
            margin-right: 20px;
        }
        .menu a:hover{
            color: #697092;
        }
        .login {
            margin-left: auto;
            margin-right: 30px;
        }
        .login a {
            text-decoration: none;
            color: white;
            margin-right: 20px;
        }
        .login a:hover{
            background-color: gray;
        }
        .top2 {
            height: 250px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .search {

            padding: 10px 20px;
            display: flex;
            align-items: center;
        }
        .search input[type="text"] {
            border: none;
            padding: 15px;
            height: 50px;
            width: 350px;
            border-radius: 30px;
        }
        .search input[type="submit"] {
            background-color: #b7c1f4;
            color: white;
            border: none;
            height: 40px;
            width: 60px;
            border-radius: 10px;
            margin-left: 10px;
            padding: 5px 15px;
            cursor: pointer;
        }
        .search input[type="submit"]:hover {
            background-color: #afbaf3;
        }
        /* Post card styling */
        .column {
            margin: 10px;
        }
        .post-card {
            border-radius: 10px;
            box-shadow: 1px 2px 4px rgba(0, 0, 0, 0.3);
            background-color: #fff;
            padding: 20px;
            margin: 10px;
            /*width: calc((100% - 40px) / 4); !* Two columns layout with 20px margin on both sides *!*/
            width: 20%;
            height: 450px;
            float: left;
            text-align: center;
        }

        .post-card:hover {
            transform: translateY(-5px);
            transition: 0.3s ease-out;
        }

        .post-title {
            font-size: 24px;
            margin-top: 0;
            margin-bottom: 10px;
            margin-left: 23px;
            text-align: left;

            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            line-clamp: 1;
            -webkit-box-orient: vertical;
        }

        .post-content {
            font-size: 16px;
            margin-top: 0;
            margin-bottom: 10px;
            text-align: left;
            margin-left: 23px;


            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            line-clamp: 2;
            -webkit-box-orient: vertical;
        }

        .post-type {
            font-size: 16px;
            margin-top: 0;
            margin-bottom: 10px;
            color: #999;
            font-style: italic;
            text-align: right;
            margin-right: 23px;
        }

        .post-date {
            font-size: 14px;
            margin-top: 0;
            margin-bottom: 10px;
            color: #999;
            text-align: right;
            margin-right: 23px;
        }
        img{
            width: calc(100% - 25px) ; /* Two columns layout with 20px margin on both sides */
            height: 250px;
        }
        .post-page{
            text-align: center;
            clear: both;
            margin:50px;
        }
        .post-page a{
            color: white;
            text-decoration: none;
            clear: both;
            display:inline-block;
            width:70px;
            height: 40px;
            background-color: #b7c1f4;
            padding: 6px 34px;
            margin: 8px 0;
            border: none;
            border-radius: 14px;
            cursor: pointer;
            line-height: 40px;
            text-align: center;
        }
        .post-page a:hover{
            background-color: #afbaf3;
        }
        .footer {
            margin: 0 auto;
            height: 100px;
            padding: 20px;
            clear: both;
            text-align: center;
        }
        .lookdetail{
            text-decoration: none;
            display:inline-block;
            width:100px;
            background-color: #b7c1f4;
            color: white;
            padding: 6px 34px;
            margin: 8px 0;
            border: none;
            border-radius: 14px;
            cursor: pointer;
            text-align: center;
        }
        .lookdetail:hover {
            background-color: #afbaf3;
        }
    </style>
</head>
<body>
<div class="top">
    <div class="top1">
            <div class="title">
                <h1>摄区</h1>
            </div>

            <div class="menu">
                <a href="index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%--                <a href="post_list.jsp">分享</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                <a href="###">约拍</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="###">模特</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="###">摄影师</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="my.jsp">我的</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <%-- 获取request属性中的帖子列表数据和关键字 --%>
            <% List<PostInfo> postList = (List<PostInfo>) request.getAttribute("postList"); %>
            <% String keyword = (String) request.getAttribute("keyword"); %>
            <%-- 获取session中的用户对象 --%>
            <% User user = (User) request.getSession().getAttribute("user"); %>

            <%-- 显示置顶banner --%>
            <div class="login" >
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
    </div>
    <div class="top2">
        <%-- 显示搜索框，提交到PostInfoServlet的search方法，并传递关键字参数 --%>
        <div class="search" style="margin: 10px;">
            <form action="post?action=search" method="get">
                <input type="hidden" name="action" value="search">
                    <input type="text" name="keyword" value="<%= keyword %>">
                <input type="submit" value="搜索">
            </form>
        </div>
    </div>
</div>
<div class="container">
        <h1>搜索结果</h1>
        <%-- 显示帖子列表 --%>
        <h2>帖子列表</h2>

        <%-- 显示帖子类型选择框，单选框的值对应数据库中的type字段 --%>
        <div style="margin: 10px;">
            帖子类型：
            <input type="radio" name="type" value="" checked>全部
            <input type="radio" name="type" value="show">分享
            <input type="radio" name="type" value="apo">约拍
        </div>
<%-- 判断帖子列表是否为空 --%>
<% if (postList == null || postList.isEmpty()) { %>

<p>暂无帖子</p>

<% } else { %>

<%-- 遍历帖子列表，显示每个帖子的标题，内容，类型，更新时间和详情链接 --%>
<% for (PostInfo post : postList) { %>
        <div class="column" >
            <div class="post-card" style="margin: 10px; padding: 10px;">
                <img src="image/image<%=post.getPid()%>>.jpg">
                <p class="post-title"><%= post.getTitle() %></p>
                <p class="post-content"><%= post.getContent() %></p>
                <p class="post-type"><%= post.getType() %></p>
                <p class="post-date"><%= post.getTimeUpdate() %></p>

                <%-- 显示详情链接，跳转到PostInfoServlet的detail方法，并传递帖子id参数 --%>
                <a class="lookdetail" href="post?action=detail&pid=<%= post.getPid() %>">查看详情</a>

            </div>
        </div>
<% } %>

<%-- 获取request属性中的总页数和当前页码 --%>
<% int noOfPages = (Integer) request.getAttribute("noOfPages"); %>
<% int currentPage = (Integer) request.getAttribute("currentPage"); %>

        <%-- 显示分页导航栏，根据总页数和当前页码生成链接 --%>
        <div class="post-page">
            <%-- 如果当前页码不是1，显示上一页链接 --%>
            <% if (currentPage != 1) { %>
            <a href="post?action=search&keyword=<%=keyword%>&page=<%= currentPage - 1 %>">上一页</a>
            <% } %>

            <%-- 循环生成每一页的链接 --%>
            <% for (int i = 1; i <= noOfPages; i++) { %>
            <%-- 如果是当前页，不生成链接，只显示页码 --%>
            <% if (i == currentPage) { %>
            <a style="pointer-events: none;background-color: grey" href="post?action=search&keyword=<%=keyword%>&page=<%= i %>&keyword=<%= keyword %>"><%= i %></a>
            <% } else { %>
            <%-- 如果不是当前页，生成链接，传递页码和关键字参数 --%>
            <a href="post?action=search&keyword=<%=keyword%>&page=<%= i %>&keyword=<%= keyword %>"><%= i %></a>
            <% } %>
            <% } %>

            <%-- 如果当前页码不是最后一页，显示下一页链接 --%>
            <% if ( currentPage < noOfPages) { %>
            <a href="post?action=search&keyword=<%=keyword%>&page=<%= currentPage + 1 %>">下一页</a>
            <% } %>
        </div>

<% } %>
    <div class="footer">
        <p>
            广东东软学院©1997-2099|
            软件工程技术xxx： 浙网文[2018]3506-263号
        </p>
        <p>
            违法和不良信息举报电话：6666-88888|
            举报邮箱：xxx@qq.com
        </p>
        <p>
            粤E2-20090191-18工业和信息化部备案管理系统网站
        </p>
    </div>
</div>

</body>
</html>