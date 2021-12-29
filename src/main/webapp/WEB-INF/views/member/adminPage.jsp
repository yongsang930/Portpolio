<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var sel1=0; //선택한 것 저장할 변수 대분류
	var sel2=0; //선택한 것 저장할 변수 소분류
	$(document).ready(
			function() {
				$.post("/admin/getsub", {
					type : 1,// 대분류 번호 
					p_id : 0 // 
				}).done(
						function(data) {
							var c = eval("(" + data + ")");
							for (i = 0; i < c.length; i++) {
								$("#s1").append(
										"<option value='"+c[i].id+"'>"
												+ c[i].name + "</option>"); //대분류 값을 받아와서 추가하고 
							}
						});
				
				$("#s1").click(function() {
					var x = 0;
					x = this.options[this.options.selectedIndex].value
					sel1 = x;
					$.post("/admin/getsub", {
						type : 2,
						p_id : x // 전단계 대분류 
					}).done(function(data) {
						var c = eval("(" + data + ")");
						$("#s2").empty();//초기화를 하려면 비우고 
						$("#s3").empty(); //초기화를 하려면 비우고
						for (i = 0; i < c.length; i++) {
							$("#s2").append("<option value='"+c[i].id+"'>"//추가하고 
									+ c[i].name + "</option>");
						}
					});
				});
				
				$("#s2").click(function() {
					var x = 0;
					x = this.options[this.options.selectedIndex].value
					sel2=x;
					$.post("/admin/getsub", {
						type : 3,
						p_id : x // 중분류 부모 
					}).done(function(data) {
						var c = eval("(" + data + ")");
						$("#s3").empty();//초기화를 하려면 비우고
						for (i = 0; i < c.length; i++) {
							$("#s3").append("<option value='"+c[i].id+"'>"//추가하고 
									+ c[i].name + "</option>");
						}
					});
				});

				$("input[type=button]").click(function() {		
					if(this.form.elements[0].name=='s2'){//중뷴류 버튼을 눌렀을 때 sel1의 값을 
						this.form.p_id.value=sel1;
					}else if(this.form.elements[0].name=='s3'){//소분류 버튼을 눌렸을 때 sel2 값을 대입 
						this.form.p_id.value=sel2;
					}
					var o = this.form.elements[0].options;
					for(i=0;i<o.length;i++){						
						if(o[i].text==this.form.name.value){
							alert("이미 있는 카테고리입니다.");
							return;
						}
					}
					this.form.submit();
				});
			});
</script>
</head>
<body>
	<h3>관리자</h3>
	대분류:
	<form id="f1"action="${pageContext.request.contextPath }
	/admin/addCategory" onsubmit="return false" method="post">
		<select id="s1" name="s1"></select> 
		<input type="text" id="n1" name="name">
		<input type="hidden" name="type" value="1">
		<input type="button" id="b1" value="추가">
	</form>
	<br>	
	중분류:	
	<form id="f2" action="${pageContext.request.contextPath }
	/admin/addCategory" onsubmit="return false"  method="post">
		<select id="s2"  name="s2"></select> 
		<input type="text" id="n2" name="name">
		<input type="hidden" name="type" value="2">
		<input type="hidden" id="h1" name="p_id" value="">
		<input type="button" id="b2" value="추가">
	</form>
</body>
</html>