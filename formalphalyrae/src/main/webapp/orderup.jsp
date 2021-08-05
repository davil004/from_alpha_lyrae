<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<sql:setDataSource driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/fromalphalyrae" user="root"
	password="root" />
<sql:update>
INSERT INTO orders (buy,totalprice,name,addr,tel,ex) VALUES(?,?,?,?,?,?)

	<sql:param>${param.buy}</sql:param>
	<sql:param>${param.totalprice}</sql:param>
	
	<sql:param>${param.name} </sql:param>
	<sql:param>${param.addr}</sql:param>
	<sql:param>${param.tel}</sql:param>
	<sql:param>${param.ex}</sql:param>
</sql:update>
<c:redirect url="main.jsp?topage=goods.jsp"></c:redirect>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>