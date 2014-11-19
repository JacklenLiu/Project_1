package P4_MessageBoard.controller;
//package P4_MessageBoard.controller;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//
//import javax.naming.Context;
//import javax.naming.InitialContext;
//import javax.naming.NamingException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.sql.DataSource;
//
///**
// * Servlet implementation class InviteFriend
// */
//@WebServlet("/P4_MessageBoard/InviteFriend")
//public class InviteFriend2_bad extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
//	 *      response)
//	 */
//	protected void doGet(HttpServletRequest req, HttpServletResponse res)
//			throws ServletException, IOException {
//		doPost(req, res);
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
//	 *      response)
//	 */
//	protected void doPost(HttpServletRequest req, HttpServletResponse res)
//			throws ServletException, IOException {
//
//		DataSource ds = null;
//
//		try {
//			Context ctx = new InitialContext();
//			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Project_1");
//		} catch (NamingException e) {
//			e.printStackTrace();
//		}
//
//		String INSERT_STMT = "INSERT INTO member_friend (member_loginID,friend_loginID,invate_msg,relationship_status) VALUES (?, ?, ?, ?)";
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//
//		try {
//
//			con = ds.getConnection();
//			pstmt = con.prepareStatement(INSERT_STMT);
//
//			String member_loginID = req.getParameter("vmember_loginID");// 抓輸入的帳號
//			String friend_loginID = req.getParameter("vtitle");// 抓輸入的帳號
//			String invate_msg = req.getParameter("vcontent");// 抓輸入的帳號
//
//			System.out.println("member_loginID is " + member_loginID);
//			System.out.println("friend_loginID is " + friend_loginID);
//			System.out.println("invate_msg is " + invate_msg);
//
//			pstmt.setString(1, member_loginID);
//			pstmt.setString(2, friend_loginID);
//			pstmt.setString(3, invate_msg);
//			pstmt.setInt(4, 0);
//
//			pstmt.executeUpdate();
//
//			// Handle any driver errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		String path = getServletContext().getContextPath();
//
//		res.sendRedirect(path + "/P4_MessageBoard/seekfriend.jsp");
//	}
//
//}
