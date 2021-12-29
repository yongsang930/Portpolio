<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/nav_bar.css">
<link rel="stylesheet" href="../../css/registration.css">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(
			function() {
				$.post("/admin/getsub", {
					type : 1,
					p_id : 0
				}).done(
						function(data) {
							var c = eval("(" + data + ")");
							for (i = 0; i < c.length; i++) {
								$("#s1").append(
										"<option value='"+c[i].id+"'>"
												+ c[i].name + "</option>");
							}
						});

				$("#s1").click(
						function() {
							var x = 0;
							x = this.options[this.options.selectedIndex].value
							$.post("/admin/getsub", {
								type : 2,
								p_id : x
							}).done(
									function(data) {
										var c = eval("(" + data + ")");
										$("#s2").empty();
										$("#s3").empty();
										for (i = 0; i < c.length; i++) {
											$("#s2").append(
													"<option value='"+c[i].id+"'>"
															+ c[i].name
															+ "</option>");
										}
									});
						});

				$("#s2").click(
						function() {
							var x = 0;
							x = this.options[this.options.selectedIndex].value
							$.post("/admin/getsub", {
								type : 3,
								p_id : x
							}).done(
									function(data) {
										var c = eval("(" + data + ")");
										$("#s3").empty();
										for (i = 0; i < c.length; i++) {
											$("#s3").append(
													"<option value='"+c[i].id+"'>"
															+ c[i].name
															+ "</option>");
										}
									});
						});

			});
</script>
<style type="text/css">
body {
	padding: 10px;
	margin: 0px;
}
</style>
<script src="https://kit.fontawesome.com/2d323a629b.js"
	crossorigin="anonymous"></script>
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
					<b>Home</b>
			</a></li>
			<li><a href="/member/editForm"><b>My Page</b></a></li>
			<li><a href="/member/logout"> <b>Logout</b>
			</a></li>
			<li><a href="/member/out"><b>Out</b></a></li>
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
		<form action="/seller/add"
			id="content" method="post" enctype="multipart/form-data">
			<h3>상품 등록 페이지</h3>
			<table border="1">
				<tr>
					<td colspan="5" id="sid"><input  id="put" type="text" name="seller_id" value="${sessionScope.id }" readonly></td>
				</tr>
				<tr>
					<th>제작사</th>
					<td id="sid"><select id="s1" name="category1_id" required></select></td>
					<th>영화</th>
					<td id="sid"><select id="s2" name="category2_id" required></select></td>
				</tr>
				<tr>
					<td colspan="5" id="sid"><input id="put" type="text" name="name" placeholder="상품명" required></td>
				</tr>
				<tr>
					<td colspan="5" id="sid"><input id="put" type="text" name="quantity" placeholder="재고" required></td>
				</tr>
				<tr>
					<td colspan="5" id="sid"><input id="put" type="text" name="price" placeholder="가격" required></td>
				</tr>
				<tr>
					<td colspan="5" id="sid"><textarea rows="10" cols="100" name="info" placeholder="상품설명 작성란" required></textarea>
					</td>
				</tr>
				<tr>
					<th>이미지1</th>
					<td colspan="4" id="sid"><input type="file" name="file1" required></td>
				</tr>
				<tr>
					<th>이미지2</th>
					<td colspan="4" id="sid"><input type="file" name="file2" required></td>
				</tr>
				<tr>
					<th>이미지3</th>
					<td colspan="4" id="sid"><input type="file" name="file3" required></td>
				</tr>
			</table>
			<button type="reset">취소</button>
			<button type="submit">등록</button>
		</form>
	</div>
</body>
</html>