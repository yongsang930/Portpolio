<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="../../css/login_view.css" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
	<div class="wrap">
		<h1>
			<span class="material-icons"> <img alt=""
				src="../../img/spider web(G).png" width="230px">
			</span>
		</h1>
		<p id="dynamic" class="lg-text"></p>
		<p class="sm-text">Welcome My Shop!</p>
	</div>
	<script src="../../js/main.js"></script>

	<div class="login">
		<form action="/member/login" method="post">
			<table class="tb">
				<tr>
					<td><input type="text" name="id" placeholder="아이디 입력" autocomplete="none" required></td>
				</tr>
				<tr>
					<td><input type="password" name="pwd" placeholder="비밀번호 입력" autocomplete="none" required></td>
				</tr>
				<tr>
					<td>
						<button type="submit">로그인</button>
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" onclick="location.href='/member/joinForm'">회원가입</button>
					</td>
				</tr>
			</table>
			<c:if test="${fail!=null}">
				<span> <br> <b>${fail}</b>
				</span>
			</c:if>
		</form>
	</div>
</body>
</html>