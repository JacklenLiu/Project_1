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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class GetImageServlet
 */
@WebServlet("/P5_index/GetNewsImgServlet")
public class GetNewsImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetNewsImgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		request.setCharacterEncoding("UTF-8");
		Connection conn= null;
		OutputStream os = null;
		PreparedStatement pstmt = null;
		final String GET_NEWSIMG_IMG ="select news.news_identity, news.news_date , news.news_title, news.news_image , news.news_Content , images.imgSRC , images.images_format from news  join images on news_image = imagesname where news.news_identity= ? and imagesID like '%01' order by news_identity ;";

		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Project_1");
			conn = ds.getConnection();
			
			String news_Identity = request.getParameter("news_Identity");
			pstmt = conn.prepareStatement(GET_NEWSIMG_IMG);
			pstmt.setString(1, news_Identity);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				//get images_format to set MIMEType
				String images_format = rs.getString("images_format");
				String mimeType = getServletContext().getMimeType(images_format);
				response.setContentType(mimeType);
				os = response.getOutputStream();

				//get imgSrc
				Blob bb = rs.getBlob("imgSRC");
				byte[] b = bb.getBytes(1, (int)bb.length());
				os.write(b, 0, (int)bb.length());
				os.flush();
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
