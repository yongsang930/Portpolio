<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="main_slide.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
	<!--최초 페이지실행시 contorller에서 이미지에 대한 db와 session에서 type을 가져옴-->
	<!-- 동적기능은 main_slide.js에서 처리 -->
	    <div class="carousel-container">
      <div class="carousel-slide">
        <img src="pic10.jpg" id="lastClone">
        <img src="pic1.jpg">
          <img src="pic2.jpg">
          <img src="pic3.jpg">
          <img src="pic4.jpg">
          <img src="pic5.jpg">
          <img src="pic6.jpg">
          <img src="pic7.jpg">
          <img src="pic8.jpg">
          <img src="pic9.jpg">
          <img src="pic10.jpg">
          <img src="pic1.jpg" id="firstClone">
        </div>
        <button id="prevBtn" style="display: none;">
        </button>
        <button id="nextBtn" style="display: none;">
        </button>
      </div>
      <script src="main_slide_reco.js"></script>
      <script src="main_slide.js"></script>

	<!--관리자 전용페이지/이미지 등록 페이지-->
	<!--메인 슬라이드에 들어갈 이미지를 관리자가 등록-->
	<!--등록될 이미지 파일은 오늘의 추천상품을 포함하여 10개로 제한-->
	<c:if test="sessionScope.type== '관리자'">
		<form action="/product/add" method="post">
			<div class="slide_img">
				<table border="1">
					<tr>
						<td><input class="form-control" type="file" name="file1"
							id="file1" accept="image/*" /></td>
					</tr>
					<tr>
						<td><input class="form-control" type="file" name="file2"
							id="file2" accept="image/*" /></td>
					</tr>
					<tr>
						<td><input class="form-control" type="file" name="file3"
							id="file3" accept="image/*" /></td>
					</tr>
					<tr>
						<td><input class="form-control" type="file" name="file4"
							id="file4" accept="image/*" /></td>
					</tr>
					<tr>
						<td><input class="form-control" type="file" name="file5"
							id="file5" accept="image/*" /></td>
					</tr>
					<tr>
						<td><input class="form-control" type="file" name="file6"
							id="file6" accept="image/*" /></td>
					</tr>
					<tr>
						<td><input class="form-control" type="file" name="file7"
							id="file7" accept="image/*" /></td>
					</tr>
					<tr>
						<td><input class="form-control" type="file" name="file8"
							id="file8" accept="image/*" /></td>
					</tr>
					<tr>
						<td><input class="form-control" type="file" name="file9"
							id="file9" accept="image/*" /></td>
					</tr>
					<tr>
						<td><input class="form-control" type="file" name="file10"
							id="file10" accept="image/*" /></td>
					</tr>
				</table>
			</div>
		</form>
	</c:if>

	<!-- controller에서 add 메서드 실행 후 file-upload-->
	
	<!-- private String projectPath = new File("").getAbsolutePath().toString() + "\\src\\main\\webapp";
	private String webPath = "\\static\\product\\";
	
		@PostMapping("/product/add")
	public String addProduct(Product p) {
		pService.addImg(img);
		int product_num = pService.getProductNum();
		uploadFile(p.getFile1(), product_num, 1);
		uploadFile(p.getFile2(), product_num, 2);
		uploadFile(p.getFile3(), product_num, 3);
		uploadFile(p.getFile4(), product_num, 4);
		uploadFile(p.getFile5(), product_num, 5);
		uploadFile(p.getFile6(), product_num, 6);
		uploadFile(p.getFile7(), product_num, 7);
		uploadFile(p.getFile8(), product_num, 8);
		uploadFile(p.getFile9(), product_num, 9);
		uploadFile(p.getFile10(),product_num, 10);
		
		return "main";
	}

//	개별파일을 프로덕트 번호의 폴더에 업로드해줌
//	컨트롤러가 아니고 메서드임!
	private void uploadFile(MultipartFile file, int product_num, int img_num) {
		File dir = new File(projectPath + webPath + product_num);
		if (!dir.exists()) {
			dir.mkdir();
		}
		if (!file.isEmpty()) {
			String uploadPath = webPath + product_num + "\\" + img_num + "_" + file.getOriginalFilename();
			File f = new File(projectPath + uploadPath);
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	<img src="${main_img.path1}"의 형태로 view단에서 호출
	-->
</body>
</html>