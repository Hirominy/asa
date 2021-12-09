<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ include file="/inc/head.jsp" %>
    <%@ page import="model.entity.User" %>
     <%
//スコープに保存された情報を取得
User user = (User) request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成否入力｜朝活アプリ</title>
</head>
<body id="Judge">
<main>
 <%@ include file="/inc/header.jsp" %>

<%if(user.getSuccess_count() ==1 || user.getFailure_count() ==1){ %>
  <div class="Result-message">

<div class="Result-message__inner">
	<p style="margin-bottom:2vw;">
	本日は朝活済みのようです。<br>
	どうかご自愛くださいませ。
	</p>

<div>
	<a class="grn-btn" href="Servlet?user_id=${user_id}&branch=ResultShere">SNSシェア</a>
</div>
</div>

</div>

	<%}else{ %>

	<section id="asakatsu__judge_seccess">
	<div class="asakatu__desc">▼ 朝活に「<i class="fas fa-check-circle"></i> 成功」した場合はこちら</div>
		<form action="Servlet" method="get">
			<input type="hidden" name="branch" value="Judge">
			<input type="hidden" name="judge" value="s">
			<button type="submit" class="btn btn--circle btn--success"><i class="fas fa-check-circle"></i>Success</button>
		</form>

	</section>

	<section id="asakatsu__judge_failure">
	<div class="asakatu__desc">▼ 朝活に「<i class="fas fa-times-circle"></i> 失敗」した場合はこちら</div>
		<form action="Servlet" method="get">
			<input type="hidden" name="branch" value="Judge">
			<input type="hidden" name="judge" value="f">
			<button type="submit" class="btn btn--circle btn--failure"><i class="fas fa-times-circle"></i>Failure</button>
		</form>
	</section>

		<%} %>

 </main>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>