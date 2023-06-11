<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.picforum.model.User" %>
<%@ page import="com.example.picforum.model.PostInfo" %>
<%@ page import="com.example.picforum.model.PostInfoReply" %>
<%@ page import="com.example.picforum.dao.UserDao" %>
<%@ page import="com.example.picforum.dao.PostInfoDao" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>我的信息</title>
    <style>
        /* 边框、内边距和外边距 */
        * {
            /*box-sizing: border-box;*/
        }
        .container{
            margin: 50px auto;
            max-width: 800px;
        }
        /* Center the content in the page */
        body {
            /*justify-content: center;*/
            background-color: #f7f8fe;
            margin: 0;
            padding: 0;

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
            color: gray;
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




        /* Style the cards */
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            padding: 20px;
            background-color: #fff;
            text-align: center;
        }

        /* Add some margin between columns */
        .column {
            margin: 10px;
        }

        /* Style the form */
        form {
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
        }

        .card input[type="text"], input[type="password"] {
            padding: 5px;
            margin: 13px;
            font-size: 18px;
            border-radius: 5px;
            background-color:  #fff;
            width: 250px;
            border-color: #cccccc;
        }
        .card input[type="text"]:hover, input[type="password"]:hover{
            background-color:  #f7f8fe;
        }
        .card input[type="submit"] {
            display: block;
            width: 20%;
            margin: 20px auto;
            padding: 10px;
            background-color: #b7c1f4;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .card input[type="submit"]:hover {
            background-color: #afbaf3;
        }
        /* Post card styling */
        .post-card {
            border-radius: 10px;
            box-shadow: 1px 2px 4px rgba(0, 0, 0, 0.3);
            background-color: #fff;
            padding: 20px;
            margin: 10px;
            width: calc((100% - 40px) / 2); /* Two columns layout with 20px margin on both sides */
            height: 500px;
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

            display: inline-block;
            white-space: nowrap;
            width: 100%;
            overflow: hidden;
            text-overflow:ellipsis;
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
        .reply-card {
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            background-color: white;
            border-radius: 10px;
            text-align: center;
            display: block;
            clear: both;
        }
        .reply-card:hover {
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
        }

        .reply-content {
            font-size: 16px;
            font-weight: bold;
            text-align: left;
        }

        .reply-date {
            font-size: 14px;
            color: #808080;
            text-align: right;
        }
        a{
            text-decoration: none;
            color: black;
        }
        .delete{
            text-decoration:none;
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
        .delete:hover {
            background-color: #afbaf3;
        }
        img{
            /*width: calc(100% - 25px) ; !* Two columns layout with 20px margin on both sides *!*/

            max-height: 250px;
        }
    </style>
</head>
<body>
<div class="top" >
    <div class="bg">
        <div class="top1">
            <div class="title">
                <h1>摄区</h1>
            </div>

            <div class="menu">
                <a href="index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="post_list.jsp">分享</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="###">约拍</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="###">模特</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="###">摄影师</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="my.jsp">我的</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <%-- 获取session中的用户对象 --%>
            <% User user = (User) request.getSession().getAttribute("user"); %>

            <%-- 显示置顶banner --%>
            <div class="login">
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
                    <input type="text" name="keyword" placeholder="请输入关键词进行搜索">
                    <input type="submit" value="搜索">
                </form>
            </div>
        </div>
    </div>
</div>


<div class="container ">
<h2>我的信息</h2>
<%-- 显示修改用户信息的表单，提交到UserServlet的update方法 --%>
<div class="row">
    <div class="column">
        <div class="card">
            <%-- 获取session中的用户对象 --%>
            <%  user = (User) request.getSession().getAttribute("user"); %>
            <%-- 判断用户是否登录 --%>
            <% if (user == null) { %>
            <%-- 未登录，跳转到登录页面 --%>
            <script>alert("请先登录");
            location.href = "login.jsp";</script>
            <% } else { %>
            <%-- 已登录，显示用户信息 --%>
                <table align="center">
                    <tr><td align="right"><p>用户名：<p></td><td><p><%= user.getUsername() %>
                    </p></td></tr>
                    <tr><td align="right"><p>注册时间：<p></td><td><p><%= user.getTimeRegister() %>
                    </p></td></tr>
                    <tr><td align="right"><p>最后登录时间：<p></td><td><p><%= user.getTimeLastLogin() %>
                    </p></td></tr>
                </table>
        </div>
    </div>
    <h2>修改我的信息</h2>

        <div class="card">
            <table align="center">

                <form action="user?action=update" method="post">
                    <%-- 隐藏域，传递用户id --%>
                    <input type="hidden" name="uid" value="<%= user.getUid() %>">
                        <tr><td align="right">用户名：</td><td><input type="text" name="username" value="<%= user.getUsername() %>"></td></tr><br/>
                        <tr><td align="right">密码：</td><td><input type="password" name="password" value="<%= user.getPassword() %>"></td></tr><br/>
                        <tr><td colspan="2"><input type="submit" value="保存"></td></tr>
                </form>
            </table>
        </div>

</div>



<%-- 创建数据库操作对象 --%>
<% PostInfoDao postInfoDao = new PostInfoDao(); %>

<%-- 显示用户发布的帖子列表 --%>
<h2>我的帖子</h2>
<%-- 调用数据库操作类，查询用户发布的帖子数据 --%>
<% List<PostInfo> postList = postInfoDao.getPostListByPostUid(user.getUid()); %>

<%-- 判断帖子列表是否为空 --%>
<% if (postList == null || postList.isEmpty()) { %>
    <div class="reply-card" style="margin: 10px; padding: 10px;"><p>暂无帖子</p></div>
<% } else { %>
<%-- 遍历帖子列表，显示每个帖子的标题，内容，类型，更新时间和删除链接 --%>
<% for (PostInfo post : postList) { %>
    <div class="column" >
    <a href="post?action=detail&pid=<%= post.getPid() %>">
<div class="post-card"style="margin: 10px; padding: 10px;">
      <img src="image/image1.jpeg">
        <p class="post-title"><%= post.getTitle() %>
        </p>
        <p class="post-content"><%= post.getContent() %>
        </p>
        <p class="post-type"><%= post.getType() %>
        </p>
        <p class="post-date"><%= post.getTimeUpdate() %>
        </p>

    <%-- 显示删除链接，跳转到PostInfoServlet的delete方法，并传递帖子id参数 --%>
    <a class="delete" href="PostInfoServlet?method=delete&pid=<%= post.getPid() %> ">删除</a>

</div>
    </a>
    </div>

<% } %>

<% } %>

    <%-- 显示用户发布的回复列表 --%>
    <h2 style="clear: both">我的回复</h2>

    <%-- 调用数据库操作类，查询用户发布的回复数据 --%>
    <% List<PostInfoReply> replyList = postInfoDao.getPostReplyByPostUid(user.getUid()); %>

    <%-- 判断回复列表是否为空 --%>
    <% if (replyList == null || replyList.isEmpty()) { %>
    <div class="reply-card" style="margin: 10px; padding: 10px;">
         <p>暂无回复</p>
    </div>
    <% } else { %>

    <%-- 遍历回复列表，显示每条回复的内容，更新时间和删除链接 --%>
    <% for (PostInfoReply reply : replyList) { %>

    <div class="reply-card" style="margin: 10px; padding: 10px;">
        <p class="reply-content">回复内容：<%= reply.getContent() %>
        </p>
        <p class="reply-date"><%= reply.getTimeUpdate() %>
        </p>
        <%-- 显示删除链接，跳转到PostInfoServlet的deleteReply方法，并传递回复id参数 --%>
        <a class="delete" href="PostInfoServlet?method=deleteReply&rid=<%=reply.getRid()%>">删除</a>
    </div>

    <% } %>

    <% } %>

    <% } %>
</div>
</body>
</html>