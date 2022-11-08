<%@page import="bean.RegisterBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="config.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String RegStdNo  = request.getParameter("RegStdNo");
	String RegLecNo  = request.getParameter("RegLecNo");
	
	
	int result = 0;
	
	try {
		Connection conn = DBCP.getConnection();
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_REGISTER);
		psmt.setString(1, RegStdNo);
		psmt.setString(2, RegLecNo);
		
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