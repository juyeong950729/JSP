<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>book::list</title>
	</head>
	<body>
		<h3>도서목록</h3>
		<a href="/BookStore2">처음으로</a>
		<a href="/BookStore2/customer/register.do">고객등록</a>
		
		<table border="1">
		<tr>
			<th>도서번호</th>
			<th>도서명</th>
			<th>출판사</th>
			<th>가격</th>
			<th>관리</th>
		</tr>
		<c:forEach var="cust" items="${requestScope.custs}">
			<tr>
				<td>${cust.custId}</td>
				<td>${cust.name}</td>
				<td>${cust.address}</td>
				<td>${cust.phone}</td>
				<td>
					<a href="/BookStore2/customer/modify.do?custId=${cust.custId}">수정</a>
					<a href="/BookStore2/customer/delete.do?custId=${cust.custId}">삭제</a>
				</td>
			</tr>
		</c:forEach>
		</table>
	</body>
</html>