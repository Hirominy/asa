<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ include file="/inc/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>パスワード変更｜朝活アプリ</title>
</head>
<body>
<main>
 <%@ include file="/inc/header.jsp" %>

<div class="wrapper">

  <div class="new-container">
<div class="Result-message">

<div class="Result-message__inner">
  <h1>名前とパスワード変更</h1>

	<form action="Servlet" method="post">
			<input type="hidden" name="branch" value="UpdateUser">
			<input type="hidden" name="user_id" value="${user.user_id}">
		      	<span class="impri">User_Name</span><input type="text" name="user_name" value="${user.user_name}">
      			<span class="impri">Password</span><input type="text" name="user_pass" value="${user.user_pass}">
		<button onclick="return confirm('この内容で更新しますか？')" >変更する</button>
	</form>

	<p><a class="backbtn" href="Servlet?user_id=${user_id}&branch=GetuserDetail">
	マイページに戻る</a></p>

</div>
</div>

</div>
 <%@ include file="/inc/bubbles.jsp" %>
  </div>
  </main>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>
