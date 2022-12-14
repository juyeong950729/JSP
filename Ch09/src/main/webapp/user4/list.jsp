<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user4::list</title>
	</head>
	<body>
		<h3>user4 목록</h3>
		<a href="/Ch09/">처음으로</a>
		<a href="/Ch09/user4/register.do">user 등록</a>
		
		<table border="1">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>성별</th>
				<th>나이</th>
				<th>주소</th>
			</tr>
			<c:forEach var="user" items="${requestScope.users}">
				<tr>
					<td>${user.seq}</td>
					<td>${user.name}</td>
					<td>${user.gender}</td>
					<td>${user.age}</td>
					<td>${user.addr}</td>
					<td>
						<a href="/Ch09/user4/modify.do?uid=${user.uid}">수정</a>
						<a href="/Ch09/user4/delete.do?uid=${user.uid}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>