<%@page import="config.Sql"%>
<%@page import="bean.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	List<ProductBean> prods = null;
	
	try {
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(Sql.SELECT_PRODUCT);
		prods = new ArrayList<>();
		while(rs.next()){
			ProductBean pb = new ProductBean();
			pb.setProdNo(rs.getInt(1));
			pb.setProdName(rs.getString(2));
			pb.setStock(rs.getInt(3));
			pb.setPrice(rs.getInt(4));
			pb.setCompany(rs.getString(5));
			
			prods.add(pb);
		}
		
		rs.close();
		stmt.close();
		conn.close();
	} catch (Exception e){
		e.printStackTrace();
	}
	

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>shop::product</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script src="./js/register.js"></script>
		<script>
		$(document).ready(function(){

			$(document).on('click', '#btnRegister', function(e){
				e.preventDefault();

				let prodNo = $('input[name=orderProduct]').val();
				let amount = $('input[name=orderCount]').val();
				let custid = $('input[name=orderId]').val();

				let jsonData = {
					"orderProduct":orderProduct,
					"orderCount":orderCount,
					"orderId":orderId
					};
				
				$.ajax({
					url: './data/register.jsp',
					method: 'post',
					data: jsonData,
					dataType: 'json',
					success: function(data){
						if (data.result == 1){
							alert('주문완료!');
						} else {
							alert('다시 시도해주세요.);
						}
					}

				});
			});
			});
		</script>
	</head>
	<body>
		<h3>상품목록</h3>
		<a href="./customer.jsp">고객목록</a>
		<a href="./order.jsp">주문목록</a>
		<a href="#">상품목록</a>
		<table border="1">
			<tr>
				<th>상품번호</th>
				<th>상품명</th>
				<th>재고량</th>
				<th>가격</th>
				<th>제조사</th>
				<th>주문</th>
			</tr>
			<% for (ProductBean pb : prods){ %>
			<tr>
				<td><%= pb.getProdNo() %></td>
				<td><%= pb.getProdName() %></td>
				<td><%= pb.getStock() %></td>
				<td><%= pb.getPrice() %></td>
				<td><%= pb.getCompany() %></td>
				<td><input type="submit" value="주문" id="btnRegister"></td>
			</tr>
			<% } %>
		</table>
		<nav></nav>
		<section>
		</section>
	</body>
</html>