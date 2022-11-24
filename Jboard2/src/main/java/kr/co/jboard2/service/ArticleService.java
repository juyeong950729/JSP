package kr.co.jboard2.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dao.ArticleDAO;
import kr.co.jboard2.vo.ArticleVO;

public enum ArticleService {
	
	INSTANCE;
	private ArticleDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService() {
		dao = new ArticleDAO();
	}
	
	public void insertArticle(ArticleVO article) {
		dao.insertArticle(article);
	}
	public void selectArticle() {}
	public List<ArticleVO> selectArticles(int limitStart) {
		return dao.selectArticles(limitStart);
	}
	public int selectCountTotal() {
		return dao.selectCountTotal();
	}
	public void updateArticle() {}
	public void deleteArticle() {}

}
