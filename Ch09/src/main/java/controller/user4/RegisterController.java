package controller.user4;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User4DAO;
import vo.User4VO;

@WebServlet("/user4/register.do")
public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user4/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name   = req.getParameter("name");
		String age 	  = req.getParameter("age");
		String gender = req.getParameter("gender");
		String addr   = req.getParameter("addr");
		
		User4VO vo = new User4VO();
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setAddr(addr);
		
		User4DAO.getInstance().insertUser4(vo);
		
		resp.sendRedirect("/Ch09/user4/list.do");
	}
	
}
