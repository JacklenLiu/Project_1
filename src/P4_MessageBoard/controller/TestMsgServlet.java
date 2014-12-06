package P4_MessageBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import P4_MessageBoard.model.MemService;
import P4_MessageBoard.model.MsgService;

/**
 * Servlet implementation class TestMsgServlet
 */
@WebServlet("/TestMsgServlet")
public class TestMsgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestMsgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		res.setContentType("text/html; charset=UTF-8"); //?
		res.setHeader("Access-Control-Allow-Origin", "*"); //?
		PrintWriter out = res.getWriter();
		req.setCharacterEncoding("UTF-8");
		
		String action = req.getParameter("action");
		
		//回傳json給client端  (測試新的查詢 join 留言ID與姓名)
				if("get_msg".equals(action)){
					MsgService msgSvc = new MsgService();
					String msginfo = msgSvc.getAllJSON2();
					out.println(msginfo);
				}
	}

}
