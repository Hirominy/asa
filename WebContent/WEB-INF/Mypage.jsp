<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/inc/head.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="model.entity.User" %>
<%
//リクエストスコープに保存されたユーザー情報を取得
User user = (User) request.getAttribute("user");
%>
	<%  //sessionスコープに保存されたカウント情報を取得
	int sc = (int) session.getAttribute("sc");
	int fc = (int) session.getAttribute("fc");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ｜朝活アプリ</title>
</head>
<body>

<main>
 <%@ include file="/inc/header.jsp" %>

<div class="wrapper">

  <div class="new-container">
<div class="Result-message">

<div class="Result-message__inner">
<h1>マイページ</h1>

<div id="mypage__user-info-table_wrapper">
<p style="padding-bottom:1vw;">
ID：${user.user_id}
</p>
<table id="mypage__user-info-table_basictable">
<tr>
<td>名前</td>
<td><span>：${user.user_name}</span></td>
</tr>
<tr>
<td>パスワード</td>
<td><span>：${user.user_pass}</span></td>
</tr>
</table>
<div><a class="grn-btn" href="Servlet?branch=Update">編集</a></div>

<table id="mypage__user-info-table_countalltable">
<tr>
<td>朝活成功総数</td>
<td><span>：<c:out value="${ sc }"/></span></td>
</tr>
<tr>
<td>朝活失敗総数</td>
<td><span>：<c:out value="${ fc }"/></span></td>
</tr>
</table>
<div>
<a class="grn-btn" href="Servlet?user_id=${user_id}&branch=SelectLogAll">ログを見る</a>
</div>

</div>
</div>

</div>
 <%@ include file="/inc/bubbles.jsp" %>
  </div>
  </main>
<%@ include file="/inc/footer.jsp" %>

</body>
</html>