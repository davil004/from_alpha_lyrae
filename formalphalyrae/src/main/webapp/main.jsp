<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="./imgs/LOGO.png">
<Script src="./_js/jquery-3.6.0.js"></Script>
<title>我們來自織女星</title>
<style>
body, html {
	height: 100%
}

body {
	
	width: inherit;
		background-color: hsla(39, 77%, 83%, 0.514);
	border: 1px solid hsla(39, 77%, 83%, 0.514);
}
#all{
min-height: 100%;
/* margin-bottom: "-60px"; */
}
#titbox {
	background-color: white;
}

#ti {
	/* border: 2px solid rgb(0, 0, 0); */
	width: fit-content;
	margin: 0px auto 0;
}

.ti {
	/* border: 2px solid rgb(0, 0, 0); */
	height: 300px;
	/* width:initial; */
	/* display: block; */
}

#tit {
	width: fit-content;
	font-size: 20px;
	display: block;
	padding-left: 10px;
	padding-right: 10px;
	margin: 0px auto 0;
	/* background-color: lemonchiffon; */
	width: fit-content;
}
.icon{
height: 35px
}
.mb {
	/* border: 2px solid rgb(0, 0, 0); */
	/* width: 50px; */
	background-color: khaki;
	color: black;
	text-decoration: none;
	font-size: 30px;
	font-weight: bold;
}

a:visited {
	color: #000;
	/* text-decoration: none; */
}

#inc {

	text-align: center;
}

#insid>p {
	color: rgb(139, 96, 14);
}

#footer {
	text-align: center;
	bottom: 0px;
	background-color: white;
/* 	line-height: 2rem; */
	clear: both;
/* 	height: 5%; */
/* 	margin-top: "60px"; */
}
</style>
</head>
<body>
	<c:if test="${empty param.topage }">
		<c:set var="topage" value="home.jsp"></c:set>
		<c:redirect url="main.jsp?topage=home.jsp"></c:redirect>
	</c:if>
	<div id="all">
		<div id='titbox'>
			<div id='ti'>
				<img class='ti' src="./imgs/LOGO.png" alt="">
			</div>

			<br>
			<ul id='tit'>
				<a class="mb" href="main.jsp?topage=home.jsp" >首頁</a>
				<a class="mb" href="main.jsp?topage=about.jsp">品牌簡介</a>
				<a class="mb" href="main.jsp?topage=goods.jsp">商品情報</a>
				<a class="mb" href="main.jsp?topage=rec.jsp?recto=rec00.jsp">出攤紀錄</a>
				<a href="https://www.facebook.com/fromalphalyrae" target="_blank" style="text-decoration: none">
					<img class="icon" src="./imgs/fbicon1.png" >
				</a>
				<a href="https://www.instagram.com/from_alpha_lyrae/"
				 	target="_blank" style="text-decoration: none"> 
				 	<img class="icon" src="./imgs/igicon1.png"
					>
				</a>
			</ul>
			<br>
		</div>
		<div id="inc">
			<jsp:include page="${param.topage}"></jsp:include>
		</div>
	</div>
	<br>
	<div id="footer">
		<jsp:include page="foot.jsp"></jsp:include>
	</div>
</body>
</html>