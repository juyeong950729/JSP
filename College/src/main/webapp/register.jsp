<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.RegisterBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	
	List<RegisterBean> registers = new ArrayList<>();
	String RegStdNo     = request.getParameter("RegStdNo");
	
	int result = 0;
	
	try {
		Connection conn = DBCP.getConnection();
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_REGISTER);
		psmt.setString(1, "RegStdNo");
		ResultSet rs = psmt.executeQuery();
		
		while (rs.next()){
			RegisterBean rb = new RegisterBean();
			rb.setRegStdNo(rs.getString(1));
			rb.setStdName(rs.getString(8));
			rb.setLecName(rs.getString(7));
			rb.setRegLecNo(rs.getInt(2));
			rb.setRegMidScore(rs.getInt(3));
			rb.setRegFinalScore(rs.getInt(4));
			rb.setRegTotalScore(rs.getInt(5));
			rb.setRegGrade(rs.getString(6));
			registers.add(rb);
		}
		rs.close();
		psmt.close();
		conn.close();
	} catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>수강관리</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script src="./js/register.js"></script>
		<script>
		$(function(){
			
			$('.btnR').click(function(){
				$('section').show();
			});
			
			$('btnClose').click(function(){
				$('section').hide();
			});
			
			$('input[type=submit]').click(function(){
				
			});
			
			$(document).on('click', '#Search', function(e){
				e.preventDefault();
				
				let RegStdNo = $('input[name=RegStdNo]').val();
				
				let jsonData = {
						"RegStdNo":RegStdNo
				};
				
				$.ajax({
		 			url: './data/register.jsp',
		 			method: 'get',
		 			dataType: 'json',
		 			success: function(data){
		 				
		 				for(let register of data){
		 					
		 					let tags = "<tr>";
		 						tags += "<td>"+register.RegStdNo+"</td>";
		 						tags += "<td>"+register.LecName+"</td>";
		 						tags += "<td>"+register.StdName+"</td>";
		 						tags += "<td>"+register.RegLecNo+"</td>";
		 						tags += "<td>"+register.RegMidScore+"</td>";
		 						tags += "<td>"+register.RegFinalScore+"</td>";
		 						tags += "<td>"+register.RegTotalScore+"</td>";
		 						tags += "<td>"+register.RegGrade+"</td>";
		 						tags += "</tr>";
		 						
		 					$('table').append(tags);
		 					
		 				}
		 			 }
		 		});
				
			})
		});
		</script>
	</head>
	<body>
		<h3>수강관리</h3>
		<a href="/College/lecture.jsp">강좌관리</a>
		<a href="#">수강관리</a>
		<a href="/College/student.jsp">학생관리</a>
		<br/>
		
		<h4>수강현황</h4>
		
		<table>
		<td><input type="text" name="RegStdNo"></td>
		<td><input type="submit" id="Search" value="검색"/></td>
		<td><button class="btnR">수강신청</button></td>
		</table>
		
		<div>
			<table border="1">
				<tr>
					<th>학번</th>
					<th>이름</th>
					<th>강좌명</th>
					<th>강좌코드</th>
					<th>중간시험</th>
					<th>기말시험</th>
					<th>총점</th>
					<th>등급</th>
				</tr>
			</table>
		</div>
		
		<section style="display:none;">
			<h4>수강신청</h4>
			<button class="btnClose">닫기</button>
			<table border="1">
				<tr>
					<td>학번</td>
					<td><input type="text" name="RegStdNo"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="StdName"></td>
				</tr>
				<tr>
					<td>신청강좌</td>
					<td>
						<select name="LecName">
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="신청"/></td>
				</tr>
			</table>
		</section>
	</body>
</html>