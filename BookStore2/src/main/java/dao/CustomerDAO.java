package dao;

import java.awt.dnd.DropTargetContext;
import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import db.Sql;
import vo.CustomerVO;

public class CustomerDAO extends DBHelper {
	
	private static CustomerDAO instance = new CustomerDAO();
	public static CustomerDAO getInstance() {
		return instance;
	}
	private CustomerDAO () {}
	
	public void insertCustomer(CustomerVO cust) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_CUSTOMER);
			psmt.setString(1, cust.getName());
			psmt.setString(2, cust.getAddress());
			psmt.setString(3, cust.getPhone());
			psmt.executeUpdate();
			close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public CustomerVO selectCustomer(String custId) {
		
		CustomerVO cust = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_CUSTOMER);
			psmt.setString(1, custId);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				cust = new CustomerVO();
				cust.setCustId(rs.getString(1));
				cust.setName(rs.getString(2));
				cust.setAddress(rs.getString(3));
				cust.setPhone(rs.getString(4));
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cust;
	}
	public List<CustomerVO> selectCustomers() {
		
		List<CustomerVO> custs = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_CUSTOMERS);
			
			while (rs.next()) {
				CustomerVO cust = new CustomerVO();
				cust.setCustId(rs.getString(1));
				cust.setName(rs.getString(2));
				cust.setAddress(rs.getString(3));
				cust.setPhone(rs.getString(4));
				custs.add(cust);
			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return custs;
	}
	public void updateCustomer(CustomerVO cust) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.UPDATE_CUSTOMER);
			psmt.setString(1, cust.getName());
			psmt.setString(2, cust.getAddress());
			psmt.setString(3, cust.getPhone());
			psmt.setInt(4, cust.getCustId());
			psmt.executeUpdate();
			close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteCustomer(String custId) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.DELETE_CUSTOMER);
			psmt.setString(1, custId);
			psmt.executeUpdate();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
