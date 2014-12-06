package P2_route.model;

import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
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
	private static final String GET_STMT_ImgTop6 ="select top(6) viewID, view_hitrate ,viewname, imagesID  , imgDescript , imgsrc ,images_format from  viewname join  images on viewname.viewid = images.imagesname where images.imagesID like'%_01' order by viewname.view_HitRate desc ;";
	private static final String GET_LATLNG_STMT_VIEWID ="SELECT viewlat,viewlng FROM viewname where viewID=?";
	private static final String INSERT_ROUTE_STMT_MEMID ="INSERT INTO route Values (?,?,?)";
	private static final String INSERT_ROUTEVIEW_STMT_ROUTEID ="INSERT INTO RouteView Values (?,?,?)";
	private static final String GET_ROUTE_STMT_MEMID ="SELECT routeID, routeName, buildTime FROM route where member_loginID=?  order by buildTime desc";
	private static final String GET_ROUTEORDER_STMT_ROUTEID ="SELECT viewID, RouteViewOrder FROM routeView where routeID=?  order by RouteViewOrder";
	private static final String GET_ROUTEFIRST_STMT_ROUTEID ="SELECT top(1) viewID FROM routeView where routeID=?  order by RouteViewOrder";
	private static final String DELETE_ROUTE_STMT_MEMID ="DELETE FROM route where routeID = ?";
	private static final String GET_ROUTENAME_STMT_ROUTEID ="SELECT routeName FROM route where routeID = ?";
	private static final String UPDATE_VIEWHITRATE_STMT_VIEWID ="UPDATE viewname set view_HitRate=? where viewID = ?";
	private static final String GET_VIEWHITRATE_STMT_VIEWID ="SELECT view_HitRate FROM viewname where viewID = ?";
	private static final String GET_VIEWDETAIL_STMT_VIEWID ="SELECT top(1) viewID, viewname, viewaddr, imgDescript FROM viewname JOIN images ON viewname.viewID=images.imagesName WHERE viewID= ?";
	
	private static final String GET_Search_IMAGES="select i.imagesid, i.imagesname ,  v.viewname ,  v.viewArea , i.imgdescript , i.imgsrc , i.images_format from images i join viewname v on imagesname = viewid where v.viewname like ? and i.imagesID like '%_01' ;";
	private static final String GET_ALL_IMAGES="select i.imagesid, i.imagesname ,  v.viewname , i.imgdescript , i.imgsrc , i.images_format from images i join viewname v on imagesname = viewid where i.imagesID like '%_01';";
	private static final String GET_ALL_IMAGES2="select i.imagesid, i.imagesname ,  v.viewname ,  v.viewArea , i.imgdescript , i.imgsrc , i.images_format from images i join viewname v on imagesname = viewid where i.imagesID like '%_01';";
	private static final String viewName_imgDescript ="select viewname,imgDescript from viewName join images on viewId = imagesname where images.imagesId like ? order by images.imagesID;";
	
	private static final String GET_N_S_W=" select i.imagesid, i.imagesname ,  v.viewname ,  v.viewArea , i.imgdescript , i.imgsrc , i.images_format from images i join viewname v on imagesname = viewid where i.imagesID like '%_01' and i.imagesID not like 'E%'";

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
				jsonObj.put(cols.get(4), rs.getString(5));//imgDescript
				jsonObj.put(cols.get(5), rs.getString(6));//imgsrc
				jsonObj.put(cols.get(6), rs.getString(7));//images_format
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
	
	public String getViewLatlng(String viewID){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> cols = new ArrayList<String>();
		String viewLatlng="";
		
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_LATLNG_STMT_VIEWID);	
			
			pstmt.setString(1, viewID);
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
				jsonObj.put(cols.get(0), rs.getString(1));//viewlat
				jsonObj.put(cols.get(1), rs.getString(2));//viewlng
				jsonArray.put(jsonObj);
			}
			
			viewLatlng = jsonArray.toString();
			
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
		
		return viewLatlng;
	}

	@Override
	public Integer insertRouteByID(String memID, String routeName, Date buildTime) {
		Connection con = null;
		PreparedStatement pstmt = null;
		//ResultSet rs = null;
		Integer key=0;
		List<String> cols = new ArrayList<String>();
		//String viewLatlng="";
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_ROUTE_STMT_MEMID, Statement.RETURN_GENERATED_KEYS);	
			
			pstmt.setString(1, routeName);
			pstmt.setDate(2, buildTime);
			pstmt.setString(3, memID);
			pstmt.executeUpdate();
			
			//掘取對應的自增主鍵值
			ResultSet rsKeys = pstmt.getGeneratedKeys();
			ResultSetMetaData rsmd = rsKeys.getMetaData();
			int columnCount = rsmd.getColumnCount();
			if (rsKeys.next()) {
				do {
					for (int i = 1; i <= columnCount; i++) {
						key = rsKeys.getInt(i);
						System.out.println("自增主鍵值(i=" + i + ") = " + key +"(剛新增成功的員工編號)");
					}
				} while (rsKeys.next());
			} else {
				System.out.println("NO KEYS WERE GENERATED.");
			}
			
			
		}catch(SQLException e){
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
		return key;
	}

	@Override
	public String insertRouteViewByRouteID(Integer routeID,
			String routeResultView, Integer routeResultViewOrder) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String status ="";
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_ROUTEVIEW_STMT_ROUTEID);	
			
			pstmt.setInt(1, routeID);
			pstmt.setString(2, routeResultView);
			pstmt.setInt(3, routeResultViewOrder);
			int count = pstmt.executeUpdate();
			if(count!=0)
				status = "success";
			
		}catch(SQLException e){
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
		return status;
	}

	@Override
	public String getRouteByMemID(String memID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> cols = new ArrayList<String>();
		String memRouteStr="";
		
try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ROUTE_STMT_MEMID);	
			
			pstmt.setString(1, memID);
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
				jsonObj.put(cols.get(0), rs.getString(1));//routeID
				jsonObj.put(cols.get(1), rs.getString(2));//routeName
				jsonObj.put(cols.get(2), rs.getString(3));//buildTime
				jsonArray.put(jsonObj);
			}
			
			memRouteStr = jsonArray.toString();
			
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
		return memRouteStr;
	}

	@Override
	public String getRouteOrderByRouteID(Integer routeID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> cols = new ArrayList<String>();
		String routeOrder="";
		
try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ROUTEORDER_STMT_ROUTEID);	
			
			pstmt.setInt(1, routeID);
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
				jsonObj.put(cols.get(1), rs.getInt(2));//RouteViewOrder
				jsonArray.put(jsonObj);
			}
			
			routeOrder = jsonArray.toString();
			
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
		return routeOrder;
	}

	@Override
	public String getRouteFisrtByRouteID(Integer routeID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String routeFirst="";
		
			try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ROUTEFIRST_STMT_ROUTEID);	
			
			pstmt.setInt(1, routeID);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				routeFirst = rs.getString(1);
			}
			
		}catch(SQLException e){
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
		return routeFirst;
	}

	@Override
	public String deleteRouteByID(Integer routeID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int count=0;
		String status="";
		
try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_ROUTE_STMT_MEMID);	
			
			pstmt.setInt(1, routeID);
			count = pstmt.executeUpdate();			
			
		}catch(SQLException e){
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
		if(count!=0){
			status = "success";
		}
			return status;
	}

	@Override
	public Integer increaseHitRate(String routeResultView, Integer hitRate) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_VIEWHITRATE_STMT_VIEWID);	
			
			pstmt.setInt(1, hitRate);
			pstmt.setString(2, routeResultView);
			count = pstmt.executeUpdate();
			
		}catch(SQLException e){
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
		return count;
	}

	@Override
	public Integer getHitRate(String routeResultView) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Integer hitRate=0;
		
