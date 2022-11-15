<%@page import="dao.UserDAO"%>
<%@page import="vo.UserVO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	UserVO user = UserDAO.getInstance().selectUser(uid, pass);
	
	if (user != null){
		session.setAttribute("sessUser", user);
		response.sendRedirect("/FarmStory/");
	} else {
		response.sendRedirect("/FarmStory/user/login.jsp");
	}
	

%>