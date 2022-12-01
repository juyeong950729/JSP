package kr.co.farmstory2.controller.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.vo.ArticleVO;

@WebServlet("/board/modify.do")
public class ModifyController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;

	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no	   = req.getParameter("no");
		String pg	   = req.getParameter("pg");
		String group   = req.getParameter("group");
		String cate	   = req.getParameter("cate");
		
		ArticleVO article = service.selectArticle(no);
		
		req.setAttribute("pg", pg);
		req.setAttribute("group", group);
		req.setAttribute("article", article);
		req.setAttribute("cate", cate);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String no  	   = req.getParameter("no");
		String pg 	   = req.getParameter("pg");
		String cate	   = req.getParameter("cate");
		String group   = req.getParameter("group");
		String title   = req.getParameter("title");
		String content = req.getParameter("content");
		
		service.updateArticle(no, title, content);
		
		req.setAttribute("no", no);
		req.setAttribute("pg", pg);
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		
		resp.sendRedirect("/FarmStory2/board/view.do?group="+group+"&cate="+cate+"&no="+no+"&pg="+pg);
		
	}
}
