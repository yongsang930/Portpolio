<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/nav_bar.css">
<title>Insert title here</title>
<style type="text/css">
body {
	padding: 10px;
	margin: 0px;
}
</style>
<script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
<script src="../../js/nav_bar.js" defer></script>
</head>
<body>
	<nav class="navbar">
		<div class="navbar_logo">
			<a href="/member/main"><img alt=""
				src="../../img/spider web(w).png" width="60px" height="60px"></a>
		</div>
		<ul class="navbar_menu">
			<li><a href="${pageContext.request.contextPath}/member/main">
					<b>SHOP</b>
			</a></li>
			<li><a href="/member/editForm"><b>My Page</b></a></li>
			<c:if test="${sessionScope.type==1 }">
				<li><a href="/seller/orderList"><b>Order</b></a></li>
			</c:if>
			<c:if test="${sessionScope.type==2 }">
				<li><a href="/order/myOrderList"><b>Order</b></a></li>
			</c:if>
			<li><a href="/member/logout"> <b>Logout</b></a></li>
			<li><a href="/member/calculator"> <b>Calculator</b></a></li>
		</ul>
		<div class="nav_right">
			<ul class="navbar_icons">
				<li><a href="https://twitter.com/?lang=ko"><i
						class="fab fa-twitter"></i></a></li>
				<li><a href="https://www.instagram.com/?hl=ko"><i
						class="fab fa-instagram"></i></a></li>
			</ul>
			<br> <span class="navbar_login"><button id="ash"></button>${sessionScope.id}님
				로그인 </span>
		</div>
		<a href="#" class="navbar_toogleBtn"> <i class="fas fa-bars"></i>
		</a>
	</nav>
	<c:set var="url">/seller/allList.do</c:set>
	<c:if test="${not empty url2 }">
		<c:set var="url" value="${url2 }" />
	</c:if>
	<c:if test="${sessionScope.type==1 }">
		<c:set var="path" value="/member/prodPage" />
	</c:if>
	<c:if test="${sessionScope.type==2 }">
		<c:set var="path" value="/member/prodPage" />
	</c:if>
	<c:if test="${sessionScope.type==3 }">
		<c:set var="path" value="/member/adminPage" />
	</c:if>
	<c:import url="${path}"></c:import>
</body>
</html>