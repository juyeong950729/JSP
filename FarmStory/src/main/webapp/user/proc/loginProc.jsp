<%@page import="kr.co.farmstory.dao.UserDAO"%>
<%@page import="kr.co.farmstory.vo.UserVO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	UserVO user = UserDAO.INSTANCE.selectUser(uid, pass);
	
	if (user != null){
		// 회원이 맞을 경우
		session.setAttribute("sessUser", user);
		response.sendRedirect("/FarmStory");
	} else {
		// 회원이 아닐 경우
		response.sendRedirect("/FarmStory/user/login.jsp?success=100");
	}
	

%>