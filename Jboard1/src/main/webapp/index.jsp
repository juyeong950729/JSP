<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	UserBean sessUser = (UserBean)session.getAttribute("sessUser");

	if(sessUser == null){
		// 로그인을 안 했으면
		pageContext.forward("./user/login.jsp");
	} else {
		pageContext.forward("./list.jsp");
	}
%>