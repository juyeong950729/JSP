package kr.co.jboard2.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.service.ArticleService;

@WebServlet("/modify.do")
public class ModifyController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;

	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String no 	   = req.getParameter("no");
		String pg 	   = req.getParameter("pg");
		String title   = req.getParameter("title");
		String content = req.getParameter("content");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/modify.jsp?no="+no+"&pg="+pg);
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String no 	   = req.getParameter("no");
		String pg 	   = req.getParameter("pg");
		String title   = req.getParameter("title");
		String content = req.getParameter("content");
		
		service.updateArticle(no, title, content);
		resp.sendRedirect("/Jboard2/view.do?no="+no+"&pg"+pg+"&title"+title+"&content"+content);

	} 

}
