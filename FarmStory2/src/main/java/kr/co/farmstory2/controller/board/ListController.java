package kr.co.farmstory2.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.dao.ArticleDAO;
import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.vo.ArticleVO;

@WebServlet("/board/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;

	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String group = req.getParameter("group");
		String cate  = req.getParameter("cate");
		String pg 	 = req.getParameter("pg");
		
		int start = 0;
		int total = 0;
		int lastPageNum = 0;
		int currentPage = 1;
		int currentPageGroup = 1;
		int PageGroupStart = 0;
		int PageGroupEnd = 0;
		int PageStartNum = 0;

		
		// 현재 페이지 게시물 limit 시작값 계산
		if (pg != null) {
			currentPage = Integer.parseInt(pg);
		} 
		start = (currentPage - 1) * 10;
		
		// 페이지 그룹 계산
		currentPageGroup = (int) Math.ceil(currentPage / 10.0);
		PageGroupStart = (currentPageGroup - 1) * 10 + 1;
		PageGroupEnd = currentPageGroup * 10;
		
		total = service.selectCountTotal(cate);
		
		// 페이지 마지막 번호 계산
		if(total % 10 == 0) {
			lastPageNum = (total / 10);
		} else{
			lastPageNum = (total / 10) + 1;
		}
		
		if (PageGroupEnd > lastPageNum){
			PageGroupEnd = lastPageNum;
		}
		
		// 페이지 시작 번호 계산
		PageStartNum = total - start;

		// 현재 페이지 게시물 가져오기
		List<ArticleVO> articles = service.selectArticles(cate, start);
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("pg", pg);
		req.setAttribute("articles", articles);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("PageStartNum", PageStartNum+1);
		req.setAttribute("PageGroupStart", PageGroupStart);
		req.setAttribute("PageGroupEnd", PageGroupEnd);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/list.jsp?group="+group+"&cate="+cate+"&pg="+pg);
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
