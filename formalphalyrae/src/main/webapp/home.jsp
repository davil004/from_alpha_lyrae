<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.imgcb {
	max-width: 1000px;
	position: relative;
	margin: auto;
}

.imgcbin {
	display: none;
	overflow: hidden;
	height: 600px;
}

.imgcbin>img {
	width: 1080px;
}

</style>
</head>
<body>

	<div class="imgcb">
		<br>
		<div class="imgcbin">
			<img src="./imgs/goods/2011231.jpg">
			<!-- 			<div class="imgcbtx">pic1</div> -->
		</div>
		<div class="imgcbin">
			<img src="./imgs/goods/DSC03762.jpg">
			<!-- 			<div class="imgcbtx">pic2</div> -->
		</div>
		<div class="imgcbin">
			<img src="./imgs/goods/DSC05105.jpg">
			<!-- 			<div class="imgcbtx">pic3</div> -->
		</div>
		<div class="imgcbin">
			<img src="./imgs/goods/S__11853837.jpg">
			<!-- 			<div class="imgcbtx">pic4</div> -->
		</div>


	</div>






	<br>
	<div>
		<div style="float: left; width: 50%">
			<jsp:include page="nexttogo.jsp"></jsp:include>
		</div>
		<div style="float: left; width: 50%">
			<jsp:include page="event.jsp"></jsp:include>
		</div>

	</div>
	<script type="text/javascript">
		var slideIndex = 0;
		showSlides();

		function showSlides() {
			var i;
			var slides = document.getElementsByClassName("imgcbin");
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			slideIndex++;
			if (slideIndex > slides.length) {
				slideIndex = 1
			}
			slides[slideIndex - 1].style.display = "block";
			setTimeout(showSlides, 2000); // Change image every 2 seconds
		}
	</script>
</body>
</html>