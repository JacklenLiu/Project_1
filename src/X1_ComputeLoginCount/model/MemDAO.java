package X1_ComputeLoginCount.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemDAO implements MemDAO_interface {
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Project_1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	private static final String INSERT_MSG = "INSERT INTO LoginCount "
			+ "(member_loginID, totalcount) VALUES (?,?)";
	
	private static final String UPDATE_FRD = "UPDATE LoginCount set totalcount=? "
			+ "where member_loginID = ?";

	private static final String SELECT_FRD = "SELECT totalcount from LoginCount "
			+ "where member_loginID=?";

	
	@Override
	public void insert(MemVO memVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_MSG);

			pstmt.setString(1, memVO.getMember_loginID());
			pstmt.setInt(2, memVO.getTotalcount());

			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A DB error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}


	@Override
	public void update(String member_loginID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_FRD);
			
			pstmt.setString(1, member_loginID); // 查這個人目前的登入次數
			rs = pstmt.executeQuery();
			
			while (rs.next()){
				count = rs.getInt(1);
			}
			
			count++;
			
			pstmt = con.prepareStatement(UPDATE_FRD); //更新登入次數
			pstmt.setInt(1, count);
			pstmt.setString(2, member_loginID); 
			pstmt.executeUpdate();
			
			

			// Handle any dirver errors
		} catch (SQLException se) {
			throw new RuntimeException("A DB error occured.(update)"
					+ se.getMessage());
			// clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}

	} // end of update

}
