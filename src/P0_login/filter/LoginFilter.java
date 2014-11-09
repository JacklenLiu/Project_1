package P0_login.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import P0_login.model.MemberVO;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/LoginFilter")
public class LoginFilter implements Filter {
	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		System.out.println("hahaha");
		
		HttpSession session = req.getSession();
		MemberVO bean = (MemberVO)session.getAttribute("user");
		
		if(bean!=null){
			//已登入
			chain.doFilter(req, resp);
		}else{
			//未登入
			session.setAttribute("target", req.getRequestURI());
			String path = req.getContextPath();
			resp.sendRedirect(path + "/index.jsp");
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	private FilterConfig config;
	public void init(FilterConfig fConfig) throws ServletException {
		this.config = fConfig;
	}

}
