<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/nav_bar.css">
<script src="https://kit.fontawesome.com/2d323a629b.js"
	crossorigin="anonymous"></script>
<script src="../../js/nav_bar.js" defer></script>
<title>Insert title here</title>
<style type="text/css">
#container {
	display: flex;
	justify-content: center;
	margin-top: 10px;
}

#list {
	border: 1px solid #dae1e6;
	border-width: 1px;
	padding: 10px 10px 10px 10px;
}

h3 {
	display: flex;
	justify-content: center;
	padding: 10px, 0px, 0px, 0px;
	margin: 0px;
}

table {
	width: 1100px;
	padding-top: 10px;
	text-align: center;
	border-style: none;
}

th, td {
	padding: 10px 7px;
	font-size: 15px;
}
</style>
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
	<div id="container">
		<div id="list">
			<c:if test="${empty list }">
				<h3>주문내역이 없습니다.</h3>
			</c:if>
			<c:if test="${not empty list }">
				<h3>${sessionScope.id}님의 주문내역</h3>
				<table border="1">
					<tr>
						<th>일련번호</th>
						<th>제품명</th>
						<th>주문수량</th>
						<th>결제금액</th>
						<th>수령인</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>판매자 아이디</th>
					</tr>
					<c:forEach var="o" items="${list }">
						<tr>
							<td>${o.p.num }</td>
							<td>${o.p.name }</td>
							<td>${o.quantity }</td>
							<td>${o.p.price }</td>
							<td>${o.recipient}</td>
							<td>${o.tel }</td>
							<td>${o.road_a } ${o.detail_a }</td>
							<td>${o.seller_id }</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
	</div>
</body>
</html>