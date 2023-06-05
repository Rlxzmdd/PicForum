<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.picforum.model.User" %>
<%@ page import="com.example.picforum.model.PostInfo" %>
<%@ page import="com.example.picforum.dao.PostInfoDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %>
<html>
<head>
    <title>首页</title>
    <%-- 引入jQuery的js文件 --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>首页</h1>
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

<%-- 显示发表帖子按钮，跳转到post_add.jsp页面 --%>
<div style="margin: 10px;">
    <a href="post_add.jsp">发表帖子</a>
</div>

<%-- 显示搜索框，提交到PostInfoServlet的search方法，并传递关键字参数 --%>
<div style="margin: 10px;">
    <form action="post?action=search" method="get">
        <input type="hidden" name="action" value="search">
        搜索：<input type="text" name="keyword">
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

<%-- 创建数据库操作对象 --%>
<% PostInfoDao postInfoDao = new PostInfoDao(); %>

<%-- 调用数据库操作类，查询第一页（每页10条）的所有帖子数据 --%>
<% List<PostInfo> postList = postInfoDao.getPostListByPage(1, 10); %>

<%-- 判断帖子列表是否为空 --%>
<% if (postList == null || postList.isEmpty()) { %>

<p>暂无帖子</p>

<% } else { %>

<%-- 遍历帖子列表，显示每个帖子的标题，内容，类型，更新时间和详情链接 --%>
<% for (PostInfo post : postList) { %>

<div style="border: 1px solid black; margin: 10px; padding: 10px;">
    <p>标题：<%= post.getTitle() %></p>
    <p>内容：<%= post.getContent() %></p>
    <p>类型：<%=Objects.equals(post.getType(), "show") ?"分享":"约拍" %></p>
    <p>更新时间：<%= post.getTimeUpdate() %></p>

    <%-- 显示详情链接，跳转到PostInfoServlet的detail方法，并传递帖子id参数 --%>
    <a href="post?action=detail&pid=<%= post.getPid() %>">查看详情</a>

</div>

<% } %>
<%--todo: 代码还需要改进，目前问题很大--%>
<%-- 绑定滚动事件，发送ajax请求，获取下一页的帖子数据，并追加到页面中 --%>
<script>
    var loadMoreBtn = $("#loadMore");
    // 获取帖子类型选择框元素
    var typeRadio = $("input[name='type']");
    // 定义当前页码变量，初始为1
    var currentPage = 1;
    // 定义每页显示条数变量，与后台保持一致
    var pageSize = 10;

    // 给window绑定滚动事件
    $(window).scroll(function () {
        // 判断是否滚动到底部
        if ($(window).scrollTop() + $(window).height() === $(document).height()) {
            // 增加当前页码
            currentPage++;
            // 获取选择的帖子类型
            var type = typeRadio.filter(":checked").val();
            // 发送ajax请求，传递当前页码和帖子类型参数
            $.get("post?action=listByPage", {page: currentPage, type: type}, function (data) {
                // 判断返回的数据是否为空或空数组
                if (data == null || data.length === 0) {
                    // 如果为空，隐藏加载更多按钮，显示没有更多数据的提示
                    loadMoreBtn.hide();
                    alert("没有更多数据了");
                } else {
                    // 如果不为空，遍历返回的数据，拼接成html字符串，并追加到页面中
                    var html = "";
                    for (var i = 0; i < data.length; i++) {
                        var post = data[i];
                        html += '<div style="border: 1px solid black; margin: 10px; padding: 10px;">';
                        html += '<p>标题：' + post.title + '</p>';
                        html += '<p>内容：' + post.content + '</p>';
                        html += '<p>类型：' + post.type + '</p>';
                        html += '<p>更新时间：' + post.timeUpdate + '</p>';
                        html += '<a href="post?action=detail&pid=' + post.pid + '">查看详情</a>';
                        html += '</div>';
                    }
                    $(html).insertBefore(loadMoreBtn);
                }
            }, "json");
        }
    });
</script>

<% } %>


</body>
</html>