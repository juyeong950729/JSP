package controller.book;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import vo.BookVO;

@WebServlet("/book/modify.do")
public class ModifyController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String bookId = req.getParameter("bookId");
		
		BookVO book = BookDAO.getInstance().selectBook(bookId);
		req.setAttribute("book", book);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/book/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
		
		String bookId 	 = req.getParameter("bookId");
		String bookName  = req.getParameter("bookName");
		String publisher = req.getParameter("publisher");
		String price 	 = req.getParameter("price");
		
		BookVO book = new BookVO();
		book.setBookId(bookId);
		book.setBookName(bookName);
		book.setPublisher(publisher);
		book.setPrice(price);
		
		BookDAO.getInstance().updateBook(book);
		resp.sendRedirect("/BookStore2/book/list.do");
	}
	
	
}
