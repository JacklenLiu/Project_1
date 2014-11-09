package P2_route.model;

import java.sql.Connection;
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

public class viewnameDAO implements viewnameDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			//ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Travel01DB");
			//ds = (DataSource) ctx.lookup("java:comp/env/jdbc/test");
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Project_1");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String GET_ALL_STMT ="SELECT viewID,viewname,viewAddr,viewlat,viewlng,view_HitRate, viewArea FROM viewname order by viewID";
	//test
	private static final String GET_ALL_STMT_AREA ="SELECT viewID,viewname,viewAddr,viewlat,viewlng,view_HitRate, viewArea FROM viewname where viewArea=? order by viewlng";
	//Travel01
	//private static final String GET_ALL_STMT_AREA ="SELECT viewID,viewname,viewAddr,viewlat,viewlng,viewTop, viewArea FROM viewname where viewArea=?";
	private static final String GET_STMT_ImgTop6 ="select top(6) viewID, view_hitrate ,viewname, imagesID  , imgsrc ,images_format from  viewname join  images on viewname.viewid = images.imagesname where images.imagesID like'%_01' order by viewname.view_HitRate desc ;";
	@Override
	public void insert(viewnameVO vnVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(viewnameVO vnVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Integer empno) {
		// TODO Auto-generated method stub

	}

	@Override
	public viewnameVO findByPrimaryKey(Integer viewID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<viewnameVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<viewnameVO> viewnames = new ArrayList<viewnameVO>();
		
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);		
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				viewnameVO vnVO = new viewnameVO();
				vnVO.setViewID(rs.getString("viewID"));
				vnVO.setViewname(rs.getString("viewname"));
				vnVO.setViewAddr(rs.getString("viewAddr"));
				vnVO.setViewlat(rs.getString("viewlat"));
				vnVO.setViewlng(rs.getString("viewlng"));
				vnVO.setViewTop(rs.getInt("viewTop"));
				vnVO.setViewArea(rs.getString("viewArea"));
				viewnames.add(vnVO);
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
		
		return viewnames;
	}

	@Override
	public String getAllJSON(String viewArea) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> cols = new ArrayList<String>();
		String viewnames="";
		
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT_AREA);	
			
			pstmt.setString(1, viewArea);
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
				jsonObj.put(cols.get(0), rs.getString(1));//viewID
				jsonObj.put(cols.get(1), rs.getString(2));//viewname
				jsonObj.put(cols.get(2), rs.getString(3));//viewAddr
				jsonObj.put(cols.get(3), rs.getString(4));//viewlat
				jsonObj.put(cols.get(4), rs.getString(5));//viewlat
				jsonObj.put(cols.get(5), rs.getString(6));//view_HitRate
				jsonObj.put(cols.get(6), rs.getString(7));//viewTop
				jsonArray.put(jsonObj);
			}
			
			viewnames = jsonArray.toString();
			
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
		
		return viewnames;
	}
	
	
	@Override
	public String getImgTop6() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> cols = new ArrayList<String>();
		String viewnames="";
		
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_STMT_ImgTop6);	
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
				jsonObj.put(cols.get(0), rs.getString(1));//viewId
				jsonObj.put(cols.get(1), rs.getString(2));//view_hitrate
				jsonObj.put(cols.get(2), rs.getString(3));//viewName
				jsonObj.put(cols.get(3), rs.getString(4));//imagesID
				jsonObj.put(cols.get(4), rs.getString(5));//imgsrc
				jsonObj.put(cols.get(5), rs.getString(6));//images_format
				jsonArray.put(jsonObj);
			}
			
			viewnames = jsonArray.toString();
			
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
		
		return viewnames;
	}
	
}
