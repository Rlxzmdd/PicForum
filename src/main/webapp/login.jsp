<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
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
        .login{
        text-align: center;
        margin: 0 auto;
        width: 600px;
        height: 520px;
        background-color: #ffffff;
        border-radius: 25px;
        box-shadow: 5px 2px 35px -7px #b7c1f4;
    }
     .login h1{
        margin-top: 50px;
        color:#9ea7db;
        font-size: 45px;
        font-weight: normal;
        
    }
    .login_form{
       padding: 5px;
       font-weight: normal;
       line-height: 70px;
       font-size: 30px;

    }
    .login_form input{
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
     .login_btn{
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
    .login_btn:hover{
        box-shadow: 2px 2px 15px 2px rgb(120, 130, 255);
        background-color: transparent;
       background-color: #b7c1f4;
       }
    .login_jum{
		margin: 20px;
	}
</style>
</head>

<body>
<div  class="login">
		<h1>用户登录</h1>
<%-- 显示登录表单，提交到UserServlet的login方法 --%>
	<div class="login_form">
		<form action="user?action=login" method="post">
    	<input type="text" name="username" placeholder="用户名" ><br/>
    	<input type="password" name="password" placeholder="密码" ><br/>
    	<button class="login_btn" >登 &nbsp;&nbsp;录</button>
	</form>
	</div>
<%-- 显示注册链接，跳转到register.jsp页面 --%>
	<div  class="login_jum">
	<a href="register.jsp">还没有账号？点击注册</a >
	</div>
</div>
</body>
</html>
