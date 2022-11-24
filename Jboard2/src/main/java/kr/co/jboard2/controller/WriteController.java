package kr.co.jboard2.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jboard2.service.ArticleService;
import kr.co.jboard2.vo.ArticleVO;
import kr.co.jboard2.vo.UserVO;

@WebServlet("/write.do")
public class WriteController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;

	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/write.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession sess = req.getSession();
		UserVO sessUser = (UserVO)sess.getAttribute("sessUser");
		String uid = sessUser.getUid();
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String regip = req.getRemoteAddr();
		int file = 0;
		
		ArticleVO article = new ArticleVO();
		article.setUid(uid);
		article.setTitle(title);
		article.setContent(content);
		article.setFile(file);
		article.setRegip(regip);
		
		service.insertArticle(article);
		
		resp.sendRedirect("/Jboard2/list.do");
		
	} 

}
