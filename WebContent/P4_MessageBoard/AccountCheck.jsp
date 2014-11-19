<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*;" %>

<% 
     //Thread.sleep(3000);
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		//SQL Server
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=Project_1";
		String query = "select count(*) from sysmember where member_loginID=?";
		String member_loginID = request.getParameter("member_loginID");
		try{
			//SQL Server
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			conn = DriverManager.getConnection(url, "sa", "sa123456");
		
			stmt = conn.prepareStatement(query);
			stmt.setString(1,member_loginID);
			
			rs = stmt.executeQuery();
			
			String strMsg = "帳號不存在";
			
			 rs.next();
			 if(rs.getInt(1) >= 1){
				 strMsg =  "";
			 }
			 out.print(strMsg);
		}
		catch(SQLException e){
			out.println("Error:" + e.getMessage());
		}
		finally{
			if(rs != null){
			   rs.close();
			}
			if(stmt != null){
			 stmt.close();
			}
			if(conn != null){
			}
		}
		 
		//}
%>