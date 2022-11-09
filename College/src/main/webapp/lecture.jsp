<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.Sql"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.LectureBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<LectureBean> lectures = new ArrayList<>();

	try {
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(Sql.SELECT_LECTURE);
		
		while(rs.next()){
			LectureBean lb = new LectureBean();
			lb.setLecNo(rs.getInt(1));
			lb.setLecName(rs.getString(2));
			lb.setLecCredit(rs.getInt(3));
			lb.setLecTime(rs.getInt(4));
			lb.setLecClass(rs.getString(5));
			
			lectures.add(lb);
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
		<title>강좌관리</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
		$(function(){
			
			$('.btnL').click(function(){
				$('section').show();
			});
			
			$('.btnClose').click(function(){
				$('section').hide();
			});
			
			
			$('input[type=submit]').click(function(){
				let LecNo 		= $('input[name=LecNo]').val();
				let LecName 	= $('input[name=LecName]').val();
				let LecCredit 	= $('input[name=LecCredit]').val();
				let LecTime 	= $('input[name=LecTime]').val();
				let LecClass 	= $('input[name=LecClass]').val();
				
				let jsonData = {
					"LecNo":LecNo,
					"LecName":LecName,
					"LecCredit":LecCredit,
					"LecTime":LecTime,
					"LecClass":LecClass
				};
				
				$.post('./proc/lectureProc.jsp', jsonData, function(data){
					if (data.result > 0){
						alert('등록 완료!');
						
						let tags = '<tr>';
							tags += '<th>'+LecNo+'</th>';
							tags += '<th>'+LecName+'</th>';
							tags += '<th>'+LecCredit+'</th>';
							tags += '<th>'+LecTime+'</th>';
							tags += '<th>'+LecClass+'</th>';
							tags += '</tr>';
						
						
						$('.lecture').append(tags);
						
					} else {
						alert('등록 실패!');
					}
				});
				
			});
			
		});
		</script>
	</head>
	<body>
		<h3>강좌관리</h3>
		<a href="#">강좌관리</a>
		<a href="/College/register.jsp">수강관리</a>
		<a href="/College/student.jsp">학생관리</a>
		<br/>
		
		<h4>강좌현황</h4>
		<button class="btnL">등록</button>
		<table border="1" class="lecture">
			<tr>
				<th>번호</th>
				<th>강좌명</th>
				<th>학점</th>
				<th>시간</th>
				<th>강의장</th>
			</tr>
			<% for (LectureBean lb : lectures) { %>
			<tr>
				<td><%= lb.getLecNo() %></td>
				<td><%= lb.getLecName() %></td>
				<td><%= lb.getLecCredit() %></td>
				<td><%= lb.getLecTime() %></td>
				<td><%= lb.getLecClass() %></td>
			</tr>
			<% } %>
		</table>
		
		<section style="display:none;">
			<h4>강좌등록</h4>
			<button class="btnClose">닫기</button>
			<table border="1">
				<tr>
					<td>번호</td>
					<td><input type="text" name="LecNo"/></td>
				</tr>
				<tr>
					<td>강좌명</td>
					<td><input type="text" name="LecName"/></td>
				</tr>
				<tr>
					<td>학점</td>
					<td><input type="text" name="LecCredit"/></td>
				</tr>
				<tr>
					<td>시간</td>
					<td><input type="text" name="LecTime"/></td>
				</tr>
				<tr>
					<td>강의장</td>
					<td><input type="text" name="LecClass"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="추가"/></td>
				</tr>
			</table>
		</section>
	</body>
</html>