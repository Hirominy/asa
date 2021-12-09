<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
	String loginh = (String)session.getAttribute("user_id");
    %>

<header>

<div class="logo-img">
	<a href="Servlet?user_id=${user_id}&branch=index">
		<img src="${pageContext.request.contextPath}/img/cmn/logo.svg" alt="毎朝の習慣を記録　あさかつ　-asawin-"  />
	</a>
</div>

   <% if(loginh != null){ %>
    	<%@ include file="/WEB-INF/inc/header-login_user.jsp" %>
    <%}%>

</header>