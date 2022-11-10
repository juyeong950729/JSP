package service.user1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterService implements CommonService1 {
	
	private static RegisterService instance = new RegisterService();
	public static RegisterService getInstance() {
		return instance;
	}
	private RegisterService() {}
	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		return "/user1/register.jsp";
	}

}
