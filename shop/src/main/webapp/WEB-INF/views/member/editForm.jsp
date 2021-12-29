<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/nav_bar.css">
<link rel="stylesheet" href="../../css/joinForm.css">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	// 주소 관련 API
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>
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
			<h3>내 정보수정</h3>
			<form method="post" action="/member/edit">
				<h3
					style="margin: 0px; padding: 0px 10px 0px 0px; display: flex; justify-content: flex-end; font-size: 15px; color: #004806;">
					type:
					<c:choose>
						<c:when test="${m.type==1 }">판매자</c:when>
						<c:when test="${m.type==2 }">구매자</c:when>
						<c:when test="${m.type==3 }">관리자</c:when>
						<c:otherwise>잘못된 type</c:otherwise>
					</c:choose>
				</h3>
				<table border=1>
					<tr>
						<td colspan="2"><input type="text" name="id" id="boxy"
							value="${m.id}" autocomplete='off' readonly>
					</tr>
					<tr>
						<td colspan="2"><input type="password" name="pwd" id="boxy"
							autocomplete='off' value="${m.pwd }" required></td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" name="name" id="boxy"
							autocomplete='off' value="${m.name}" required></td>
					</tr>
					<tr>
						<td colspan="2"><input type="tel" name="tel"
							autocomplete='off' value="${m.tel}" maxlength="11" id="boxy"
							required></td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" name="email"
							autocomplete='off' value="${m.email}" id="boxy" required></td>
					</tr>
					<tr>
						<th rowspan="3">address<br>
							<button type="button" id="searchAddr"
								onclick="sample4_execDaumPostcode()">search</button>
						</th>
						<td id="boxy"><input type="text" name="post_a"
							id="sample4_postcode" placeholder="우편번호" required
							value="${m.post_a }"></td>
					</tr>
					<td id="boxy"><input type="text" name="road_a"
						id="sample4_roadAddress" autocomplete='off' placeholder="도로명주소"
						required value="${m.road_a}"></td>
					<tr>
						<td id="boxy"><input type="text" name="detail_a"
							id="sample4_detailAddress" placeholder="상세주소 입력"
							value="${m.detail_a}"></td>
					</tr>
					<tr>
						<td colspan="2" id="ee">
							<button id="but" type="reset">초기화</button>
						</td>
					</tr>
					<tr>
						<td colspan="2" id="ee">
							<button id="but" type="submit" id="join">수정</button>
						</td>
					</tr>
					<tr>
						<td colspan="2" id="ee">
							<button id="but" type="button"
								onclick="location.href='/member/out'">탈퇴</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
