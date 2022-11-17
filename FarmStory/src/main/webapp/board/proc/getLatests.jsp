<%@page import="com.google.gson.Gson"%>
<%@page import="kr.co.farmstory.vo.ArticleVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.farmstory.dao.ArticleDAO"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cate = request.getParameter("cate");

	List<ArticleVO> latests = ArticleDAO.getInstance().selectLatests(cate);
	
	Gson gson = new Gson();
	String jsonData = gson.toJson(latests);

	out.print(jsonData);
%>