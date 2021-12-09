<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/inc/head.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ page import="model.entity.User" %>
    <%
//スコープに保存された情報を取得
int addcount = (int) session.getAttribute("addcount");
    int done = (int) session.getAttribute("done");
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

<span style="color: transparent;">
  ${addcount }
  ${done }
</span>
<div class="Result-message">

<div class="Result-message__inner">
<h1>登録完了</h1>
<% if(addcount==1 && done==0){ %>

        <div class="addgood-icon animate__animated animate__slower animate__bounceInLeft">
        <div class="animate__animated animate__infinite animate__bounce animate__delay-3s" style="animation-duration: 2s;">
        <i class="far fa-thumbs-up"></i>
        </div>
        </div>
       <h2 class="addgood">
        登録しました
        </h2>
    <%}else if(addcount==1 && done==1){%>

	<h2><i class="fas fa-exclamation-triangle"></i>本日はすでに登録済みのようです。 </h2>

    <%}else{ %>
        <h2><i class="fas fa-exclamation-triangle"></i>登録に失敗しました </h2>
    <% } %>

<div>
<a class="grnbtn" href="Servlet?user_id=${user_id}&branch=ResultShere">SNSシェア</a>
</div>

 </div></div>
  </div></div>
  </main>
<%@ include file="/inc/footer.jsp" %>

</body>
</html>