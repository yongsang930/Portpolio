<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/nav_bar.css">
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
	width: 100%;
	padding-top: 10px;
	text-align: center;
	border-style: none;
}

th, td {
	padding: 10px 7px;
	font-size: 15px;
	height: 50px;
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
					<b>Home</b>
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
			<h3>${sessionScope.id}님의 판매현황</h3>
			<div id="content">
				<c:if test="${empty o_list }">	현재 주문 없음</c:if>
				<c:if test="${not empty o_list }">
					<table border="1">
						<tr>
							<th>구매자 아이디</th>
							<th>일련번호</th>
							<th>제품명</th>
							<th>제품번호</th>
							<th>수령인</th>
							<th>수령인 전화번호</th>
							<th>배송지</th>
							<th>구매 수량</th>
							<th>총 금액</th>
							<th>주문타입</th>
						</tr>
						<c:forEach var="o" items="${o_list }">
							<tr>
								<td>${o.consumer_id }</td>
								<td>${o.num }</td>
								<td>${o.p.name }</td>
								<td>${o.pro_num }</td>
								<td>${o.recipient }</td>
								<td>${o.tel }</td>
								<td>${o.road_a}${o.detail_a}</td>
								<td>${o.quantity }</td>
								<td>${o.quantity * o.p.price}</td>
								<c:if test="${o.result==1}">
									<td>배송준비중</td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>