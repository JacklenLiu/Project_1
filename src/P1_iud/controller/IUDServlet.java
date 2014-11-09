package P1_iud.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;
import P1_iud.model.*;

/**
 * Servlet implementation class iduServlet
 */
//@WebServlet("/IUDServlet")
public class IUDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IUDServlet() {
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
		

		// ======新增======
		if ("actionInsert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			try {
				
				

				String member_loginID = request.getParameter("member_loginID").trim();
				String member_password = request.getParameter("member_password").trim();
				String member_name = request.getParameter("member_name").trim();
				String member_gender = request.getParameter("member_gender").trim();

				java.sql.Date member_birthday = null;
				try {
					member_birthday = java.sql.Date.valueOf(request
							.getParameter("member_birthday").trim());
				} catch (IllegalArgumentException e) {
					member_birthday = new java.sql.Date(
							System.currentTimeMillis());
					request.setAttribute("errorMsgs", "日期格式錯誤");

				}

				String member_address = request.getParameter("member_address").trim();

				if (member_loginID == null || member_loginID.length() == 0) {
					request.setAttribute("errorMsgs", "請輸入帳號");
					RequestDispatcher rd = request
							.getRequestDispatcher("/P1_iud/insert.jsp");
					rd.forward(request, response);
					return;
				}
				if (member_password == null || member_password.length() == 0) {
					request.setAttribute("errorMsgs", "請輸入密碼");
					RequestDispatcher rd = request
							.getRequestDispatcher("/P1_iud/insert.jsp");
					rd.forward(request, response);
					return;
				}
				if (member_name == null || member_name.length() == 0) {
					request.setAttribute("errorMsgs", "姓名請勿空白");
					RequestDispatcher rd = request
							.getRequestDispatcher("/P1_iud/insert.jsp");
					rd.forward(request, response);
					return;
				}
				if (member_gender == null || member_gender.length() == 0) {
					request.setAttribute("errorMsgs", "請選擇性別");
					RequestDispatcher rd = request
							.getRequestDispatcher("/P1_iud/insert.jsp");
					rd.forward(request, response);
					return;
				}
				if (!errorMsgs.isEmpty()) {
					errorMsgs.add("請選擇日期");
					RequestDispatcher rd = request
							.getRequestDispatcher("/P1_iud/insert.jsp");
					rd.forward(request, response);
					return;
				}
				if (member_address == null || member_address.length() == 0) {
					request.setAttribute("errorMsgs", "請輸入地址");
					RequestDispatcher rd = request
							.getRequestDispatcher("/P1_iud/insert.jsp");
					rd.forward(request, response);
					return;
				}

				int member_class = Integer.valueOf(request.getParameter("member_class"));
				String member_stop = request.getParameter("member_stop").trim();
				java.sql.Date member_buildtime = java.sql.Date.valueOf(request
						.getParameter("member_buildtime"));
				String member_type = request.getParameter("member_type").trim();
				String member_email = request.getParameter("member_email").trim();

				MemberDAO memDAO = new MemberDAO();
				MemberVO memVO = memDAO.findByPrimaryKey(member_loginID);
				
				if (memVO == null) {
					System.out.println("captcha");
					String remoteAddr = request.getRemoteAddr();
					ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
					reCaptcha.setPrivateKey("6LdlHOsSAAAAACe2WYaGCjU2sc95EZqCI9wLcLXY");

					String challenge = request
							.getParameter("recaptcha_challenge_field");
					String uresponse = request.getParameter("recaptcha_response_field");
					ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(
							remoteAddr, challenge, uresponse);

					if (reCaptchaResponse.isValid()) {
						
						
						//驗證碼正確，進行新增
						
						System.out.println("insert");
						MemberService memSvc = new MemberService();
						memSvc.insert(member_loginID, member_password,
								      member_email,member_class, member_name, member_stop,
								      member_gender, member_birthday, member_address,
								      member_buildtime, member_type);
						System.out.println("insert_OK");
						
						RequestDispatcher successView = request
								.getRequestDispatcher("/P1_iud/next.jsp");
						successView.forward(request, response);

						
					} else {
						request.setAttribute("capMsgs", "驗證碼錯誤");
						RequestDispatcher rd = request
								.getRequestDispatcher("/P1_iud/insert.jsp");
						rd.forward(request, response);
						return;
					}
					
					
				} else {
					request.setAttribute("errorMsgs", "此帳號已被使用");
					RequestDispatcher rd = request
							.getRequestDispatcher("/P1_iud/insert.jsp");
					rd.forward(request, response);
					return;
				}

			} catch (Exception e) {
				e.getMessage();
			}
		}
		// =====轉到修改頁面=====
		if ("actionUpdate".equals(action)) {

			try {

				String member_loginID = request.getParameter("member_loginID").trim();
				System.out.println(member_loginID);

				MemberVO memVO = new MemberVO();
				MemberDAO memDAO = new MemberDAO();
				memVO.setMember_loginID(member_loginID);
				memVO = memDAO.findByPrimaryKey(memVO.getMember_loginID());

				request.setAttribute("memberVO", memVO);
				RequestDispatcher rd = request
						.getRequestDispatcher("/P1_iud/update.jsp");
				rd.forward(request, response);

			} catch (Exception e) {
				e.getMessage();
			}
		}

		// =====修改=====
		if ("Update".equals(action)) {

			try {

				String member_loginID = request.getParameter("member_loginID").trim();
				String member_password = request.getParameter("member_password").trim();
				String member_name = request.getParameter("member_name").trim();
				String member_gender = request.getParameter("member_gender").trim();

				java.sql.Date member_birthday = null;
				try {
					member_birthday = java.sql.Date.valueOf(request.getParameter("member_birthday").trim());
				} catch (IllegalArgumentException e) {
					member_birthday = new java.sql.Date(System.currentTimeMillis());
					request.setAttribute("errorMsgs", "請輸入日期");

				}

				String member_address = request.getParameter("member_address").trim();

				MemberVO memVO = new MemberVO();
				MemberDAO memDAO = new MemberDAO();
				memVO.setMember_loginID(member_loginID);
				memVO = memDAO.findByPrimaryKey(memVO.getMember_loginID());

				MemberService memSvc = new MemberService();
				memVO = memSvc.update(member_loginID, member_password,
						member_name, member_gender, member_birthday,
						member_address);

				request.setAttribute("memberVO", memVO);				
				RequestDispatcher successView = request
						.getRequestDispatcher( "/P1_iud/listOneMem.jsp");
				successView.forward(request, response);

			} catch (Exception e) {
				e.getMessage();
			}
		}
		// =====刪除=====
		
		if ("actionDelete".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);

			try {System.out.println("deleteServlet0");
				/***************************1.接收請求參數***************************************/
				
				String member_loginID = new String(request.getParameter("member_loginID"));
				System.out.println("deleteServlet1");
				/***************************2.開始刪除資料***************************************/
				
				MemberService memSvc = new MemberService();
				System.out.println("deleteServlet2");
				memSvc.deleteMem(member_loginID);
				System.out.println("deleteServlet3");
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/
				
				
				RequestDispatcher successView = request
						.getRequestDispatcher("/P1_iud/next.jsp");
				
				successView.forward(request, response);
				System.out.println("deleteServlet4");
			} catch (Exception e) {
				e.getMessage();
			}
		}
	}
	
	
}
