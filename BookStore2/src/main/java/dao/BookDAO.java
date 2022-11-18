package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import db.Sql;
import vo.BookVO;

public class BookDAO extends DBHelper {
	
	private static BookDAO instance = new BookDAO();
	public static BookDAO getInstance() {
		return instance;
	}
	private BookDAO() {}
	
	
	public void insertBook(BookVO book) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_BOOK);
			psmt.setString(1, book.getBookName());
			psmt.setString(2, book.getPublisher());
			psmt.setInt(3, book.getPrice());
			psmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public BookVO selectBook(String bookId) {
		
		BookVO book = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_BOOK);
			psmt.setString(1, bookId);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				book = new BookVO();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setPublisher(rs.getString(3));
				book.setPrice(rs.getInt(4));
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return book;
	}
	
	public List<BookVO> selectBooks() {
		List<BookVO> books = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_BOOKS);
			
			while(rs.next()) {
				BookVO book = new BookVO();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setPublisher(rs.getString(3));
				book.setPrice(rs.getInt(4));
				books.add(book);
			}
			close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return books;
		
	}
	
	public void updateBook(BookVO book) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.UPDATE_BOOK);
			psmt.setString(1, book.getBookName());
			psmt.setString(2, book.getPublisher());
			psmt.setInt(3, book.getPrice());
			psmt.setInt(4, book.getBookId());
			psmt.executeUpdate();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteBook(String bookId) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.DELETE_BOOK);
			psmt.setString(1, bookId);
			psmt.executeUpdate();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
