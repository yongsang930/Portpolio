<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/nav_bar.css">
<script src="../../js/nav_bar.js" defer></script>
<script src="https://kit.fontawesome.com/2d323a629b.js"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		$(".img").mouseover(function() {
			$("#bigImg").attr('src', this.src);
		});
		$("#del").click(function() {
			$("#f1").attr('action', '/seller/del');
			$("#f1").submit();
		});
	});
</script>
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
	margin-top: 20px;
	text-align: center;
	border-style: none;
	border-collapse: collapse;
	border-spacing: 0px;
	border-color: rgba(0, 0, 0, 0.7);
}

th, td {
	padding: 10px 7px;
	font-size: 15px;
}

#inTable {
	padding: 0;
	margin: 0;
	border: 0;
}

input {
	width: 100%;
	border: 0px;
	font-size: 15px;
	text-align: center;
}

button {
	margin-top: 5px;
	font-size: 17px;
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
			<h3>상품 상세 정보</h3>
			<form id="f1" action="/seller/edit" method="post">
				<input type="hidden" name="num" value="${p.num }">
				<table border="1">
					<tr>
						<th>상품명</th>
						<td><input type="text" name="name" value="${p.name }"></td>
					</tr>
					<tr>
						<th>이미지</th>
						<td><c:if test="${empty file0 }">
					등록된 이미지가 없습니다.
					</c:if> <c:if test="${not empty file0 }">
								<table id="inTable">
									<tr>
										<td rowspan="3" colspan="1"><img id="bigImg"
											src="/img?fname=${file0 }&num=${p.num }"
											style="width: 418px; height: 625.7px"></td>
										<td><img src="/img?fname=${file0 }&num=${p.num }"
											class="img" width="130" height="195"></td>
									</tr>
									<tr>
										<td><img src="/img?fname=${file1 }&num=${p.num }"
											class="img" width="130" height="195"></td>
									</tr>
									<tr>
										<td><img src="/img?fname=${file2 }&num=${p.num }"
											class="img" width="130" height="195"></td>
								</table>
							</c:if></td>
					</tr>
					<tr>
						<th>제품설명</th>
						<td><input type="text" name="info" value="${p.info }"></td>
					</tr>
					<tr>
						<th>판매자</th>
						<td><input type="text" name="seller_id"
							value="${p.seller_id}" readonly></td>
					</tr>
					<tr>
						<th>수량</th>
						<td><input type="text" name="quantity" value="${p.quantity }"></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><input type="text" name="price" value="${p.price }"></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit">수정</button>
							<button type="button" id="del">삭제</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>









