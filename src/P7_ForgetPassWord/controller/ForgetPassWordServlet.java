package P7_ForgetPassWord.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import P7_ForgetPassWord.model.ForgetPassWordService;
import P7_ForgetPassWord.model.ForgetPassWordVO;

import java.util.*;

@WebServlet("/P7_ForgetPassWord/ForgetPassWordServlet")
public class ForgetPassWordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ForgetPassWordServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out=res.getWriter();
		String action = req.getParameter("action");
		if("forget".equals(action)){
			//錯誤訊息
			List<String> errorMsgs = new LinkedList<String>();	
			//記得要set否則前端抓不到值
			req.setAttribute("errorMsgs", errorMsgs);
			String member_loginID=req.getParameter("userid");
			String member_email=req.getParameter("email");
			try {
				//驗證格式
				
				if(member_loginID==null||member_loginID.trim().length()==0){
					errorMsgs.add("id不可空白");
				}
				
				if(!errorMsgs.isEmpty()){
					RequestDispatcher failureView = req
							.getRequestDispatcher("/P7_ForgetPassWord/ForgetPassWord.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				//驗證格式
				
				if(member_email==null||member_email.trim().length()==0){
					errorMsgs.add("mail不可空白");
				}
				if(!errorMsgs.isEmpty()){
					out.println("notok");
					RequestDispatcher failureView = req
							.getRequestDispatcher("/P7_ForgetPassWord/ForgetPassWord.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				//請工頭叫工人做事(查詢是否有這個會員)
				ForgetPassWordService forgetPassWordSvc=new ForgetPassWordService();
				//用來存取有無此帳號
				ForgetPassWordVO forgetPassWordVO=forgetPassWordSvc.checkMember(member_loginID);
				
				
				
				if(forgetPassWordVO==null){
					errorMsgs.add("請檢查帳號是否正確");
				}
				if(forgetPassWordVO!=null){
					//若有此筆帳號比對email是否有相等
					//取在前端輸入的email
					String inputMail=req.getParameter("email");
					//取從資料庫撈出來的email
					String checkMail=forgetPassWordVO.getMember_email();
					if(inputMail.equals(checkMail)){
						//帳號密碼都符合
						//step1.先去產生亂碼並用String 接住
						String create=forgetPassWordSvc.num();
						//step2.拿到新密碼先去塞資料庫 不用回傳						
						forgetPassWordSvc.update(member_loginID ,create);
						//step3.塞完資料庫寄信始
						forgetPassWordSvc.autoEmail(member_loginID, member_email,create);
					}else{
						errorMsgs.add("請檢查mail是否填寫正確");						
					}
					
					
				
				}
				
				
				if(!errorMsgs.isEmpty()){		
					out.println("notok");
					RequestDispatcher failureView = req
							.getRequestDispatcher("/P7_ForgetPassWord/ForgetPassWord.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				
				/********************* 3.查詢完畢，轉到修改的頁面 **************************/
//				String url = "/P7_ForgetPassWord/ForgetPassWordOK.jsp";
				// 查詢到的資料轉道update畫面之後用EL取內容
//				RequestDispatcher successView = req.getRequestDispatcher(url);
//				successView.forward(req, res);
				out.println("ok");
				
				
			} catch (Exception e) {
				errorMsgs.add("系統錯誤"+e.getMessage());
				RequestDispatcher failureView=req.getRequestDispatcher("/P7_ForgetPassWord/ForgetPassWord.jsp");
				failureView.forward(req, res);

			}
			
			
			
			
			
		}
		

	
	}

}
