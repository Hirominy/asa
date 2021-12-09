<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/inc/head.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン｜朝活アプリ</title>
</head>
<body id="login">
<main>
 <%@ include file="/inc/header.jsp" %>

<div class="wrapper">

  <div class="container">

<form action="Servlet" method="post">
      <span class="impri">UserID</span><input type="text" placeholder="UserID" name="user_id">
      <span class="impri">Password</span><input type="password" placeholder="Password" name="user_pass">
      <input type="hidden" name="branch" value="Login">
      <button type="submit" id="login-button">Login</button>
    </form>
    <p class="notice-text">
	Not registered? <a href="NewUser.jsp">Create an account</a>
	</p>
	<div class="btn">
	<a href="index.jsp#about" class="buck-btn">「あさかつ」とは？</a>
	</div>
  </div>


 <%@ include file="/inc/bubbles.jsp" %>
  </div>
  </main>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>