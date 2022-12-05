package kr.co.jboard2.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import kr.co.jboard2.service.UserService;
import kr.co.jboard2.vo.UserVO;

@WebServlet("/user/updateUser.do")
public class UpdateUserController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private UserService service = UserService.INSTANCE;
	
	@Override
	public void init() throws ServletException {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		String uid = req.getParameter("uid");
		String name = req.getParameter("name");
		String nick = req.getParameter("nick");
		String email = req.getParameter("email");
		String hp = req.getParameter("hp");
		String zip = req.getParameter("zip");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		
		UserVO vo = new UserVO();
		vo.setUid(uid);
		vo.setName(name);
		vo.setNick(nick);
		vo.setEmail(email);
		vo.setHp(hp);
		vo.setZip(zip);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		
		int result = service.updateUser(vo);
		
		JsonObject json = new JsonObject();
		
		if(result == 1) {
			json.addProperty("result", 1);
		} else {
			json.addProperty("result", 0);
		}
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
		
	}
	
}
