package P1_iud.model;

import java.util.*;
import java.sql.*;

import javax.naming.*;
import javax.sql.*;

import P1_iud.model.MemberVO;

public class MemberDAO implements MemberDAO_interface{
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Project_1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT =
		      "INSERT INTO sysmember (member_loginID ,	member_password ,member_email ,member_class ,	member_name ,member_stop ,member_gender, member_birthday, member_address ,member_buildtime,	member_type ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";				
	private static final String GET_ALL_STMT =
		      "SELECT * FROM sysmember order by member_loginID";
	private static final String GET_ONE_STMT =
		      "SELECT * FROM sysmember where member_loginID = ?";
	private static final String DELETE =
		      "DELETE FROM sysmember where member_loginID = ?";
	private static final String UPDATE =
		      "UPDATE sysmember set member_password=? ,member_name=? ,member_gender=?, member_birthday=?, member_address=?  where member_loginID = ?";

	@Override
	public void insert(MemberVO memVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			 
			System.out.println("新增會員");
			pstmt.setString(1, memVO.getMember_loginID());
			pstmt.setString(2, memVO.getMember_password());
			pstmt.setString(3, memVO.getMember_email());			
			pstmt.setInt(4, memVO.getMember_class());
			pstmt.setString(5, memVO.getMember_name());
			pstmt.setString(6, memVO.getMember_stop());
			pstmt.setString(7, memVO.getMember_gender());
			pstmt.setDate(8, memVO.getMember_birthday());
			pstmt.setString(9, memVO.getMember_address());
			pstmt.setDate(10, memVO.getMember_buildtime());
			pstmt.setString(11, memVO.getMember_type());
			System.out.println("98kkd7654");
			pstmt.executeUpdate();
			System.out.println("98uikd7654");
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void update(MemberVO memVO) {
		System.out.println("update");
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
            
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
            System.out.println("update");
			pstmt.setString(1,memVO.getMember_password());
			pstmt.setString(2, memVO.getMember_name());
			pstmt.setString(3, memVO.getMember_gender());
			pstmt.setDate(4, memVO.getMember_birthday());
			pstmt.setString(5, memVO.getMember_address());
			pstmt.setString(6, memVO.getMember_loginID());
			
			
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	
	@Override
	public void delete(String member_loginID) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			System.out.println("delete1");
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setString(1,member_loginID);
			System.out.println("delete1.8");
			pstmt.executeUpdate();
			
			System.out.println("delete2");
			
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			
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
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override	
	public MemberVO findByPrimaryKey(String member_loginID) {

		MemberVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1,member_loginID);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				memVO = new MemberVO();
				memVO.setMember_loginID(rs.getString("member_loginID"));	
				memVO.setMember_password(rs.getString("member_password"));
				memVO.setMember_email(rs.getString("member_email"));
				//memVO.setMember_class(rs.getInt("member_class"));
				memVO.setMember_name(rs.getString("member_name"));
				//memVO.setMember_stop(rs.getString("member_stop"));
				memVO.setMember_gender(rs.getString("member_gender"));
				memVO.setMember_birthday(rs.getDate("member_birthday"));
				memVO.setMember_address(rs.getString("member_address"));
				//memVO.setMember_buildtime(rs.getDate("member_buildtime"));
				
				
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return memVO;
	}

	@Override
	public List<MemberVO> getAll() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		MemberVO memVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO �]�٬� Domain objects
				memVO = new MemberVO();
				memVO.setMember_loginID(rs.getString("member_loginID"));
				memVO.setMember_password(rs.getString("member_password"));
				memVO.setMember_email(rs.getString("member_email"));
				memVO.setMember_class(rs.getInt("member_class"));
				memVO.setMember_name(rs.getString("member_name"));
				memVO.setMember_stop(rs.getString("member_stop"));
				memVO.setMember_gender(rs.getString("member_gender"));
				memVO.setMember_birthday(rs.getDate("member_birthday"));
				memVO.setMember_address(rs.getString("member_address"));
				memVO.setMember_buildtime(rs.getDate("member_buildtime"));
				memVO.setMember_type(rs.getString("member_type"));
				list.add(memVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	
	

}
