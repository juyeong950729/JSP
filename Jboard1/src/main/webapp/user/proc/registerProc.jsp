<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String uid 	 = request.getParameter("uid");
	String pass1 = request.getParameter("pass1");
	String name  = request.getParameter("name");
	String nick  = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp 	 = request.getParameter("hp");
	String zip	 = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String regip = request.getRemoteAddr();
	
	try {
		Connection conn = DBCP.getConnection();
		String sql = "INSERT INTO `board_user` set";
			   sql += "`uid`=?,";
			   sql += "`pass`=SHA2(?, 256),";
			   sql += "`name`=?,";
			   sql += "`nick`=?,";
			   sql += "`email`=?,";
			   sql += "`hp`=?,";
			   sql += "`zip`=?,";
			   sql += "`addr1`=?,";
			   sql += "`addr2`=?,";
			   sql += "`regip`=?,";
			   sql += "`rdate`=now()";
			   
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		psmt.setString(2, pass1);
		psmt.setString(3, name);
		psmt.setString(4, nick);
		psmt.setString(5, email);
		psmt.setString(6, hp);
		psmt.setString(7, zip);
		psmt.setString(8, addr1);
		psmt.setString(9, addr2);
		psmt.setString(10, regip);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	} catch (Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("/Jboard1/user/login.jsp");
	
%>