package dao;

import java.awt.dnd.DropTargetContext;
import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.User5VO;

public class User5DAO extends DBHelper {
	
	private static User5DAO instance = new User5DAO();
	public static User5DAO getInstance() {
		return instance;
	}
	private User5DAO() {};
	
	public void insertUser5() {}
	public void selectUser5() {}
	public List<User5VO> selectUser5s() {
		
		List<User5VO> users = new ArrayList<>();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM `user5`");
			
			while(rs.next()) {
				User5VO vo = new User5VO();
				vo.setUid(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setBirth(rs.getString(3));
				vo.setAge(rs.getString(4));
				vo.setAddress(rs.getString(5));
				vo.setHp(rs.getString(6));
				users.add(vo);
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	public void updateUser5() {}
	public void deleteUser5() {}

}
