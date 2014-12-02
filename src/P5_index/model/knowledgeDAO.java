package P5_index.model;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class knowledgeDAO implements knowledgeDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Project_1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String GET_ALL_Knowledge_JSON ="select * from knowledge;";
	
	private static final String GET_ONE ="select * from knowledge where knowledge_identity = ?;";
	
	
	@Override
	public String getAllKnowledgeJSON() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> cols = new ArrayList<String>();
		String knowledges="";
		
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_Knowledge_JSON);	
			
			rs = pstmt.executeQuery();
			
			ResultSetMetaData rsmd = rs.getMetaData();
			int count = rsmd.getColumnCount();
			for(int i = 1; i <= count; i++) {
				cols.add(rsmd.getColumnLabel(i));
			}
			
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObj;
			
			while(rs.next()){
				jsonObj = new JSONObject();
				jsonObj.put(cols.get(0), rs.getString(1));//knowledge_idenity
				jsonObj.put(cols.get(1), rs.getString(2));//knowledge_type
				jsonObj.put(cols.get(2), rs.getString(3));//knowledge_title
				jsonObj.put(cols.get(3), rs.getString(4));//knowledge_content
				jsonObj.put(cols.get(4), rs.getString(5));//knowledge_img
				jsonArray.put(jsonObj);
			}
			
			knowledges = jsonArray.toString();
			
		}catch(SQLException e){
			e.printStackTrace();
		}catch (JSONException e) {
			e.printStackTrace();
		}
		finally {
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
		
		return knowledges;
	}

	@Override
	public knowledgeVO getOne(String knowledgeIdentity) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		knowledgeVO klVO =null;
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE);	
			pstmt.setString(1, knowledgeIdentity);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				klVO = new knowledgeVO();
				klVO.setKnowledge_identity(rs.getString("knowledge_identity"));//knowledge_identity
				klVO.setKnowledge_type(rs.getString("knowledge_type"));//knowledge_type
				klVO.setKnowledge_title(rs.getString("knowledge_title"));//knowledge_title
				klVO.setKnowledge_content(rs.getString("knowledge_content"));//knowledge_content
				klVO.setKnowledge_imgName(rs.getString("knowledge_imgName"));//knowledge_imgName
				klVO.setKnowledge_img(rs.getBlob("knowledge_img"));//knowledge_img
				klVO.setKnowledge_imgformat(rs.getString("knowledge_imgformat"));//knowledge_imgformat
				klVO.setKnowledge_build(rs.getDate("knowledge_build"));//knowledge_build
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
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
		
		return klVO;
	}
}
