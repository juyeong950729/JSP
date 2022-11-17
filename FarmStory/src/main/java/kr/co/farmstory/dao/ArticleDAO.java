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
import kr.co.farmstory.vo.FileBean;

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
	
	public ArticleVO insertComment (ArticleVO comment) {
		
		ArticleVO art = null;
		int result = 0;
		
		try {
			logger.info("insertComment...");
			conn = getConnection();
			conn.setAutoCommit(false);
			
			PreparedStatement psmt1 = conn.prepareStatement(Sql.INSERT_COMMENT);
			PreparedStatement psmt2 = conn.prepareStatement(Sql.UPDATE_ARTICLE_COMMENT_PLUS);
			stmt = conn.createStatement();
			psmt1.setInt(1, comment.getParent());
			psmt1.setString(2, comment.getContent());
			psmt1.setString(3, comment.getUid());
			psmt1.setString(4, comment.getRegip());
			psmt2.setInt(1, comment.getParent());
			
			result = psmt1.executeUpdate();
			psmt2.executeUpdate();
			rs = stmt.executeQuery(Sql.SELECT_COMMENT_LATEST);
			
			conn.commit();
			
			if(rs.next()) {
				art = new ArticleVO();
				art.setNo(rs.getInt(1));
				art.setParent(rs.getInt(2));
				art.setContent(rs.getString(6));
				art.setRdate(rs.getString(11).substring(2, 10));
				art.setNick(rs.getString(12));
			}
			
			close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return art;
	}
	
	public ArticleVO selectArticle(String no) {
		ArticleVO art = null;
		
		try {
			logger.info("selectArticle");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ARTICLE);
			psmt.setString(1, no);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()){
				art = new ArticleVO();
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
				art.setFno(rs.getInt(12));
				art.setPno(rs.getInt(13));
				art.setNewName(rs.getString(14));
				art.setOriName(rs.getString(15));
				art.setDownload(rs.getInt(16));
			}
			
			close();
		} catch (Exception e){
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
		return art;
	
	}

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
	
	public FileBean selectFile(String parent) {
		FileBean fb = null;
		
		try {
			logger.info("selectFile...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_FILE);
			psmt.setString(1, parent);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				fb = new FileBean();
				fb.setFno(rs.getInt(1));
				fb.setParent(rs.getInt(2));
				fb.setNewName(rs.getString(3));
				fb.setOriName(rs.getString(4));
				fb.setDownload(rs.getInt(5));
			}
			
			close();
		} catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return fb;
	}
	
	public List<ArticleVO> selectComments (String parent) {
		
		List<ArticleVO> comments = new ArrayList<>();
		
		try {
			logger.info("selectComments");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_COMMENTS);
			psmt.setString(1, parent);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleVO comment = new ArticleVO();
				comment.setNo(rs.getInt(1));
				comment.setParent(rs.getInt(2));
				comment.setComment(rs.getInt(3));
				comment.setCate(rs.getString(4));
				comment.setTitle(rs.getString(5));
				comment.setContent(rs.getString(6));
				comment.setFile(rs.getInt(7));
				comment.setHit(rs.getInt(8));
				comment.setUid(rs.getString(9));
				comment.setRegip(rs.getString(10));
				comment.setRdate(rs.getString(11));
				comment.setNick(rs.getString(12));
				
				comments.add(comment);
			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
		return comments;
	}

	public List<ArticleVO> selectLatests(String cate1, String cate2, String cate3) {
		
		List<ArticleVO> latests = new ArrayList<>();
		
		try {
			logger.info("selectLatests...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_LATESTS);
			psmt.setString(1, cate1);
			psmt.setString(2, cate2);
			psmt.setString(3, cate3);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleVO art = new ArticleVO();
				art.setNo(rs.getInt(1));
				art.setTitle(rs.getString(2));
				art.setRdate(rs.getString(3).substring(2, 10));
				
				latests.add(art);
			}
			
			close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return latests;
	}
	
	public synchronized List<ArticleVO> selectLatests(String cate) {
		
		List<ArticleVO> latests = new ArrayList<>();
		
		try {
			logger.info("selectLatests(String)...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_LATEST);
			psmt.setString(1, cate);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleVO art = new ArticleVO();
				art.setNo(rs.getInt(1));
				art.setTitle(rs.getString(2));
				art.setRdate(rs.getString(3).substring(2, 10));
				
				latests.add(art);
			}
			
			close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return latests;
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
	
	public void updateArticle(String no, String content, String title) {
		try{
			logger.info("updateArticle");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setString(3, no);
			psmt.executeUpdate();
			psmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
	}
	
	public void updateArticleHit(String no) {
		
		try {
			logger.info("updateArticleHit");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_HIT);
			psmt.setString(1, no);
			psmt.executeUpdate();
			psmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
	}
	
	public void updateFileDownload (int fno) {
		try {
			logger.info("updateFileDownload...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.UPDATE_FILE_DOWNLOAD);
			psmt.setInt(1, fno);
			psmt.executeUpdate();
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public int updateComment(String no, String content) {
		
		int result = 0;
		
		try {
			logger.info("updateComment...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.UPDATE_COMMENT);
			psmt.setString(1, content);
			psmt.setString(2, no);
			
			result = psmt.executeUpdate();
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	}
	
	public void deleteArticle(String no) {
		try {
			logger.info("deleteArticle...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.DELETE_ARTICLE);
			psmt.setString(1, no);
			psmt.setString(2, no);
			psmt.executeUpdate();
			close();
		} catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public int deleteComment (String no, String parent) {
		
		int result = 0;
		try {
			logger.info("deleteComment...");
			conn = getConnection();
			
			conn.setAutoCommit(false);
			PreparedStatement psmt1 = conn.prepareStatement(Sql.DELETE_COMMENT);
			PreparedStatement psmt2 = conn.prepareStatement(Sql.UPDATE_ARTICLE_COMMENT_MINUS);
			psmt1.setString(1, no);
			psmt2.setString(1, parent);
			result = psmt1.executeUpdate();
			psmt2.executeUpdate();
			
			conn.commit();
			
			close();
		} catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return result;
	}
	
	public String deleteFile(String no) {
		
		String newName = null;
		
		try {
			logger.info("deleteFile...");
			conn = getConnection();
			
			conn.setAutoCommit(false);
			PreparedStatement psmt1 = conn.prepareStatement(Sql.SELECT_FILE);
			PreparedStatement psmt2 = conn.prepareStatement(Sql.DELETE_FILE);
			
			psmt1.setString(1, no);
			psmt2.setString(2, no);
			
			rs = psmt1.executeQuery();
			psmt2.executeUpdate();
			
			conn.commit();
			
			if(rs.next()) {
				newName = rs.getString(3);
			}
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return newName;
		
	}

}
