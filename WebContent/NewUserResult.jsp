<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/inc/head.jsp" %>
    <%
    int addcount = (int) session.getAttribute("addcount");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録完了！｜朝活アプリ</title>
</head>
<body>

<main>
 <%@ include file="/inc/header.jsp" %>

<div class="wrapper">

  <div class="new-container">
<div class="Result-message">

<div class="Result-message__inner">
<h1>ユーザー登録完了！</h1>
<p>
<% if(addcount == 1){ %>
        登録完了しました。<br>
        早速朝活をはじめましょう！
        </p>
        <a class="grn-btn" href="login.jsp">ログイン</a>
    <%}else{ %>
        登録できませんでした。<br>
        お手数ですが、再度登録を試みてください。
        </p>
        <a class="grn-btn" href="NewUser.jsp">新規登録</a>
    <% } %>


  </div>
  </div>
</div>
 <%@ include file="/inc/bubbles.jsp" %>
  </div>
  </main>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>