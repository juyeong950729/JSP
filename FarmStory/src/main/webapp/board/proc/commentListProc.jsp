<%@page import="kr.co.farmstory.dao.ArticleDAO"%>
<%@page import="kr.co.farmstory.vo.ArticleVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	String parent = request.getParameter("parent");
	List<ArticleVO> comments = ArticleDAO.getInstance().selectComments(parent);
	
	Gson gson = new Gson();
	String jsonData = gson.toJson(comments);
	
	out.print(jsonData);

%>