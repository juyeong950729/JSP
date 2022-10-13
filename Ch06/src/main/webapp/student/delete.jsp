<%@page import="config.DB"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String StdNo = request.getParameter("StdNo");
	
	try{
		Connection conn = DB.getInstance().getConnection();
		String sql = "DELETE FROM `student` WHERE `StdNo`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, StdNo);
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");

%>