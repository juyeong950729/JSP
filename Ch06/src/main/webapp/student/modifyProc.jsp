<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DB"%>
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
		Statement stmt = conn.createStatement();
		String sql = "UPDATE `student` SET ";
			   sql += "`StdName` ='"+StdName+"',";
			   sql += "`StdHp` ='"+StdHp+"',";
			   sql += "`StdYear` ="+StdYear+",";
			   sql += "`StdAddress` ='"+StdAddress+"' ";
			   sql += "	WHERE `StdNo` = '"+StdNo+"'";
		
		stmt.executeUpdate(sql);
		conn.close();
		
	} catch(Exception e){
		e.printStackTrace();
	}

	response.sendRedirect("./list.jsp");

%>