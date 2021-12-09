<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
     <%@ include file="/inc/head.jsp" %>
<title>ユーザー情報更新完了｜朝活アプリ</title>
</head>
<body>
<main>
 <%@ include file="/inc/header.jsp" %>

<div class="wrapper">

  <div class="new-container">
<div class="Result-message">

<div class="Result-message__inner">

<h1>更新完了！</h1>

	<div style="margin-bottom:2vw;">
	<c:choose>
		<c:when test="${updatecount > 0}">
			次のデータを<br>変更しました。<br>
		</c:when>
		<c:otherwise>
			次のデータを変更<br>できませんでした。<br>
		</c:otherwise>
	</c:choose>
	</div>

	<table class="row" border="1">
			<tr>
			<td>名前：${updateuser.user_name}</td>
			</tr>
			<tr>
			<td>パスワード：${updateuser.user_pass}</td>
		</tr>
	</table>

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