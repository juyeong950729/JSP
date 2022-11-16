<%@page import="kr.co.farmstory.dao.UserDAO"%>
<%@page import="kr.co.farmstory.vo.UserVO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String uid 	 = request.getParameter("uid");
	String pass1 = request.getParameter("pass1");
	String name  = request.getParameter("name");
	String nick  = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp 	 = request.getParameter("hp");
	String zip	 = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String regip = request.getRemoteAddr();
	
	UserVO user = new UserVO();
	user.setUid(uid);
	user.setPass(pass1);
	user.setName(name);
	user.setNick(nick);
	user.setEmail(email);
	user.setHp(hp);
	user.setZip(zip);
	user.setAddr1(addr1);
	user.setAddr2(addr2);
	user.setRegip(regip);
	
	UserDAO.INSTANCE.insertUser(user);
	
	response.sendRedirect("/FarmStory/user/login.jsp");
	
%>