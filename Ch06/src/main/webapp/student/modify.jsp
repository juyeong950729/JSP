<%@page import="bean.StudentBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String StdNo = request.getParameter("StdNo");
	
	StudentBean sb = null;
	
	try{
		Connection conn = DB.getInstance().getConnection();
		String sql = "SELECT * FROM `student` WHERE `StdNo`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, StdNo);
		
		ResultSet rs = psmt.executeQuery();
		
		if (rs.next()){
			sb = new StudentBean();
			sb.setStdNo(rs.getString(1));
			sb.setStdName(rs.getString(2));
			sb.setStdHp(rs.getString(3));
			sb.setStdYear(rs.getInt(4));			
			sb.setStdAddress(rs.getString(5));			
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
	} catch (Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>student 수정</h3>
		<a href="../1_JDBCTest.jsp">처음으로</a>
		<a href="./list.jsp">student 목록</a>
		
		<form action="./modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>학번</td>
					<td><input type="text" name="StdNo" readonly value="<%= sb.getStdNo() %>"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="StdName" placeholder="<%= sb.getStdName() %>"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="StdHp" placeholder="<%= sb.getStdHp() %>"></td>
				</tr>
				<tr>
					<td>학년</td>
					<td><input type="text" name="StdYear" placeholder="<%= sb.getStdYear() %>"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="StdAddress" placeholder="<%= sb.getStdAddress() %>"></td>
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