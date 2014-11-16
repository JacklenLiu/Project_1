package P7_ForgetPassWord.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ForgetPassWordDAO implements ForgetPassWord_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Project_1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	//按下送出後 檢查是否有帳筆帳號並取出他的mail驗證
	private static final String SELECT_STMT = "select member_email from sysmember where  member_loginID=?";

	//檢查通過後update密碼
	private static final String UPDATE_STMT = "update sysmember set member_password=? where member_loginID=?";



	@Override
	public void update(String member_loginID,String create) {

		Connection con=null;
		PreparedStatement pstmt=null;
		
		try{
			con =ds.getConnection();
			pstmt=con.prepareStatement(UPDATE_STMT);
			pstmt.setString(1,create);
			pstmt.setString(2,member_loginID );
			pstmt.executeUpdate();
			
	
		}catch(SQLException e){
			throw new RuntimeException("A database error occured."+e.getMessage());
		}finally{

			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
				
		
	}
		
		
	

	@Override
	public ForgetPassWordVO findByPrimaryKey(String member_loginID,
			String member_email) {
		
		
		
		ForgetPassWordVO forgetPassWordVO =null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			con =ds.getConnection();
			pstmt=con.prepareStatement(SELECT_STMT);
			pstmt.setString(1,member_loginID );
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				forgetPassWordVO= new ForgetPassWordVO();	
				//取會員mail
				forgetPassWordVO.setMember_email(rs.getString("member_email"));
				
			}
		}catch(SQLException e){
			throw new RuntimeException("A database error occured."+e.getMessage());
		}finally{
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
				
		return forgetPassWordVO;
		
	}

}
