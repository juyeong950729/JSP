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
		<a href="/Ch09/user6/list.do">user 목록</a>
		
		<form action="/Ch09/user6/modify.do" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" placeholder="아이디 입력"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" placeholder="이름 입력"/></td>
				</tr>
				<tr>
					<td>생일</td>
					<td><input type="text" name="birth" placeholder="생일 입력"/></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" placeholder="나이 입력"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="number" name="address" placeholder="주소 입력"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="number" name="hp" placeholder="휴대폰 입력"/></td>
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