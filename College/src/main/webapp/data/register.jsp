<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.RegisterBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String RegStdNo = request.getParameter("RegStdNo");
	String RegLecNo = request.getParameter("RegLecNo");
	String RegMidScore = request.getParameter("RegMidScore");
	String RegFinalScore = request.getParameter("RegFinalScore");
	String RegTotalScore = request.getParameter("RegTotalScore");
	String RegGrade = request.getParameter("RegGrade");
	String LecNo = request.getParameter("LecNo");
	String StdName = request.getParameter("StdName");
	
	List<RegisterBean> registers = new ArrayList<>();
	
	try {
		Connection conn = DBCP.getConnection();
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_REGISTER);
		psmt.setString(1, "RegStdNo");
		ResultSet rs = psmt.executeQuery();
		
		while (rs.next()){
			RegisterBean rb = new RegisterBean();
			rb.setRegStdNo(rs.getString(1));
			rb.setRegLecNo(rs.getInt(2));
			rb.setRegMidScore(rs.getInt(3));
			rb.setRegFinalScore(rs.getInt(4));
			rb.setRegTotalScore(rs.getInt(5));
			rb.setRegGrade(rs.getString(6));
			rb.setLecName(rs.getString(7));
			rb.setStdName(rs.getString(8));
			registers.add(rb);
		}
		rs.close();
		psmt.close();
		conn.close();
	} catch (Exception e){
		e.printStackTrace();
	}
	
	// List를 JSON 변환
	Gson gson = new Gson();
	String jsonData = gson.toJson(registers);
	
	// JSON 출력
	out.print(jsonData);
	
	
%>