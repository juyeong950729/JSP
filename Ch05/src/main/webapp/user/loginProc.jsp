<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id 	= request.getParameter("id");
	String pw 	= request.getParameter("pw");
	String auto = request.getParameter("auto");
	
	if(pw.equals("1234")){
		
		if (auto != null){
			Cookie cookie = new Cookie("cid", id);
			cookie.setMaxAge(60*3);
			response.addCookie(cookie);
		}
		
		// 회원맞음
		session.setAttribute("sessid", id);
		response.sendRedirect("./loginSuccess.jsp");
	} else{
		// 회원아님
		response.sendRedirect("./login.jsp");
	}
	
%>