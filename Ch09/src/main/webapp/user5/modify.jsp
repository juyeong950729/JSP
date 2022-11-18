<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user5::modify</title>
	</head>
	<body>
		<h3>user5 수정</h3>
		<a href="/Ch09/">처음으로</a>
		<a href="/Ch09/user5/list.do">user 목록</a>
		
		<form action="/Ch09/user5/modify.do" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" readonly value="${vo.uid}"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" placeholder="${vo.name}"/></td>
				</tr>
				<tr>
					<td>생일</td>
					<td><input type="text" name="birth" placeholder="${vo.birth}"/></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" placeholder="${vo.age}"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="number" name="address" placeholder="${vo.address}"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="number" name="hp" placeholder="${vo.hp}"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정하기">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>