package P4_MessageBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import P4_MessageBoard.model.FrdDAO;
import P4_MessageBoard.model.FrdService;
import P4_MessageBoard.model.FrdVO;

/**
 * Servlet implementation class FrdServlet
 */
@WebServlet("/P4_MessageBoard/FrdServlet")
public class FrdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		
		String action = req.getParameter("action");
		
		if("invite_friend".equals(action)){

			// 新增一筆友誼紀錄
//			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
			
//			FrdVO frdVO = new FrdVO();
			
			String member_loginID = req.getParameter("vmember_loginID");
			String friend_loginID = req.getParameter("vfriend_loginID");
			String invite_msg = req.getParameter("vinvite_msg");
			
			System.out.println("member_loginID = "+member_loginID);
			System.out.println("friend_loginID = "+friend_loginID);
			System.out.println("invite_msg = "+invite_msg);
			
			FrdService frdSvc = new FrdService();
			frdSvc.addFrd(member_loginID, friend_loginID, invite_msg, 0, "null");  // insert到資料庫
			
//			回到搜尋好友頁~~ 可再加好友
//			RequestDispatcher succuessView = req.getRequestDispatcher("/P4_MessageBoard/SeekFriend.jsp");
//			succuessView.forward(req, res);
			String path = getServletContext().getContextPath();
			res.sendRedirect(path+"/P4_MessageBoard/SeekFriend2.jsp");	//使重新整理無作用!!!!
			return;
		}
		
