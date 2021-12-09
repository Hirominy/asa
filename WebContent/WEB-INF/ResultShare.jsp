<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/inc/head.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ page import = "model.entity.User"%>
	<%  //sessionスコープに保存されたカウント情報を取得
	int count = (int) session.getAttribute("count");
	int sc = (int) session.getAttribute("sc");
	int fc = (int) session.getAttribute("fc");
	User user = (User) request.getAttribute("user");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNSシェア｜朝活アプリ</title>
</head>
<body>
<main>
 <%@ include file="/inc/header.jsp" %>

<div class="wrapper">

  <div class="new-container">

<div class="Result-message">

<div class="Result-message__inner">
<h1>朝活シェア</h1>

<div class="Result-message__inner_text">

<%if(user.getSuccess_count() ==1 && user.getFailure_count() ==0){ %>
        <p>朝活やってえらい！</p>
    <%}else{ %>
        <p>朝活失敗もカウントしてえらい！</p>
    <% } %>


<p class="count-day">
朝活 <span> ${count} </span>日目
</p>

<p class="success-per">
	成功率 <span> <fmt:formatNumber maxFractionDigits="1" value="${ sc / count * 100 }"/> </span> ％
</p>
</div>

<!--以下twitter-->
<div>
<a href="https://twitter.com/share?
text=
朝活<c:out value="${ count }"/>日目%0a
<% if(user.getSuccess_count() ==1 && user.getFailure_count() ==0){ %>朝活成功！%0a<%}else{ %>朝活失敗%0a<% } %>
成功率<fmt:formatNumber maxFractionDigits="1" value="${ sc / count * 100 }"/> ％ %0a%0a
おはようございます！%0a
今日も頑張っていきましょう！%0a&
hashtags=朝活%0a,朝活で繋がりたい%0a&
url= https://hirominy.com/asawin/%0a&
  rel="nofollow"
  target="_blank" class="btn-social-isometric">
  <span class="btn-social-isometric-icon btn-social-isometric-icon--twitter">
    <i class="fab fa-twitter"></i>
  </span>
  <span class="btn-social-isometric-text">TWEET</span>
</a>
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