<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/inc/head.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="model.entity.User,java.util.List" %>
<%
//リクエストスコープに保存されたユーザー情報を取得
List<User> JudgeLog = (List<User>) request.getAttribute("JudgeLog");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>朝活ログ一覧｜朝活アプリ</title>
</head>
<body id="MyJudgeLog">

<main>
 <%@ include file="/inc/header.jsp" %>

<div class="wrapper">

  <div class="new-container">
<div class="Result-message">

<div class="Result-message__inner">

<h1>ログ一覧</h1>

<div id="mypage__user-info-table_wrapper">

<table>
<tr>
<th>ID</th>
<th>カウント</th>
<th>タイムスタンプ</th>
<th></th>
</tr>
	<c:forEach var="user" items="${JudgeLog}">

			<tr>
				<td>${user.user_name}</td>
				<td>
				<c:if test="${user.success_count>0}">
				成功
				</c:if>
				<c:if test="${user.failure_count>0}">
				失敗
				</c:if>
				　</td>
				<td>${user.datetime}</td>
				<td><a href="Servlet?count_id=${user.count_id}&branch=DeliteLog">削除</a></td>
			</tr>

		</c:forEach>
</table>
	<p><a class="backbtn" href="Servlet?user_id=${user_id}&branch=GetuserDetail">
	マイページに戻る</a></p>
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