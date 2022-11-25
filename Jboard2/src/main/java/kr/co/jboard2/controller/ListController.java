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
		
		String pg = req.getParameter("pg");
		
		int start = 0;
		int currentPage = 1;
		int total = 0;
		int lastPageNum = 0;
		int PageStartNum = 0;
		
		// 현재 페이지 게시물 limit 시작값 계산
		if (pg != null) {
			currentPage = Integer.parseInt(pg);
		}
		
		// 전체 게시물 갯수 구하기
		total = service.selectCountTotal();
		
		// 페이지 마지막 번호 계산
		if (total % 10 == 0) {
			lastPageNum = (total / 10);
		} else {
			lastPageNum = (total / 10) + 1;
		}
		
		// 페이지 그룹 계산
		int[] result = service.getPageGroupNum(currentPage, lastPageNum);
		
		// 페이지 시작 번호 계산
		start = (currentPage - 1) * 10;
		PageStartNum = total - start;
		
		start = (currentPage - 1) * 10;
		
		// 현재 페이지 게시물 가져오기
		List<ArticleVO> articles = service.selectArticles(start);
		
		req.setAttribute("articles", articles);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("PageGroupStart", result[0]);
		req.setAttribute("PageGroupEnd", result[1]);
		req.setAttribute("PageStartNum", PageStartNum+1);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
}