try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_VIEWHITRATE_STMT_VIEWID);	
			
			pstmt.setString(1, routeResultView);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				hitRate = rs.getInt(1);
			}
			
		}catch(SQLException e){
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
		return hitRate;
	}

	@Override
	public String getViewDetailByViewID(String viewID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> cols = new ArrayList<String>();
		String viewDetail="";
		
try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_VIEWDETAIL_STMT_VIEWID);	
			
			pstmt.setString(1, viewID);
			rs = pstmt.executeQuery();
			
			ResultSetMetaData rsmd = rs.getMetaData();
			int count = rsmd.getColumnCount();
			for(int i = 1; i <= count; i++) {
				cols.add(rsmd.getColumnLabel(i));
			}
			JSONObject jsonObj = new JSONObject();
			while(rs.next()){
				jsonObj = new JSONObject();
				jsonObj.put(cols.get(0), rs.getString(1));//viewID
				jsonObj.put(cols.get(1), rs.getString(2));//viewname
				jsonObj.put(cols.get(2), rs.getString(3));//viewaddr
				jsonObj.put(cols.get(3), rs.getString(4));//imgDescript
			}
			
			viewDetail = jsonObj.toString();
			
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
		return viewDetail;
	}

	@Override
	public String getRouteNameByRouteID(Integer routeID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String routeName="";
		
try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ROUTENAME_STMT_ROUTEID);	
			
			pstmt.setInt(1, routeID);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				routeName = rs.getString(1);//routeName
			}
			
		}catch(SQLException e){
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
		return routeName;
	}
	
	@Override
	public String getAllImg() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> cols = new ArrayList<String>();
		String viewnames="";
		
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_IMAGES);	
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
				jsonObj.put(cols.get(0), rs.getString(1));//imagesID
				jsonObj.put(cols.get(1), rs.getString(2));//imagesName
				jsonObj.put(cols.get(2), rs.getString(3));//viewname
				jsonObj.put(cols.get(3), rs.getString(4));//imgDescript
				jsonObj.put(cols.get(4), rs.getString(5));//imgSrc
				jsonObj.put(cols.get(5), rs.getString(6));//img_format
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
	public String getAllImgSec() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> cols = new ArrayList<String>();
		String viewnames="";
		
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_IMAGES2);	
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
				jsonObj.put(cols.get(0), rs.getString(1));//imagesID
				jsonObj.put(cols.get(1), rs.getString(2));//imagesName
				jsonObj.put(cols.get(2), rs.getString(3));//viewname
				jsonObj.put(cols.get(3), rs.getString(4));//viewArea
				jsonObj.put(cols.get(4), rs.getString(5));//imgDescript
				jsonObj.put(cols.get(5), rs.getString(6));//imgSrc
				jsonObj.put(cols.get(6), rs.getString(7));//img_format
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
	public String getAllSearchImg(String imagesID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> cols = new ArrayList<String>();
		String viewnames="";
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_Search_IMAGES);	
			pstmt.setString(1,"%"+imagesID+"%");
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
				jsonObj.put(cols.get(0), rs.getString(1));//imagesID
				jsonObj.put(cols.get(1), rs.getString(2));//imagesName
				jsonObj.put(cols.get(2), rs.getString(3));//viewname
				jsonObj.put(cols.get(3), rs.getString(4));//viewArea
				jsonObj.put(cols.get(4), rs.getString(5));//imgDescript
				jsonObj.put(cols.get(5), rs.getString(6));//imgSrc
				jsonObj.put(cols.get(6), rs.getString(7));//img_format
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
	public int getImgTop6Count() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int topCount=0;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_STMT_ImgTop6);	
			rs = pstmt.executeQuery();
			
		
			while(rs.next()){
				topCount += rs.getInt("view_hitrate");
			}
			
			
		}catch(SQLException e){
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
		return topCount;
	}
	
	@Override
	public List<viewnameVO> viewName_imgDescript(String imagesID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<viewnameVO> viewnames = new ArrayList<viewnameVO>();
		viewnameVO vnVO =null;
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(viewName_imgDescript);		
			pstmt.setString(1,imagesID+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				vnVO = new viewnameVO();
				vnVO.setViewname(rs.getString(1));//viewname
				vnVO.setImg_Descript(rs.getString(2));//img_Descript
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
	public String getImgByID(String imgID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		List<String> cols = new ArrayList<String>();
		ResultSet rs = null;
		String imgStr="";
		
		final String GET_IMG_STMT_IMGIDLIKE ="SELECT top(1) images_format, imgSrc  FROM images where imagesID like ?";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_IMG_STMT_IMGIDLIKE);
			pstmt.setString(1, "%"+imgID+"%");
			rs = pstmt.executeQuery();
			
			ResultSetMetaData rsmd = rs.getMetaData();
			int count = rsmd.getColumnCount();
			for(int i = 1; i <= count; i++) {
				cols.add(rsmd.getColumnLabel(i));
			}
			
			JSONObject jsonObj = new JSONObject();			
			if(rs.next()){
				jsonObj = new JSONObject();
				jsonObj.put(cols.get(0), rs.getString(1));
				Blob bb = rs.getBlob(2);
				byte[] b = bb.getBytes(1, (int)bb.length());
				jsonObj.put(cols.get(1), b);
			}
			imgStr = jsonObj.toString();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(JSONException e){
			e.printStackTrace();
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
		return imgStr;
	}
	
	@Override
	public String getAllImg2() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> cols = new ArrayList<String>();
		String viewnames="";
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_N_S_W);	
			rs = pstmt.executeQuery();
			
			ResultSetMetaData rsmd = rs.getMetaData();
			int count = rsmd.getColumnCount();
			for(int i = 1; i <= count; i++) {
				cols.add(rsmd.getColumnLabel(i));
			}
			
			JSONArray jsonArray = new JSONArray();
			JSONArray jsonArray2 = new JSONArray();
			JSONObject jsonObj;
			while(rs.next()){
				jsonObj = new JSONObject();
				jsonObj.put(cols.get(0), rs.getString(1));//imagesID
				jsonObj.put(cols.get(1), rs.getString(2));//imagesName
				jsonObj.put(cols.get(2), rs.getString(3));//viewname
				jsonObj.put(cols.get(3), rs.getString(4));//viewArea
				jsonObj.put(cols.get(4), rs.getString(5));//imgDescript
				jsonObj.put(cols.get(5), rs.getString(6));//imgSrc
				jsonObj.put(cols.get(6), rs.getString(7));//img_format
				jsonArray.put(jsonObj);
			}
			//先算取幾筆2~5去算
			int randomTime;
			randomTime=(int)(Math.random()*5+2);
			if(randomTime>5){
				randomTime=5;
			}
			System.out.println(randomTime);
			//再去算從總共比數挑哪幾筆
			int randomView;
			for(int i=0;i<randomTime;i++){
				randomView=(int)(Math.random()*jsonArray.length());
				jsonArray2.put(jsonArray.get(randomView));
//				jsonArray.get(randomView);
			}
//			System.out.println((int)(Math.random()*jsonArray.length()+1));
//			System.out.println(jsonArray.get(0));
//			viewnames = jsonArray.toString();
			viewnames = jsonArray2.toString();
			
			
			System.out.println();
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
