<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* body { */
/* 	height: 100%; */
/* } */
#leftside {
	float: left;
	width: 30%;
	text-align: center;
	height: "500px";
	text-align: center;
}

#recc {
	float: left;
	width: 70%;
}
</style>
</head>
<body>

	<div>
		<div id="leftside">
			<jsp:include page="recleft.jsp"></jsp:include>
		</div>
		<div id="recc">
			<jsp:include page="${param.recto}"></jsp:include>
		</div>
	</div>
</body>
</html>