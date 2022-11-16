<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.farmstory.dao.ArticleDAO"%>
<%@page import="kr.co.farmstory.vo.ArticleVO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String savePath = application.getRealPath("/file");
	int maxSize = 1024 * 1024 * 10;
	MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	
	String group 	= mr.getParameter("group");
	String cate 	= mr.getParameter("cate");
	String uid 		= mr.getParameter("uid");
	String title 	= mr.getParameter("title");
	String content 	= mr.getParameter("content");
	String fname 	= mr.getParameter("fname");
	String regip 	= request.getRemoteAddr();
	
	ArticleVO art = new ArticleVO();
	art.setCate(cate);
	art.setTitle(title);
	art.setContent(content);
	art.setFname(fname);
	art.setUid(uid);
	art.setRegip(regip);
	
	ArticleDAO dao = ArticleDAO.getInstance();
	
	int parent = dao.insertArticle(art);
	
	if (fname != null){
		
		int i = fname.lastIndexOf(".");
		String ext = fname.substring(i);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
		String now = sdf.format(new Date());
		String newName = now+uid+ext;
		
		File f1 = new File(savePath+"/"+fname);
		File f2 = new File(savePath+"/"+newName);
		
		f1.renameTo(f2);
		
		dao.insertFile(parent, newName, fname);
	}
	
	response.sendRedirect("/FarmStory/board/list.jsp?group="+group+"&cate="+cate);
	
%>