package kr.co.farmstory2.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.service.UserService;
import kr.co.farmstory2.vo.UserVO;

public class AutoLoginFilter implements Filter {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserService service = UserService.INSTANCE;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		logger.info("AutoLoginFilter...");
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession sess = req.getSession();
		
		UserVO sessUser = (UserVO)sess.getAttribute("sessUser");
		
		if (sessUser != null) {
			chain.doFilter(request, response);
		} else {
			Cookie[] cookies = req.getCookies();
			
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if(cookie.getName().equals("SESSID")) {
						String sessId = cookie.getValue();
						UserVO vo = service.selectUserBySessId(sessId);
						
						if(vo != null) {
							sess.setAttribute("sessUser", vo);
							
							cookie.setMaxAge(60*60*24*3);
							((HttpServletResponse) response).addCookie(cookie);
							
							service.updateUserForSessLimitDate(sessId);
						}
					}
				}
			}
			
			chain.doFilter(request, response);
		}
		
	}

}
