<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user::modify</title>
	</head>
	<body>
		<h3>user 수정</h3>
		<a href="#">처음으로</a>
		<a href="#">user 목록</a>
		
		<form action="#" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" readonly value=""/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" placeholder=""/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" placeholder=""/></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" placeholder=""/></td>
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