package P6_ContactUs.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import P6_ContactUs.model.*;


@WebServlet("/P6_ContactUs/ContactUsServlet")
public class ContactUsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ContactUsServlet() {
        super();
        
    }

	
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//post中文處理
		req.setCharacterEncoding("UTF-8");
		//取name=actoin 的value判別是按到哪一個功能
		String action=req.getParameter("action");
		
		if("contactus".equals(action)){
			//建立一個用來存放errorMsg的List
			List<String> errorMsgs=new LinkedList<String>();
			//在jsp用來讀取${errorMsgs}方法
			req.setAttribute("errorMsgs", errorMsgs);
			try{
				//Contact欄位抓取並判別輸入是否OK(姓名 信箱 時間 標題 內容 要塞資料庫)
				String contactUsName = req.getParameter("name");
				System.out.println(contactUsName);
				if(contactUsName==null||(contactUsName.trim()).length()==0){
					errorMsgs.add("請輸入姓名");	
				}
				
				String contactUsMail = req.getParameter("recipients");
				System.out.println(contactUsMail);
				if(contactUsMail==null||(contactUsMail.trim()).length()==0){
					errorMsgs.add("請輸入信箱");	
				}
						
				String fromuser = req.getParameter("frommail");
				System.out.println(fromuser);
				if(fromuser==null||(fromuser.trim()).length()==0){
					errorMsgs.add("客服信箱有error");	
				}
				
				java.sql.Timestamp contactUsDate = java.sql.Timestamp.valueOf(req.getParameter("date"));
				System.out.println(contactUsDate);
				if(contactUsDate==null){
					errorMsgs.add("時間無法抓取");	
				}
				
				String contactUsSubject = req.getParameter("subject");
				System.out.println(contactUsSubject);
				if(contactUsSubject==null||(contactUsSubject.trim()).length()==0){
					errorMsgs.add("請輸入主題");	
				}
				String contactUsContent = req.getParameter("contents");
				System.out.println(contactUsContent);
				if(contactUsContent==null||(contactUsContent.trim()).length()==0){
					errorMsgs.add("請輸入內容");	
				}
				
				//new VO用來放資料
				ContactUsVO contactUsVO =new ContactUsVO();
				//共5筆資料 (姓名 信箱 時間 標題 內容 )
				contactUsVO.setContactUsName(contactUsName);
				contactUsVO.setContactUsMail(contactUsMail);
				contactUsVO.setContactUsDate(contactUsDate);
				contactUsVO.setContactUsSubject(contactUsSubject);
				contactUsVO.setContactUsContent(contactUsContent);
				
				
				//若有錯誤訊息要在原頁面顯示錯誤原因
				if (!errorMsgs.isEmpty()) {
					System.out.println("有error");
					req.setAttribute("ContactUsVO", contactUsVO);
					// 之後在jsp用${failureView}讀取錯誤訊息
					RequestDispatcher failureView = req
							.getRequestDispatcher("/P6_ContactUs/ContactUs.jsp");
					failureView.forward(req, res);
					return;// 結束程式
				}
				
				//step1.
				//若沒有錯誤開始做寄信的工作
				//先寄信再去insert工作
				//開始呼叫service 做自動送信功能
				ContactUsService contactUsSvc=new ContactUsService();
				//傳參數到service 做autoEmail
				contactUsSvc.autoEmail(contactUsName, contactUsMail, contactUsDate, contactUsSubject, contactUsContent,fromuser);
				System.out.println("已送出");
				/************************************新增資料開始******************************************/
				//step2.
				//當自動送信成功後開始做insert ContactUs內容到資料庫
				contactUsSvc.insertContactUs(contactUsName, contactUsMail, contactUsDate, contactUsSubject, contactUsContent);
				System.out.println("資料庫新增OK");
				/************************************新增資料完成******************************************/
				String url = "/P6_ContactUs/OK.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
		
			}catch(Exception e){
				System.out.println("信件無法送出請稍後再試");
				errorMsgs.add(e.getMessage());
				// 之後在jsp用${failureView}讀取錯誤訊息
				RequestDispatcher failureView = req
						.getRequestDispatcher("/P6_ContactUs/ContactUs.jsp");
				failureView.forward(req, res);
			}
			
			
		}
		
	}
}
