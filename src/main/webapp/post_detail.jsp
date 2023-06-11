<%@ page import="com.example.picforum.model.PostInfo" %>
<%@ page import="com.example.picforum.model.PostInfoReply" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>帖子详情</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color:#f7f8fe;
        }

        .container {
            margin: 50px auto;
            max-width: 800px;
            color: #444;
            font-size: 16px;
            line-height: 1.5;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 25px;
            box-shadow: 5px 2px 35px -7px #b7c1f4;
        }

        .title {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .content {
            white-space: pre-wrap;
            word-wrap: break-word;
            margin-bottom: 20px;
        }

        .type {
            font-style: italic;
            margin-bottom: 10px;
        }

        .sendP,
        .time {
            text-align: right;
            margin-bottom: 20px;
        }
        .time,.replyTime{
            color: darkgrey;
        }
        .list {
            border-bottom: 1px solid #eee;
            margin-bottom: 20px;
            padding-bottom: 20px;
        }

        .reply{
            white-space: pre-wrap;
            word-wrap: break-word;
            margin-bottom: 10px;
        }

        .replyP,
        .replyTime {
            text-align: right;
        }

        form {
            margin-top: 30px;
        }

        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: vertical;
        }


        img{
            max-width: 100%;
            max-height: 700px;
            margin:0 auto;
        }
        .img_container {
            white-space: nowrap;
            overflow-x: auto;
        }

        .item {
            display: inline-block;
            margin-right: 20px;
            align-content: center;
        }
        input[type="submit"] {

            display: inline-block;
            padding: 10px 20px;
            background-color: #b7c1f4;
            color: white;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            margin: 20px ;
            cursor: pointer;
            border-radius: 5px;
            border: none;



        }

        input[type="submit"]:hover {
            background-color: #afbaf3;
        }

        a{

            display: inline-block;
            padding: 10px 20px;
            background-color: #b7c1f4;
            color: white;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            margin: 20px 20px 20px 290px;
            cursor: pointer;
            border-radius: 5px;
            border: none;

        }
        a:hover {
            background-color: #afbaf3;
        }
    </style>

</head>
<body>
<div class="container">
    <!-- 帖子详情内容 -->


<%-- 获取request中的帖子数据和回复数据 --%>
<% PostInfo post = (PostInfo) request.getAttribute("post"); %>
<% List<PostInfoReply> replyList = (List<PostInfoReply>) request.getAttribute("replyList"); %>

<%-- 显示帖子标题，内容，类型，发帖用户名和更新时间 --%>

<div class="img_container">
        <div class="item"><img src="image/image<%=post.getPid()%>.jpg" /></div>
<%--        <div class="item"><img src="image/image2.jpg" /></div>--%>
<%--        <div class="item"><img src="image/image1.jpg" /></div>--%>
</div>
<p class="title"><%= post.getTitle() %>
</p>
<p class="content"><%= post.getContent() %></p>
<p class="type"><%= post.getType() %>
</p>
 <div class="right">
<p class="sendP"><%= post.getPostName() %>
</p>
<p class="time"><%= post.getTimeUpdate() %>
</p>
</div>

<%-- 显示回复列表 --%>

<h2>回复列表</h2>
<%-- 判断回复列表是否为空 --%>
<% if (replyList == null || replyList.isEmpty()) { %>
<p >暂无回复</p>
<% } else { %>
<%-- 遍历回复列表，显示每条回复的内容，回复用户名和更新时间 --%>
<% for (PostInfoReply reply : replyList) { %>
<div class="list">
    <p class="reply"><%= reply.getContent() %></p>
    <div class="right">
    <p class="replyP"><%= reply.getPostName() %>
    </p>
    <p class="replyTime"><%= reply.getTimeUpdate() %>
    </p>
    </div>
</div>

<% } %>
<% } %>

<%-- 显示添加回复的表单，提交到PostInfoServlet的reply方法 --%>
<h2>添加回复</h2>
<form action="post?action=reply" method="post">
    <%-- 隐藏域，传递帖子id --%>
    <input type="hidden" name="pid" value="<%= post.getPid() %>">
    <textarea name="content" id="content" rows="5" cols="50"></textarea><br/>
        <a href="index.jsp" >返回</a>
    <input type="submit" value="确定">
</form>

<%-- 使用富文本编辑器替换内容文本域 --%>
<script>CKEDITOR.replace('content');</script>
</div>
</body>
</html>