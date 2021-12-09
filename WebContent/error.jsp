<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/inc/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン失敗｜朝活アプリ</title>
</head>
<body>

<main>
 <%@ include file="/inc/header.jsp" %>

<div class="wrapper">

  <div class="new-container">
<h1>ログイン失敗</h1>

<p>
IDとパスワードが照合できませんでした。
</p>

<ul>
<li>Caps Lockがオンになっていませんか？</li>
<li>IDとパスワードの入力が間違っていませんか？</li>

</ul>

<p>
お手数ですが、トップに戻って再度ログインをお試しください。
</p>
<a href="Servlet" class="buck-btn">トップに戻る</a>
</div>

 <%@ include file="/inc/bubbles.jsp" %>
  </div>
  </main>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>