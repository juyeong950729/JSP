<%@page import="config.Sql"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String prodNo 		= request.getParameter("prodNo");
	String prodCount 	= request.getParameter("prodCount");
	String prodOrderer  = request.getParameter("prodOrderer");
	
	int result = 0;
	
	try {
		Connection conn = DBCP.getConnection();

		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ORDER);
		psmt.setString(1, prodOrderer);
		psmt.setString(2, prodNo);
		psmt.setString(3, prodCount);
		
		result = psmt.executeUpdate();
		psmt.close();
		conn.close();
	} catch(Exception e){
		e.printStackTrace();
	}
	
	// JSON 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	String jsonData = json.toString();
	out.print(jsonData);

%>