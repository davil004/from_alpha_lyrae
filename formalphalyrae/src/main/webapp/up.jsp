<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<sql:setDataSource driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/fromalphalyrae" user="root"
	password="root" />

<sql:update>
INSERT INTO goods (pic,name,price,instock) VALUES(?,?,?,?)
	<sql:param>${param.pic }</sql:param>
	<sql:param>${param.name} </sql:param>
	<sql:param>${param.price }</sql:param>
	<sql:param>${param.instock }</sql:param>
</sql:update>
<c:redirect url="goodsup.jsp"></c:redirect>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>