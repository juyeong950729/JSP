package kr.co.farmstory.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory.db.DBHelper;
import kr.co.farmstory.db.Sql;
import kr.co.farmstory.vo.ArticleVO;

public class ArticleDAO extends DBHelper {
	
	private static ArticleDAO instance = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return instance;
	}
	private ArticleDAO() {}
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int insertArticle(ArticleVO art) {
		
		int parent = 0;
		try {
			logger.info("insertArticle...");
			
			conn = getConnection();
			conn.setAutoCommit(false);
			
			psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
			stmt = conn.createStatement();
			
			psmt.setString(1, art.getCate());
			psmt.setString(2, art.getTitle());
			psmt.setString(3, art.getContent());
			psmt.setInt(4, art.getFname() == null ? 0 : 1);
			psmt.setString(5, art.getUid());
			psmt.setString(6, art.getRegip());
			psmt.executeUpdate();
			rs = stmt.executeQuery(Sql.SELECT_MAX_NO);
			
			conn.commit();
			
			if(rs.next()) {
				parent = rs.getInt(1);
			}
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return parent;
	}
	public void insertFile(int parent, String newName, String fname) {
		try {
			logger.info("insertFile...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_FILE);
			psmt.setInt(1, parent);
			psmt.setString(2, newName);
			psmt.setString(3, fname);
			psmt.executeUpdate();
			close();
		} catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	public void selectArticle() {}

public List<ArticleVO> selectArticles (String cate, int limitStart) {
		
		List<ArticleVO> articles = new ArrayList<>();
		
		try{
			logger.info("selectArticles");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
			psmt.setString(1, cate);
			psmt.setInt(2, limitStart);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()){
				ArticleVO art = new ArticleVO();
				art.setNo(rs.getInt(1));
				art.setParent(rs.getInt(2));
				art.setComment(rs.getInt(3));
				art.setCate(rs.getString(4));
				art.setTitle(rs.getString(5));
				art.setContent(rs.getString(6));
				art.setFile(rs.getInt(7));
				art.setHit(rs.getInt(8));
				art.setUid(rs.getString(9));
				art.setRegip(rs.getString(10));
				art.setRdate(rs.getString(11));
				art.setNick(rs.getString(12));
				
				articles.add(art);
			}
			
			close();
		} catch(Exception e){
			logger.error(e.getMessage());
		}
		
		return articles;
	}
	
	public int selectCountTotal(String cate) {
		
		int total = 0;
		try {
			logger.info("selectCountTotal");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_COUNT_TOTAL);
			psmt.setString(1, cate);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		return total;
	}
	
	public void updateArticle() {}
	public void deleteArticle() {}

}
