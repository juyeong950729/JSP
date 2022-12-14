<%@page import="kr.co.farmstory.dao.ArticleDAO"%>
<%@page import="kr.co.farmstory.vo.ArticleVO"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no	    = request.getParameter("no");
	//String pg	    = request.getParameter("pg");
	String content  = request.getParameter("content");
	String uid 		= request.getParameter("uid");
	String regip    = request.getRemoteAddr();
	
	ArticleVO comment = new ArticleVO();
	comment.setParent(no);
	comment.setContent(content);
	comment.setUid(uid);
	comment.setRegip(regip);
	
	ArticleVO art = ArticleDAO.getInstance().insertComment(comment);
	
	JsonObject json = new JsonObject();
	json.addProperty("result", 1);
	json.addProperty("no", art.getNo());
	json.addProperty("parent", art.getParent());
	json.addProperty("nick", art.getNick());
	json.addProperty("date", art.getRdate());
	json.addProperty("content", art.getContent());
	
	String jsonData = json.toString();
	out.print(jsonData);
	
	//response.sendRedirect("/Jboard1/view.jsp?no="+no+"&pg="+pg);
%>