<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="header__cont">

	<div class="header__cont_user-icon">
		<img src="${pageContext.request.contextPath}/img/cmn/inu.png">
	</div>

	<p id="header__cont_text">
		<a href="Servlet?user_id=${user_id}&branch=GetuserDetail">

		ログイン中：<span><c:out value="${ user_id }"/></span>

		</a>
	</p>
</div>