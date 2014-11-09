package P0_login.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import P0_login.model.*;

/**
 * Servlet implementation class LoginServlet
 */
//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String userId = request.getParameter("userId");
		String password = request.getParameter("pswd");
		String rm = request.getParameter("rememberMe");
		System.out.println(userId);
		System.out.println(password);
		//String path = getServletContext().getContextPath();
		System.out.println(rm);
		
		
	//  ****************************************** 
			Cookie cookieUser = null;
			Cookie cookiePassword = null;
			Cookie cookieRememberMe = null;
			
			if (rm != null) {
				System.out.println("有勾RM, 加入Cookie");
				cookieUser = new Cookie("user", userId);
				cookieUser.setMaxAge(30*60*60);
				cookiePassword = new Cookie("password", password);
				cookiePassword.setMaxAge(30*60*60);
				cookieRememberMe = new Cookie("rm", "true");
				cookieRememberMe.setMaxAge(30*60*60);
			} else {
				System.out.println("未勾RM, 刪除Cookie");
				cookieUser = new Cookie("user", userId);
				cookieUser.setMaxAge(0);
				cookiePassword = new Cookie("password", password);
				cookiePassword.setMaxAge(0);
				cookieRememberMe = new Cookie("rm", "false");
				cookieRememberMe.setMaxAge(30*60*60);
			}
			response.addCookie(cookieUser);
			response.addCookie(cookiePassword);
			response.addCookie(cookieRememberMe);
			//********************************************
		

		if ("LoginIdCheck".equals(action)) {
			System.out.println("123");
			try {
			
				if (userId == null || userId.trim().length() == 0) {
					request.setAttribute("errorMSG", "帳號不可為空值或空白!");
					RequestDispatcher rd = request
							.getRequestDispatcher("/P0_login/login.jsp");
					rd.forward(request, response);					
					return;
				}
				
				if (password == null || password.trim().length() == 0) {
					request.setAttribute("errorMSG", "密碼不可為空值或空白!");
					RequestDispatcher rd = request
							.getRequestDispatcher("/P0_login/login.jsp");
					rd.forward(request, response);
					return;
				}
				
				MemberDAO ms = new MemberDAO();
			    MemberVO mb = ms.findByPrimaryKey(userId);
				
				if(mb == null && userId != null && password != null){
					request.setAttribute("errorMSG", "無此會員或密碼錯誤1");
					RequestDispatcher rd = request
							.getRequestDispatcher("/P0_login/login.jsp");
					rd.forward(request, response);
				}

				
				
				if (mb != null && mb.getMember_loginID().equals(userId) && mb.getMember_password().equals(password)) {
					//request.setAttribute("userId", mb.getMember_name());
					//request.setAttribute("userloginid", mb.getMember_loginID());
					//將使用者存入session
					HttpSession session = request.getSession();					
					session.setAttribute("userName", mb.getMember_name());
					session.setAttribute("userLoginId",mb.getMember_loginID());
					// 此時不要用下面兩個敘述，因為網址列的URL不會改變
					RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
					rd.forward(request, response);
					
//					response.sendRedirect(path+"/P1_iud/next.jsp");
//					return;
				} 
				else {
					request.setAttribute("errorMSG", "無此會員或密碼錯誤2");
					RequestDispatcher rd = request
							.getRequestDispatcher("/P0_login/login.jsp");
					rd.forward(request, response);
				}
			} catch (Exception e) {
			}
		}
	}

}
