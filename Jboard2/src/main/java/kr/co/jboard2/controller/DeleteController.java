package kr.co.jboard2.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.service.ArticleService;

@WebServlet("/delete.do")
public class DeleteController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	public void init() throws ServletException {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String no = req.getParameter("no");
		String pg = req.getParameter("pg");
		
		// 글 삭제 + 댓글 삭제
		service.deleteArticle(no);
		
		// 파일 삭제(DB)
		String fileName = service.deleteFile(no);
		
		// 파일 삭제(디렉터리)
		if(fileName != null){
			ServletContext ctx = req.getServletContext();	
			String path = ctx.getRealPath("/file");
			File file = new File(path, fileName);
			if(file.exists()){
				file.delete();
			}
		}
		
		resp.sendRedirect("/Jboard2/list.do?pg="+pg);

		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
}
