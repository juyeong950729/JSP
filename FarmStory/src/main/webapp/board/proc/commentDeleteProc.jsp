<%@page import="kr.co.farmstory.dao.ArticleDAO"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	String no 	  = request.getParameter("no");
	String parent = request.getParameter("parent");
	
	int result = ArticleDAO.getInstance().deleteComment(no, parent);
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	out.print(json.toString());
%>