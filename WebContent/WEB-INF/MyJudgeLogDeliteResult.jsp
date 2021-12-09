<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ include file="/inc/head.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    	<%  //sessionスコープに保存されたカウント情報を取得
	int delitedone = (int) request.getAttribute("delitedone");
    	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログを削除しました｜朝活アプリ</title>
</head>
<body>
<main>
 <%@ include file="/inc/header.jsp" %>

<div class="wrapper">

  <div class="new-container">

  <div class="Result-message">

<div class="Result-message__inner">
${delitedone }



<%if(delitedone==1){ %>
        <h3>ログを削除しました。</h3>
    <%}else{ %>
        <h3>ログを削除できませんでした。</h3>
    <% } %>

<p><a class="backbtn" href="Servlet?user_id=${user_id}&branch=SelectLogAll">ログ一覧に戻る</a></p>
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