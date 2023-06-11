<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.picforum.model.User" %>
<html>
<head>
    <title>发表帖子</title>
    <%-- 引入富文本编辑器的js文件 --%>
    <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
    <style type="text/css">
        body {
            background-color:#f7f8fe;
            font-family: Arial, sans-serif;
        }

        .start {

            max-width: 600px;
            margin:100px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 25px;
            box-shadow: 5px 2px 35px -7px #b7c1f4;

        }

        .start_1 {
            margin-top: 20px;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: solid 1px #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="radio"] {
            margin-right: 10px;
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
            margin: 20px 20px 20px 192px;
            cursor: pointer;
            border-radius: 5px;
            border: none;

        }
        a:hover {
            background-color: #afbaf3;
        }
        /* CKEditor styles */
        .cke {
            border: none !important;
        }

        .cke_panel_listItem:hover,
        .cke_button:hover,
        .cke_button:focus,
        .cke_button_on {
            background-color: #fff !important;
        }

    </style>
</head>
<body>
<div class="start">
    <h1>发表帖子</h1>
    <%-- 获取session中的用户对象 --%>
    <% User user = (User) request.getSession().getAttribute("user"); %>

    <%-- 判断用户是否登录 --%>
    <% if (user == null) { %>
    <%-- 未登录，跳转到登录页面 --%>
    <script>alert("请先登录");location.href="login.jsp";</script>
    <% } else { %>
    <%-- 已登录，显示发表帖子的表单，提交到PostInfoServlet的add方法 --%>
    <div class="start_1">

        <form action="post?action=add" method="post">
            <%-- 隐藏域，传递用户id和用户名 --%>
            <input type="hidden" name="postUid" value="<%= user.getUid() %>">
            <input type="hidden" name="postName" value="<%= user.getUsername() %>">
            标题：<input type="text" name="title"><br/>
            类型：<input type="radio" name="type" value="show" checked>分享
            <input type="radio" name="type" value="apo">约拍<br/>
            内容：<textarea  name="content" id="content"></textarea><br/>
                <a href="index.jsp" >返回</a>
            <input type="submit" value="发表">

        </form>
    </div>
    <%-- 使用富文本编辑器替换内容文本域 --%>
    <script>CKEDITOR.replace('content');</script>

    <% } %>
</div>
</body>
</html>