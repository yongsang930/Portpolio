<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/nav_bar.css">
<script src="../../js/nav_bar.js" defer></script>
<script src="https://kit.fontawesome.com/2d323a629b.js"
	crossorigin="anonymous"></script>
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
	width: 800px;
	padding-top: 10px;
	text-align: center;
	border-style: none;
}

th, td {
	padding: 10px 7px;
	font-size: 15px;
	height: 50px;
}

#deliInfo {
	margin-top: 20px;
}

#deliInfo input {
	width: 100%;
	height: 100%;
	font-size: 15px;
	border: 0px;
}

textarea {
	width: 100%;
	height: 100%;
	border: 0px;
}

#btn {
	text-align: center;
}

button {
	margin-top: 5px; font-size : 17px;
	background-color: rgb(0, 110, 71);
	border-radius: 5px 5px;
	padding: 4px 5px;
	border: none;
	font-weight: bold;
	color: white;
	font-size: 17px;
}

button:hover {
	background-color: rgba(0, 110, 71, 0.8);
	transition: 0.3s;
	cursor: pointer;
	padding: 5px 6px;
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
			<li><a href="/member/main"> <b>SHOP</b>
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
			<div id="orderInfo">
				<h3>주문자 정보</h3>
				<table border="1">
					<tr>
						<th>상품명</th>
						<th>구매자</th>
						<th>주문수량</th>
						<th>가격</th>
						<th>결제금액</th>
					</tr>
					<tr>
						<td>${order.p.name }</td>
						<td>${sessionScope.id }</td>
						<td>${order.quantity }</td>
						<td>${order.p.price }</td>
						<td>${order.quantity * order.p.price}</td>
					</tr>
				</table>
			</div>
			<div id="deliInfo">
				<form action="/order/order2" method="post">
					<h3>배송지 정보 입력</h3>
					<table border="1">
						<tr>
							<th>수령인</th>
							<td><input type="text" name="recipient" required></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="tel" required></td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td><input type="text" name="post_a" required></td>
						</tr>
						<tr>
							<th>도로명주소</th>
							<td><input type="text" name="road_a" required></td>
						</tr>
						<tr>
							<th>상세주소</th>
							<td><input type="text" name="detail_a" required></td>
						</tr>
						<tr>
							<th>배송메세지</th>
							<td><textarea rows="10" cols="35" name="memo" required></textarea></td>
						</tr>
					</table>
					<input type="hidden" name="consumer_id" value="${sessionScope.id }">
					<input type="hidden" name="seller_id" value="${order.seller_id }">
					<input type="hidden" name="pro_num" value="${order.pro_num}">
					<input type="hidden" name="quantity" value="${order.quantity}">
					<input type="hidden" name="result" value="1">
					<div id="btn">
						<button type="reset">초기화</button>
						<button type="submit">결제</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>