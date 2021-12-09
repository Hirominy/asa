<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    String login = (String) session.getAttribute("user_id");
    %>

<div class="footer__link">
<div class="gotop-link">
<a href="Servlet?user_id=${user_id}&branch=index">TOPへ戻る</a>
</div>

<%if(login != null) {%>
	<div class="logout-link">
		<a href="Servlet?user_id=${user_id}&branch=Logout">ログアウト</a>
	</div>
<% } %>
</div>
