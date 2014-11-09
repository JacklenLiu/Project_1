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
import javax.sql.DataSource;


/**
 * Servlet implementation class Leaderboard
 */
@WebServlet("/newsServlet")
public class newsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newsServlet() {
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
		
		Connection conn= null;
		OutputStream os = null;
		
		String newsId = req.getParameter("newsId");
		String GET_ALL_NEWS = "select news_identity , news_date , news_title ,news_content from news where news_identity=?;";
		
		int		news_identity	;
		String	news_date 		;
		String 	news_title 		;
		String 	news_content 	;
		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Project_1");
			conn = ds.getConnection();
			PreparedStatement pstmt = null;
			
			pstmt = conn.prepareStatement(GET_ALL_NEWS);			
			pstmt.setString(1, newsId);
						
			ResultSet rs = pstmt.executeQuery();
			PrintWriter out = res.getWriter();
			
			
			if(rs.next()){
				
				news_identity = rs.getInt("news_identity");
				news_date 	  = rs.getString("news_date");
				news_title 	  = rs.getString("news_title");
				news_content  = rs.getString("news_content");
				
				//res.setContentType("text/html");
				//os = res.getOutputStream();

				out.println("第"+news_identity+"筆<br>");
				out.println("news_date= " + news_date +"<br>");
				out.println("news_title= " + news_title +"<br>");
				out.println("news_content= " + news_content +"<br>");
			}
			
			
			
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
