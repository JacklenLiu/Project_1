package P6_ContactUs.model;
import java.util.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class ContactUsDAO implements ContactUs_Interface{
	private static DataSource ds=null;
	static{
		try{
			Context ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/Project_1");
		}catch(NamingException e){
			e.printStackTrace();
		}
	}
	
	
	//準備insert contact指令
	private static final String INSERT_STMT=
			"insert into ContactUs (contactUsName, contactUsMail, contactUsDate, contactUsSubject, contactUsContent)values(?,?,?,?,?)";

	

	@Override
	public void insertContactUs(ContactUsVO contactUsVO) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			//取得連線
			con=ds.getConnection();
			pstmt=con.prepareStatement(INSERT_STMT);
			//姓名
			pstmt.setString(1,contactUsVO.getContactUsName());
			//mail
			pstmt.setString(2,contactUsVO.getContactUsMail());
			//日期
			pstmt.setTimestamp(3,contactUsVO.getContactUsDate());
			//主題
			pstmt.setString(4,contactUsVO.getContactUsSubject());
			//內容
			pstmt.setString(5,contactUsVO.getContactUsContent());
			//執行
			pstmt.executeUpdate();
		}catch(SQLException e){
			throw new RuntimeException("A database error occured."+e.getMessage());
		}finally{
			if(pstmt!=null){
				try{
					pstmt.close();
				}catch(SQLException e){
					e.printStackTrace(System.err);
				}
			}
			if(con!=null){
				try{
					con.close();
				}catch(SQLException e){
					e.printStackTrace(System.err);
				}
			}
		}

	}
		
	

}
