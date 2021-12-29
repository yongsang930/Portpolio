<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../../js/allList_catelist.js"></script>
<style type="text/css">
#container {
	position: relative;
	width: 700px;
	height: 260px;
	border: 1px solid #dae1e6;
	border-width: 1px;
	padding: 10px 0px 10px 0px;
	margin-top: 10px;
}

form, #list {
	padding-top: 10px;
	padding-left: 10px;
}
</style>
</head>
<body>
	<div id="container">
		<h3 style="text-align: center;">상품 목록</h3>
		<form action="/seller/cateList" method="post">
			대분류<select id="s1" name="c1"></select> 
			중분류<select id="s2"	name="c2"></select> 
			<input type="submit" value="검색">
		</form>

		<form action="/seller/nameList"
			method="post">
			제품명으로 검색: <input type="text" name="name"> <input
				type="submit" value="검색">
		</form>


		<form action="/seller/sellerList"
			method="post">
			판매자로 검색: <input type="text" name="seller_id"> <input
				type="submit" value="검색">
		</form>


		<form action="/seller/priceList"
			method="post">
			가격으로 검색: 최소:<select name="min">
				<option value="10000">10000</option>
				<option value="20000">20000</option>
				<option value="30000">30000</option>
			</select> 최대:<select name="max">
				<option value="40000">40000</option>
				<option value="50000">50000</option>
				<option value="60000">100000</option>
			</select> <input type="submit" value="검색">
		</form>
		<div id="list">
			<c:if test="${empty list }">검색된 상품이 없다. </c:if>
			<c:if test="${not empty list }">

				<table border="1" cellspacing="0">
					<tr>
						<th>제품명</th>
						<th>설명</th>
						<th>가격</th>
						<th>수량</th>
					</tr>
					<c:forEach var="p" items="${list }">
						<tr>
							<td><a
								href="${pageContext.request.contextPath }
/seller/itemView?num=${p.num }&type=2">${p.name }</a></td>
							<td>${p.info }</td>
							<td>${p.price }</td>
							<td>${p.quantity }</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
	</div>
</body>
</html>