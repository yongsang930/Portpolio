<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../../js/allList_catelist.js"></script>
<title>Insert title here</title>
<style type="text/css">
#container {
	display: flex;
	justify-content:center;
	margin-top: 10px;
}

#plist{
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

a {
	color: black;
}

#btnD {
	float: right;
	font-size: 15px;
	width: 100px;
	background-color: white;
	cursor: pointer;
	border-left-color: white;
	border-top-color: white;
	border-right-color: white;
}

#content {
	display: inline;
	padding-top: 30px;
	width: 750px
}

table {
	width: 950px;
	padding-top: 10px;
	text-align: center;
	border-style: none;
}

th, td {
	padding: 10px 7px;
	font-size: 15px;
}

#content a:hover {
	font-size: 15.1px;
	font-weight: bold;
	color: darkorange;
	font-weight: bold;
}
</style>
</head>
<body>
	<div id="container">
		<c:if test="${sessionScope.type==2}">
			<div id="plist">
				<h3>전체 상품</h3>
				<div id="content">
					<c:if test="${empty p_list }">등록된 상품 없음</c:if>
					<c:if test="${not empty p_list }">
						<table border="1">
							<tr>
								<th>번호</th>
								<th>이미지</th>
								<th>품명</th>
								<th>수량</th>
								<th>가격</th>
							</tr>
							<c:forEach var="p" items="${p_list }">
								<tr>
									<td>${p.num }</td>
									<td>사진</td>
									<td><a href="/order/itemView?num=${p.num }&type=2">${p.name }</a></td>
									<td>${p.quantity }</td>
									<td>${p.price }</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</div>
			</div>
		</c:if>
		<c:if test="${sessionScope.type==1}">
			<div id="plist">
				<h3>내 판매 상품</h3>
				<div id="content">
				<span id="btn">
					<button id="btnD" onclick="location.href='/seller/form'">상품
						등록</button>
				</span>
					<c:if test="${empty p_list }">	등록된 상품 없음</c:if>
					<c:if test="${not empty p_list }">
						<table border="1">
							<tr>
								<th>번호</th>
								<th>품명</th>
								<th width="350px">설명</th>
								<th>수량</th>
								<th>가격</th>
								<th>제작사</th>
								<th>영화</th>
							</tr>
							<c:forEach var="p" items="${p_list }">
								<tr>
									<td>${p.num }</td>
									<td><a href="/seller/itemView?num=${p.num }&type=1">${p.name }</a></td>
									<td>${p.info }</td>
									<td>${p.quantity }</td>
									<td>${p.price }</td>
									<td>${p.category1_id }</td>
									<td>${p.category2_id }</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</div>
			</div>
		</c:if>
	</div>
</body>
</html>