//		if("accept_invite".equals(action)){
//			// 按下確認 更新此筆友誼狀態
//			
//			Integer relationship_status = new Integer(req.getParameter("vrelationship_status"));
//			
//			FrdService frdSvc = new FrdService();
//			frdSvc.updateFrd(relationship_status);  // update到資料庫
//			
//			RequestDispatcher succuessView = req.getRequestDispatcher("/P4_MessageBoard/ShowInvite.jsp");
//			succuessView.forward(req, res);
//			
//		}
		
		

		
		
		if("show_invite".equals(action)){
			// 顯示有哪些人發送邀請給你
			
			System.out.println("come into ~~~ show_invite   ");
//			
////			String member_loginID = req.getParameter("vmember_loginID");
////			FrdDAO dao = new FrdDAO();
////			List<FrdVO> list = dao.getPart(member_loginID);
////			req.setAttribute("list",list);
////			RequestDispatcher succuessView = req.getRequestDispatcher("/P4_MessageBoard/show_accept.jsp");
////			succuessView.forward(req, res);
//			res.setContentType("text/html;charset=UTF-8");
			String path = getServletContext().getContextPath();
			System.out.println(path);
			res.sendRedirect(path+"/P4_MessageBoard/show_accept.jsp");	//使重新整理無作用!!!!
			return;
				
		}
		
		
		if("show_invite2".equals(action)){
			// 顯示有哪些人發送邀請給你
			
			System.out.println("come into ~~~ show_invite   ");

			String path = getServletContext().getContextPath();
			System.out.println(path);
			HttpSession session = req.getSession();
			session.setAttribute("sendFrined","yes");
			res.sendRedirect(path+"/P4_MessageBoard/SeekFriend2.jsp");	//使重新整理無作用!!!!
			return;
				
		}
		
		
		
		
		if("accept_invite".equals(action)){
			// 按下確認 更新此筆友誼狀態
			
			int friendNum = new Integer(req.getParameter("vfriendNum"));

			
			FrdService frdSvc = new FrdService();
			frdSvc.updateFrd(friendNum);  // update到資料庫
//			RequestDispatcher succuessView = req.getRequestDispatcher("/P4_MessageBoard/show_accept.jsp");
//			succuessView.forward(req, res);
			String path = getServletContext().getContextPath();
			res.sendRedirect(path+"/P4_MessageBoard/show_accept.jsp");	//使重新整理無作用!!!!
			return;
		}
		
		
		if("accept_invite2".equals(action)){
			// 按下確認 更新此筆友誼狀態
			
			int friendNum = new Integer(req.getParameter("vfriendNum"));
			
			
			
			System.out.println(req.getParameter("whataction"));
//			如果是接受  資料庫狀態更新為1
//			如果是拒絕  資料庫狀態更新為9
			
			
			
			String friend_loginID = req.getParameter("vfriend_loginID");
			String member_loginID = req.getParameter("vmember_loginID");
			
			
			
	
			FrdService frdSvc = new FrdService();
			frdSvc.updateFrd(friendNum);  // update到資料庫
			frdSvc.addFrd(member_loginID, friend_loginID, "test沒作用啦", 1, "null");  // insert到資料庫
			
			
			
//			測試新增一筆(當對方按下確認)
//			String member_loginID = req.getParameter("vmember_loginID");
//			String friend_loginID = req.getParameter("vfriend_loginID");
//			FrdService frdSvc2 = new FrdService();
//			frdSvc2.addFrd(friend_loginID, member_loginID, "test沒作用啦", 1);  // insert到資料庫
			
			
			
			
			
			String path = getServletContext().getContextPath();
//			res.sendRedirect(path+"/P4_MessageBoard/show_accept2.jsp");	//使重新整理無作用!!!!
			res.sendRedirect(path+"/P4_MessageBoard/SeekFriend2.jsp");	//使重新整理無作用!!!!
			
			return;
		}
		
		
		// 如果按下拒絕
		if("reject_invite2".equals(action)){
			// 按下確認 更新此筆友誼狀態
			
			int friendNum = new Integer(req.getParameter("vfriendNum"));
	
			FrdService frdSvc = new FrdService();
			frdSvc.updateFrd(friendNum);  // update到資料庫  9==>代表拒絕QQ
			String path = getServletContext().getContextPath();
//			res.sendRedirect(path+"/P4_MessageBoard/show_accept2.jsp");	//使重新整理無作用!!!!
			res.sendRedirect(path+"/P4_MessageBoard/SeekFriend2.jsp");	//使重新整理無作用!!!!
			
			return;
		}
		
		//取得會員好友
		if("GetFriends".equals(action)){
			String memID = req.getParameter("memID").toString();
			FrdService frdSvc = new FrdService();
			String friendsList = frdSvc.getFrds(memID);
			
			JSONArray friendsJSONArrayAfter = new JSONArray();
			try {
				JSONArray friendsJSONArray = new JSONArray(friendsList);		
				for(int i=0; i< friendsJSONArray.length(); i++){
					JSONObject friendsObj = new JSONObject();
					String FrdName = frdSvc.getFrdsName(friendsJSONArray.getString(i));
					friendsObj.put("friendID", friendsJSONArray.getString(i));
					friendsObj.put("friendName", FrdName);
					friendsJSONArrayAfter.put(friendsObj);
				}								
			} catch (JSONException e) {
				e.printStackTrace();
			}
			out.print(friendsJSONArrayAfter.toString());
		}
		
		//更新協作平台通知
		if ("UpdateCoNotify".equals(action)) {
			//memID->開平台者, frdID->被邀請加入平台者
			String status="";
			String memID = req.getParameter("memID");
			String frdIDs = req.getParameter("frdID");
			String msg = req.getParameter("msg");
			System.out.println("34343");
			System.out.println(frdIDs);
			try {
				JSONArray friendsJSONArray = new JSONArray(frdIDs);
				System.out.println("get array");
				System.out.println(friendsJSONArray.get(0));
				FrdService frdSvc = new FrdService();			
				for(int i=0; i< friendsJSONArray.length(); i++){
					System.out.println("friendid");
					System.out.println(friendsJSONArray.getString(i));
					status = frdSvc.updateCoNotify(memID, friendsJSONArray.getString(i), msg);
				}
				
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.print(status);
		}
		
		//我不參加協作平台
		if ("FrdclearCoNotify".equals(action)) {
			//memID->開平台者, frdID->被邀請加入平台者
			String status="";
			String memID = req.getParameter("memID");
			FrdService frdSvc = new FrdService();			
			status = frdSvc.FrdclearCoNotify(memID);		
			out.print(status);
		}

	}

}
