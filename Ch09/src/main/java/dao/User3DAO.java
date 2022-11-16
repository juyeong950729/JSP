package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.User3VO;

public class User3DAO extends DBHelper {
	
	private static User3DAO instance = new User3DAO();
	public static User3DAO getInstance() {
		return instance;
	}
	private User3DAO() {}
	
	public void insertUser3(User3VO vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("INSERT INTO `user3` VALUES (?,?,?,?)");
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getHp());
			psmt.setInt(4, vo.getAge());
			psmt.executeUpdate();
			close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public User3VO selectUser3(String uid) {
		User3VO vo = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT * FROM `user3` WHERE `uid`=?");
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				vo = new User3VO();
				vo.setUid(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setHp(rs.getString(3));
				vo.setAge(rs.getInt(4));
			}
			close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	public List<User3VO> selectUser3s() {
		List<User3VO> users = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM `user3`");
			
			while(rs.next()) {
				User3VO vo = new User3VO();
				vo.setUid(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setHp(rs.getString(3));
				vo.setAge(rs.getInt(4));
				users.add(vo);
			}
			
			close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	public void updateUser3() {}
	public void deleteUser3(String uid) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("DELETE FROM `user3` WHERE `uid`=?");
			psmt.setString(1, uid);
			psmt.executeUpdate();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
