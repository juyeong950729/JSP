package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.User4VO;

public class User4DAO extends DBHelper {
	
	private static User4DAO instance = new User4DAO();
	public static User4DAO getInstance() {
		return instance;
	}
	
	private User4DAO() {}
	
	public void insertUser4(User4VO vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("INSERT INTO `user4` VALUES (?,?,?,?)");
			psmt.setString(1, vo.getName());
			psmt.setInt(2, vo.getAge());
			psmt.setInt(3, vo.getGender());
			psmt.setString(4, vo.getAddr());
			psmt.executeUpdate();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public User4VO selectUser4(String seq) {
		User4VO vo = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT * FROM `user4` WHERE `seq`=?");
			psmt.setString(1, seq);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				vo = new User4VO();
				vo.setSeq(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setAge(rs.getInt(3));
				vo.setGender(rs.getInt(4));
				vo.setAddr(rs.getString(5));
			}
			close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	public List<User4VO> selectUser4s() {
		
		List<User4VO> users = new ArrayList<>();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM `user4`");
			
			while(rs.next()) {
				User4VO vo = new User4VO();
				vo.setSeq(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setAge(rs.getInt(3));
				vo.setGender(rs.getInt(4));
				vo.setAddr(rs.getString(5));
				users.add(vo);
			}
			
			close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return users;
	}
	public void updateUser4(User4VO vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("UPDATE `user4` SET `name`=?, `age`=?, `gender`=?, `addr`=?");
			psmt.setString(1, vo.getName());
			psmt.setInt(2, vo.getAge());
			psmt.setInt(3, vo.getGender());
			psmt.setString(4, vo.getAddr());
			psmt.executeUpdate();
			close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteUser4(String seq) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("DELETE FROM `user4` WHERE `seq`=?");
			psmt.setString(1, seq);
			psmt.executeUpdate();
			close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
