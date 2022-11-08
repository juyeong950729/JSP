<%@page import="config.Sql"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.StudentBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<StudentBean> students = new ArrayList<>();

	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(Sql.SELECT_STUDENT);
		
		while(rs.next()){
			StudentBean sb = new StudentBean();
			sb.setStdNo(rs.getString(1));
			sb.setStdName(rs.getString(2));
			sb.setStdHp(rs.getString(3));
			sb.setStdYear(rs.getInt(4));
			sb.setStdAddress(rs.getString(5));
			students.add(sb);
		}
		rs.close();
		stmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>학생관리</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
		$(function(){
			
			$('.btnS').click(function(){
				$('section').show();
			});
			
			$('.btnClose').click(function(){
				$('section').hide();
			});
			
			$('input[type=submit]').click(function(){
				let StdNo 		= $('input[name=StdNo]').val();
				let StdName 	= $('input[name=StdName]').val();
				let StdHp 		= $('input[name=StdHp]').val();
				let StdYear 	= $('input[name=StdYear]').val();
				let StdAddress  = $('input[name=StdAddress]').val();
				
				let jsonData = {
					"StdNo":StdNo,	
					"StdName":StdName,
					"StdHp":StdHp,
					"StdYear":StdYear,
					"StdAddress":StdAddress
				};
				
				$.post('./proc/studentProc.jsp', jsonData, function(data){
					if(data.result > 0){
						alert('등록 완료!');
					} else {
						alert('등록 실패!');
					}
					
				});
			});
			
		});
		</script>
	</head>
	<body>
		<h3>학생관리</h3>
		<a href="/College/lecture.jsp">강좌관리</a>
		<a href="/College/register.jsp">수강관리</a>
		<a href="#">학생관리</a>
		<br/>
		
		
		<h4>학생목록</h4>
		<button class="btnS">등록</button>
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>학년</th>
				<th>주소</th>
			</tr>
			<% for (StudentBean sb : students) { %>
			<tr>
				<td><%= sb.getStdNo() %></td>
				<td><%= sb.getStdName() %></td>
				<td><%= sb.getStdHp() %></td>
				<td><%= sb.getStdYear() %></td>
				<td><%= sb.getStdAddress() %></td>
			</tr>
			<% } %>
		</table>
			
			<section style="display:none;">
				<h4>학생등록</h4>
				<button class="btnClose">닫기</button>
				<table border="1">
					<tr>
						<td>학번</td>
						<td><input type="text" name="StdNo"/></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="StdName"/></td>
					</tr>
					<tr>
						<td>휴대폰</td>
						<td><input type="text" name="StdHp"/></td>
					</tr>
					<tr>
						<td>학년</td>
						<td>
							<select name="StdYear">
								<option>1학년</option>
								<option>2학년</option>
								<option>3학년</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="StdAddress"/></td>
					</tr>
					<tr>
						<td colspan="2" align="right"><input type="submit" value="등록"/></td>
					</tr>
				</table>
			</section>
		
	</body>
</html>