<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/inc/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規登録｜朝活アプリ</title>
</head>
<body>
<main>
 <%@ include file="/inc/header.jsp" %>

<div class="wrapper">

  <div class="new-container">
  <div class="Result-message">

<div class="Result-message__inner">

<h1>新規登録</h1>

<form action="Servlet" method="post">

<span>ユーザー名 *後から変更できません</span><input type="text" name="user_id"><br>
<span>ニックネーム</span><input type="text" name="user_name"><br>
<span>パスワード</span><input type="password" name="user_pass"><br>

<button type="submit" name="branch" value="AddNewUser">新規登録</button>

</form>
  </div>
    </div>
      </div>
 <%@ include file="/inc/bubbles.jsp" %>
  </div>
  </main>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>