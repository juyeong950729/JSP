package kr.co.farmstory2.controller.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.service.ArticleService;

@WebServlet("/board/delete.do")
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
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		
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
		
		resp.sendRedirect("/FarmStory2/board/list.do?group="+group+"&cate="+cate+"&pg="+pg);

		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
}
