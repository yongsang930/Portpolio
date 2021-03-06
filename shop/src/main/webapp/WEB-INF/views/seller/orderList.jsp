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
			<br> <span class="navbar_login"><button id="ash"></button>${sessionScope.id}๋
				๋ก๊ทธ์ธ </span>
		</div>
		<a href="#" class="navbar_toogleBtn"> <i class="fas fa-bars"></i>
		</a>
	</nav>
	<div id="container">
		<div id="list">
			<h3>${sessionScope.id}๋์ ํ๋งคํํฉ</h3>
			<div id="content">
				<c:if test="${empty o_list }">	ํ์ฌ ์ฃผ๋ฌธ ์์</c:if>
				<c:if test="${not empty o_list }">
					<table border="1">
						<tr>
							<th>๊ตฌ๋งค์ ์์ด๋</th>
							<th>์ผ๋?จ๋ฒํธ</th>
							<th>์?ํ๋ช</th>
							<th>์?ํ๋ฒํธ</th>
							<th>์๋?น์ธ</th>
							<th>์๋?น์ธ ์?ํ๋ฒํธ</th>
							<th>๋ฐฐ์ก์ง</th>
							<th>๊ตฌ๋งค ์๋</th>
							<th>์ด ๊ธ์ก</th>
							<th>์ฃผ๋ฌธํ์</th>
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
									<td>๋ฐฐ์ก์ค๋น์ค</td>
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