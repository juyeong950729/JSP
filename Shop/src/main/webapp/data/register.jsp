<%@page import="com.google.gson.JsonObject"%>
<%@page import="config.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String orderId = request.getParameter("orderId");
	String orderProduct = request.getParameter("orderProduct");
	String orderCount = request.getParameter("orderCount");
	int result = 0;
	
	try {
		Connection conn = DBCP.getConnection();
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ORDER);
		psmt.setString(1, orderId);
		psmt.setString(2, orderProduct);
		psmt.setString(3, orderCount);
	} catch (Exception e){
		e.printStackTrace();
	}
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	String jsonData = json.toString();
	
	out.print(jsonData);
	
%>
