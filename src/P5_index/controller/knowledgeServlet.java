package P5_index.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLNonTransientException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;


/**
 * Servlet implementation class Leaderboard
 */
@WebServlet("/knowledgeServlet")
public class knowledgeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public knowledgeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		res.setHeader("Access-Control-Allow-Origin", "*");
		req.setCharacterEncoding("UTF-8");
		HttpSession sion = req.getSession();
		Connection conn= null;
		OutputStream os = null;
		
		String knowledge = req.getParameter("knowledge");
		String GET_ALL_KNOWLEDGE = "select * from knowledge where knowledge_identity=?;";
		
		int		knowledge_identity	= 0;
		String	knowledge_type 		;
		String 	knowledge_title 	;
		String 	knowledge_content 	;
		Blob    knowledge_img		;
		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Project_1");
			conn = ds.getConnection();
			PreparedStatement pstmt = null;
			
			pstmt = conn.prepareStatement(GET_ALL_KNOWLEDGE);			
			pstmt.setString(1, knowledge);
						
			ResultSet rs = pstmt.executeQuery();
			PrintWriter out = res.getWriter();
			
			
			if(rs.next()){
				
				knowledge_identity 	= rs.getInt("knowledge_identity");
				knowledge_type 	  	= rs.getString("knowledge_type");
				knowledge_title 	= rs.getString("knowledge_title");
				knowledge_content  	= rs.getString("knowledge_content");
				
				//res.setContentType("text/html");
				//os = res.getOutputStream();
//
//				out.println("第"+knowledge_identity+"筆<br>");
//				out.println("news_date= " + knowledge_type +"<br>");
//				out.println("news_title= " + knowledge_title +"<br>");
//				out.println("news_content= " + knowledge_content +"<br>");
			}
			sion.setAttribute("knowledgeIdentity", knowledge);
			res.sendRedirect("P5_index/knowledge_Introduce.jsp");
			return;
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch(SQLNonTransientException e){
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(conn!=null){
				try{
					conn.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
			if(os!=null){
				os.close();
			}
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req,res);
	}

}
