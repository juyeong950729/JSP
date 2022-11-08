<%@page import="com.google.gson.JsonObject"%>
<%@page import="config.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String StdNo      = request.getParameter("StdNo");
	String StdName    = request.getParameter("StdName");
	String StdHp      = request.getParameter("StdHp");
	String StdYear    = request.getParameter("StdYear");
	String StdAddress = request.getParameter("StdAddress");
	
	int result = 0;
	
	try {
		Connection conn = DBCP.getConnection();
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_STUDENT);
		psmt.setString(1, StdNo);
		psmt.setString(2, StdName);
		psmt.setString(3, StdHp);
		psmt.setString(4, StdYear);
		psmt.setString(5, StdAddress);
		
		result = psmt.executeUpdate();
		psmt.close();
		conn.close();
	} catch (Exception e){
		e.printStackTrace();
	}
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	String jsonData = json.toString();
	out.print(jsonData);
	
%>