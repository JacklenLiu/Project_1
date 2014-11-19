package P4_MessageBoard.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	// 列出查詢到的ID name 性別  (member_loginID  member_name  member_gender)
	private static final String GET_ALL_MEM = "SELECT member_loginID, member_name, member_gender From "
			+ "sysmember where member_loginID like ? OR member_name like ?";
	
	
	
	@Override
	public List<MemVO> getAll(String query_string) {
		
		List<MemVO> list = new ArrayList<MemVO>();
		MemVO memVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_MEM);
			pstmt.setString(1,"%"+query_string+"%");
			pstmt.setString(2,"%"+query_string+"%");
			rs = pstmt.executeQuery();

			while (rs.next()) {				
				memVO = new MemVO();

				memVO.setMember_loginID(rs.getString("member_loginID"));
				memVO.setMember_name(rs.getString("member_name"));
				memVO.setMember_gender(rs.getString("member_gender"));
			
				list.add(memVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A DB (getALL) error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}

			}
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
		return list;
	}

}
