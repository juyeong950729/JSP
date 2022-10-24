<%@page import="config.DB"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");

	String StdNo 	  = request.getParameter("StdNo");
	String StdName 	  = request.getParameter("StdName");
	String StdHp 	  = request.getParameter("StdHp");
	String StdYear 	  = request.getParameter("StdYear");
	String StdAddress = request.getParameter("StdAddress");
	
	try{
		Connection conn = DB.getInstance().getConnection();
		String sql = "INSERT INTO `student` VALUES (?, ?, ?, ?, ?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, StdNo);
		psmt.setString(2, StdName);
		psmt.setString(3, StdHp);
		psmt.setString(4, StdYear);
		psmt.setString(5, StdAddress);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	} catch(Exception e){
		e.printStackTrace();
	}

	response.sendRedirect("./list.jsp");
%>