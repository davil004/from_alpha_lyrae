<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/fromalphalyrae" user="root"
	password="root" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台上架管理</title>
<style type="text/css">
body {
	text-align: center;
}
</style>
</head>
<body>


	<form action="up.jsp">
		<table border="1">

			<tr>

				<th rowspan="2"><h2>新增商品</h2></th>
				<th>圖片URL</th>
				<th>品名</th>
				<th>價格</th>
				<th>入庫數量</th>
				<th rowspan="2"><input type="submit" value="新增"></th>

			</tr>

			<tr>
				<td><input type="text" name="pic"></td>
				<td><input type="text" name="name"></td>
				<td><input type="number" name="price"></td>
				<td><input type="number" name="instock"></td>
			</tr>


		</table>
	</form>

	<c:if test="${! empty param.editid }">
		<sql:query var="result1">
 SELECT * FROM goods WHERE ID =?
 <sql:param>${param.editid }</sql:param>
		</sql:query>
		<hr>
		<form action="edit.jsp">
			<table border="1">

				<tr>

					<th rowspan="2"><h2>修改商品</h2></th>
					<th>圖片URL</th>
					<th>品名</th>
					<th>價格</th>
					<th>入庫數量</th>
					<th rowspan="2"><input type="submit" value="修改"></th>

				</tr>

				<tr>
					<td><input type="text" name="pic"
						value="${result1.rows[0].pic }"></td>
					<td><input type="text" name="name"
						value="${result1.rows[0].name }"></td>
					<td><input type="number" name="price"
						value="${result1.rows[0].price }"></td>
					<td><input type="number" name="instock"
						value="${result1.rows[0].instock }"></td>
				</tr>
				<input type="hidden" name="id" value="${param.editid }" />

			</table>
		</form>



	</c:if>


	<hr>
	<table border="1">
		<tr>
			<th>編號</th>
			<th>圖片</th>
			<th>名稱</th>
			<th>價格</th>
			<th>庫存數量</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>

		<sql:query var="result">
	SELECT *FROM goods ORDER BY id 
	</sql:query>
		<script>
			function delConfirm(name) {
				var isDel = confirm("Delete " + name + " ?");
				return isDel;
			}
		</script>
		<c:forEach items="${result.rows }" var="row">

			<tr>
				<td>${row.id }</td>
				<td><img src="${row.pic }" width="300px"></td>
				<td>${row.name }</td>
				<td>${row.price }</td>
				<td>${row.instock }</td>
				<td><a href="?editid=${row.id }">修改</a></td>
				<td><a href="?delid=${row.id }"
					onclick="return delConfirm('${row.name}') ">刪除</a></td>

			</tr>
		</c:forEach>

	</table>



	<c:if test="${! empty param.delid }">
		<sql:update>
DELETE FROM goods WHERE id =?
<sql:param>${param.delid }</sql:param>
		</sql:update>
		<c:redirect url="goodsup.jsp"></c:redirect>
	</c:if>


</body>
</html>