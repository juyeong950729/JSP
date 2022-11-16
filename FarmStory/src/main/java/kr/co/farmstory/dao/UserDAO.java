package kr.co.farmstory.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mysql.cj.protocol.Resultset;

import kr.co.farmstory.db.DBCP;
import kr.co.farmstory.db.Sql;
import kr.co.farmstory.vo.TermsVO;
import kr.co.farmstory.vo.UserVO;

public enum UserDAO {
	INSTANCE;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/*private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	private UserDAO() {}*/
	
	public void insertUser(UserVO user) {
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_USER);
			psmt.setString(1, user.getUid());
			psmt.setString(2, user.getPass());
			psmt.setString(3, user.getName());
			psmt.setString(4, user.getNick());
			psmt.setString(5, user.getEmail());
			psmt.setString(6, user.getHp());
			psmt.setString(7, user.getZip());
			psmt.setString(8, user.getAddr1());
			psmt.setString(9, user.getAddr2());
			psmt.setString(10, user.getRegip());
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
	}
	public TermsVO selectTerms() {
		TermsVO terms = null;
		try {
			Connection conn = DBCP.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(Sql.SELECT_TERMS);
			if(rs.next()) {
				terms = new TermsVO();
				terms.setTerms(rs.getString(1));
				terms.setPrivacy(rs.getString(2));
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch(Exception e) {
			logger.error(e.getMessage());
		}
		return terms;
	}
	public UserVO selectUser (String uid, String pass) {
		UserVO user = null;
		try {
			logger.info("selectUser...");
			
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_USER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				user = new UserVO();
				user.setUid(rs.getString(1));
				user.setPass(rs.getString(2));
				user.setName(rs.getString(3));
				user.setNick(rs.getString(4));
				user.setEmail(rs.getString(5));
				user.setHp(rs.getString(6));
				user.setGrade(rs.getInt(7));
				user.setZip(rs.getString(8));
				user.setAddr1(rs.getString(9));
				user.setAddr2(rs.getString(10));
				user.setRegip(rs.getString(11));
				user.setRdate(rs.getString(12));
			}
			rs.close();
			psmt.close();
			conn.close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("user : "+user);
		return user;
	}
	public void selectUsers () {}
	public int selectCountNick(String nick) {
		int result = 0;
		
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_NICK);
			psmt.setString(1, nick);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
		return result;
	}
	
	public int selectCountUid (String uid) {
		int result = 0;
		
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_UID);
			psmt.setString(1, uid);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
		return result;
	}
	
	public void updateUser () {}
	public void deleteUser () {}

}
