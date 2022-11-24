package kr.co.jboard2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.dao.ArticleDAO;
import kr.co.jboard2.dao.UserDAO;
import kr.co.jboard2.service.ArticleService;
import kr.co.jboard2.vo.ArticleVO;
import kr.co.jboard2.vo.UserVO;

@WebServlet("/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;

	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int limitStart = 0;
		int currentPage = 1;
		int total = 0;
		int lastPageNum = 0;
		int PageGroupCurrent = 1;
		int PageGroupStart = 1;
		int PageGroupEnd = 0;
		int PageStartNum = 0;
		
		// 전체 게시물 갯수 구하기
		total = service.selectCountTotal();
		
		// 페이지 마지막 번호 계산
		if (total % 10 == 0) {
			lastPageNum = (total / 10);
		} else {
			lastPageNum = (total / 10) + 1;
		}
		
		// 페이지 그룹 계산
		PageGroupCurrent = (int) Math.ceil(currentPage / 10.0);
		PageGroupStart = (PageGroupCurrent - 1) * 10 + 1;
		PageGroupEnd = PageGroupCurrent * 10;
		
		if(PageGroupEnd > lastPageNum) {
			PageGroupEnd = lastPageNum;
		}
		
		// 페이지 시작 번호 계산
		PageStartNum = total - limitStart;
		
		// 현재 페이지 게시물 가져오기
		List<ArticleVO> articles = service.selectArticles(limitStart);
		
		req.setAttribute("articles", articles);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
}
