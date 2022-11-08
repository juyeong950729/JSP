<%@page import="com.google.gson.JsonObject"%>
<%@page import="config.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String LecNo     = request.getParameter("LecNo");
	String LecName   = request.getParameter("LecName");
	String LecCredit = request.getParameter("LecCredit");
	String LecTime   = request.getParameter("LecTime");
	String LecClass  = request.getParameter("LecClass");
	
	int result = 0;
	
	try {
		Connection conn = DBCP.getConnection();
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_LECTURE);
		psmt.setString(1, LecNo);
		psmt.setString(2, LecName);
		psmt.setString(3, LecCredit);
		psmt.setString(4, LecTime);
		psmt.setString(5, LecClass);
		
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