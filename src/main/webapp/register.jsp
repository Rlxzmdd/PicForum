<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>用户注册</title>
  <script >
	function check(){
		return true;
	}
</script>
<style type="text/css">
  body{
    padding: 0;
    margin: 0;
    height: 100vh;
    display: flex;
    justify-content: center;
    background-color:#f7f8fe;
    background-size: cover;
    flex: 1;
    align-items: center;
  }
  .register{
    text-align: center;
    margin: 0 auto;
    width: 600px;
    height: 520px;
    background-color: #ffffff;
    border-radius: 25px;
    box-shadow: 5px 2px 35px -7px #b7c1f4;
  }
  .register h1{
    margin-top: 50px;
    color:#9ea7db;
    font-size: 45px;
    font-weight: normal;

  }
  .register_form{
    padding: 5px;
    font-weight: normal;
    line-height: 70px;
    font-size: 30px;

  }
  .register_form input{
    background-color: transparent;
    width: 320px;
    padding: 2px;
    text-indent: 2px;
    color: #000000;
    font-size: 20px;
    height: 45px;
    margin: 30px 30px 30px 5px;
    outline: none;
    border: 0;
    border-bottom: 1px solid rgb(150, 220, 255);
  }
  input::placeholder{
    font-weight: 100;
    font-size: 24px;
    font-style: italic;
  }
  .register_btn{
    border: 1px solid rgb(255, 255, 255);
    padding: 10px;
    width: 200px;
    height: 60px;
    background-color: #b7c1f4;
    border-radius: 30px;
    font-size: 30px;
    font-weight: 100;
    margin-top: 15px;
  }
  .register_btn:hover{
    box-shadow: 2px 2px 15px 2px rgb(120, 130, 255);
    background-color: transparent;
    background-color: #b7c1f4;
  }
  .register_jum{
    margin: 5px;
  }
</style>
</head>
<body>
<div class="register">
<h1>用户注册</h1>
<%-- 显示注册表单，提交到UserServlet的register方法 --%>
<div class="register_form">
<form action="user?action=register" method="post">
<input type="text" name="username" placeholder="用户名"><br/>
<input type="password" name="password" placeholder="密码"><br/>
  <button class="register_btn" >注 &nbsp;&nbsp;册</button>
</form>
</div>
<div class="register_jum">
<%-- 显示登录链接，跳转到login.jsp页面 --%>
<a href="login.jsp">已有账号？点击登录</a >
</div>
</div>
</body>
</html>