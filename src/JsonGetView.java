

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.json.simple.JSONObject;
//import org.json.simple.JSONArray;




import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 * 
 * Servlet implementation class JsonSimpleDemo
 */
@WebServlet("/JsonGetView")
public class JsonGetView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JsonGetView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.setContentType("application/json");
		// Get the printwriter object from response to write the required json object to the output stream      
		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		PrintWriter out = response.getWriter();
		// Assuming your json object is **jsonObject**, perform the following, it will return your json object  
		request.setCharacterEncoding("UTF-8");
		
		String area = request.getParameter("area");
			
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=Project_1";
		String query = "select * from viewname where viewArea = ?";
		//String keyword = request.getParameter("keyword");
		//keyword = keyword + "%";
		List<String> cols = new ArrayList<String>();
		try{
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			conn = DriverManager.getConnection(url, "sa", "sa123456");
			
			stmt = conn.prepareStatement(query);
			stmt.setString(1, area);
			
			rs = stmt.executeQuery();
			
			ResultSetMetaData rsmd = rs.getMetaData();
			int count = rsmd.getColumnCount();
			for(int i = 1; i <= count; i++) {
				cols.add(rsmd.getColumnLabel(i));
			}
			
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObj;
			while (rs.next()) {
				jsonObj = new JSONObject();
				jsonObj.put(cols.get(0), rs.getString(1));//viewID
				jsonObj.put(cols.get(1), rs.getString(2));//viewname
				jsonObj.put(cols.get(2), rs.getString(3));//viewAddr
				jsonObj.put(cols.get(3), rs.getString(4));//viewlat
				jsonObj.put(cols.get(4), rs.getString(5));//viewlat
				jsonObj.put(cols.get(5), rs.getString(6));//viewTop
				jsonObj.put(cols.get(6), rs.getString(7));//viewTop
				jsonArray.put(jsonObj);
			}
			
			out.println(jsonArray.toString());
			
			
//			 JSONArray list = new JSONArray();
//			 while (rs.next())
//			 {
//				 list.add(rs.getString(1));
//				 list.add(rs.getString(2));
//			 }
//			 out.print(list);
			
		}
		catch(SQLException e){
			out.println("Error:" + e.getMessage());
		}
		catch (JSONException e) {
			e.printStackTrace();
		}
		finally{
			//if(rs != null){
			//   rs.close();
			//}
			//if(stmt != null){
			// stmt.close();
			//}
			//if(conn != null){
			//}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
