<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
			$.post("/admin/getsub", {
				type : 1,
				p_id : 0
			}).done(function(data) {
				var c = eval("(" + data + ")");
				for (i = 0; i < c.length; i++) {
					$("#s1").append(	"<option value='"+c[i].id+"'>"
												+ c[i].name + "</option>");
				}
			});

			$("#s1").click(function() {
				var x = 0;
				x = this.options[this.options.selectedIndex].value
				$.post("/admin/getsub", {
						type : 2,
						p_id : x
				}).done(function(data) {
					var c = eval("(" + data + ")");
					$("#s2").empty();
					$("#s3").empty();
					for (i = 0; i < c.length; i++) {
						$("#s2").append(	"<option value='"+c[i].id+"'>"
															+ c[i].name + "</option>");
					}
				});
			});

			$("#s2").click(function() {
				var x = 0;
				x = this.options[this.options.selectedIndex].value
				$.post("/admin/getsub", {
					type : 3,
					p_id : x
				}).done(function(data) {
				var c = eval("(" + data + ")");
				$("#s3").empty();
				for (i = 0; i < c.length; i++) {
					$("#s3").append(	"<option value='"+c[i].id+"'>"
															+ c[i].name + "</option>");
				}
			});
		});
});
</script>
</head>
<body>
<h3>구매자</h3>
카테고리 검색:<select id="s1"></select>
</body>
</html>