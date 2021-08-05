<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<sql:setDataSource driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/fromalphalyrae" user="root"
	password="root" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	
</script>
<body>
	<sql:query var="result">
	SELECT *FROM goods ORDER BY id 
	</sql:query>

	<h3>商品情報</h3>
	<div>

		<c:forEach items="${result.rows }" var="row">
			<table border="1px" class="item"
				style="float: left; text-align: center; width: calc(100%/ 3); overflow: hidden;"
				data-price="${row.price}" data-qty='.qty.text()'>
				<tr>
					<td colspan="2"><img src="${row.pic }"
						style="width: 100%; object-fit: cover; height: 330px"></td>
				</tr>
				<tr>
					<%-- 				<%int i =0; %> --%>
					<td name = 'itname' id="itname${row.id}" class='itname' colspan="2">${row.name}</td>
				</tr>
				<tr>
					<td width="50%">price</td>
					<td width="50%" class="pri">${row.price}</td>
				</tr>
				<tr>
					<td>庫存 ${row.instock } pic</td>
					<td>訂購數量 <span class="oqty"> <input type="number"
							max=${row.instock } min="0" name='qty' value="0" class="qty"
							id="${row.id }qty"
							oninput="if(value>${row.instock })value=${row.instock };if(value<0)value=0">
					</span>
					</td>
				</tr>
				<tr>
					<td>金額</td>
					<td>$<span class="eachtotal" id="total">0</span></td>
				</tr>
			</table>
		</c:forEach>

	</div>

	<br style="clear: both;">
	<hr>
	<form action="orderup.jsp">
		<table style="clear: both; margin-left: auto; margin-right: auto;"
			border="1">

			<tr>

				<td colspan="2">快速下訂</td>
			<tr>
				<td>姓名</td>
				<td><input type="text" name='name'></input></td>
			</tr>
			<tr>
				<td>地址</td>
				<td><input type="text" name='addr'></input></td>
			</tr>
			<tr>
				<td>電話</td>
				<td><input type="text" name='tel'></input></td>
			</tr>
			<tr>
				<td>備註</td>
				<td><input type="text" size="50" name='ex'></input></td>
			</tr>
			<tr>
				<td>總數量</td>
				<td><span id="allqty" />pcs</td>
			</tr>
			<tr>
				<td>總金額</td>
				<td>$<span id="alltotal" /></td>
				<input type="hidden" id="totalprice" name='totalprice' value="">
				<input type="hidden" id="buy" name='buy' value="">
			</tr>
			<tr>

				<td colspan="2"><input type="submit" value="送出訂單"></input></td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {

			$('.item').on('click', '.qty', function() {
				var price = +$(this).closest('.item').data('price');

				var quantity = +$(this).val();

				$(this).closest('.item').find('#total').text(price * quantity);
			});

			$('.item').on('keyup', '.qty', function() {
				var price = +$(this).closest('.item').data('price');

				var quantity = +$(this).val();

				$(this).closest('.item').find('#total').text(price * quantity);
			});

			$('body').on('click', '.qty', function() {
				var sum = 0;
				$('.eachtotal').each(function() {
					sum += parseFloat($(this).text());
				});
				document.getElementById('totalprice').value =sum;
				$(this).closest('body').find('#alltotal').text(sum);
			});
			$('body').on('keyup', '.qty', function() {
				var sum = 0;
				$('.eachtotal').each(function() {
					sum += parseFloat($(this).text());
				});
				document.getElementById('totalprice').value =sum;
				$(this).closest('body').find('#alltotal').text(sum);
			});
		
			
			//----------------------------	
			$('body').on('click', '.qty', function() {
				var sum1 = 0;
				var quantity = $(this).val();
				$('.qty').each(function() {
					sum1 = parseInt(sum1) + parseFloat($(this).val());
				});
				
				$(this).closest('body').find('#allqty').text(sum1);
				//-----------這裡開始
				
				var st ="";
				var i=0;
				$('.qty').each(function() {
// 				i=i+1;
				if(($(this).val())>0){
					var qtyID = $(this).prop("id").replace("qty","");
					st = st + 															
						document.getElementById('itname'+qtyID).innerText						
					+'*'+$(this).val() ;}
				});
				
				
				//----------到這裡有問題			
				document.getElementById('buy').value=st;

				
			});
			
			
			
			
			
			$('body').on('keyup', '.qty', function() {
				var sum1 = 0;
				var quantity = $(this).val();
				$('.qty').each(function() {
					sum1 = parseInt(sum1) + parseFloat($(this).val());
				});
				$(this).closest('body').find('#allqty').text(sum1);
// 				document.getElementById('buy').value=${row.name }+'*'+quantity;
				
			});
		});
	</script>



</body>
</html>