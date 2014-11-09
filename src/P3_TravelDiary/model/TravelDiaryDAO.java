package P3_TravelDiary.model;

import java.util.*;
import java.sql.*;

import javax.naming.*;
import javax.sql.*;
public class TravelDiaryDAO implements TravelDiary_Interface {
	
	private static DataSource ds=null;
	static{
		try{
			Context ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/Project_1");
		}catch(NamingException e){
			e.printStackTrace();
		}
	}
	
	//準備insert blog指令
	private static final String INSERT_STMT=
			"insert into TravelDiary (TravelDiary_Name,publish_date,TravelDiary_Content,member_loginID)values(?,?,?,?)";
	//準備selecta all指令並依照日期排序
	private static final String GET_ALL_STMT=
			"select TravelDiary_Name,publish_date,TravelDiary_ID,member_loginID from TravelDiary where member_loginID=? order by publish_date desc";
	
	//按到修改按鈕先去執行撈出這筆資料
	private static final String GET_ONE_STMT=
			"select TravelDiary_Name,publish_date,TravelDiary_Content,member_loginID,TravelDiary_ID from TravelDiary where  TravelDiary_ID=?";
	
	//update指令
	private static final String UPDATE=
			"update TravelDiary set TravelDiary_Name=?,publish_date=?,TravelDiary_Content=? where TravelDiary_ID=?";
	
	//delete指令
	private static final String DELETE="delete TravelDiary where TravelDiary_ID = ?";
	
	
	
	//先取每篇文章內容指令 之後再去切字串
	private static final String GET_PIC="select TravelDiary_Content from TravelDiary where member_loginID=? order by publish_date  desc";
	
	
	//取文章測試2
	private static final String GET_PIC2="select TravelDiary_ID,TravelDiary_Name,TravelDiary_Content from TravelDiary where member_loginID=? order by publish_date  desc";
	
	@Override
	public void insert(TravelDiaryVO travelDiaryVO) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			//取得連線
			con=ds.getConnection();
			pstmt=con.prepareStatement(INSERT_STMT);
			//文章title
			pstmt.setString(1,travelDiaryVO.getTravelDiary_Name());
			//文章日期
			pstmt.setTimestamp(2,travelDiaryVO.getPublish_date());
			//文章內容
			pstmt.setString(3,travelDiaryVO.getTravelDiary_Content());
			//會員編號
			pstmt.setString(4,travelDiaryVO.getMember_loginID());
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
	//update 資料
	@Override
	public void update(TravelDiaryVO travelDiaryVO) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(UPDATE);
			pstmt.setString(1, travelDiaryVO.getTravelDiary_Name());
			pstmt.setTimestamp(2, travelDiaryVO.getPublish_date());
			pstmt.setString(3, travelDiaryVO.getTravelDiary_Content());
			pstmt.setInt(4,travelDiaryVO.getTravelDiary_ID() );
		
			pstmt.executeUpdate();
		}catch(SQLException e){
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
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
	}
	//刪除指定資料
	@Override
	public void delete(Integer TravelDiary_ID) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(DELETE);
			
			pstmt.setInt(1,TravelDiary_ID);
			pstmt.executeUpdate();
			
		}catch (SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
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
	
	//取出全部資料
	@Override
	public List<TravelDiaryVO> getAll(String memberid) {
		List<TravelDiaryVO> list=new ArrayList<TravelDiaryVO>();
		TravelDiaryVO travelDiaryVO=null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(GET_ALL_STMT);
			pstmt.setString(1,memberid);
			//執行指令
			rs=pstmt.executeQuery();
			//一筆一筆撈出來
			while(rs.next()){
				//先new一個TravelDiaryVO的物件用來存放資料
				travelDiaryVO=new TravelDiaryVO();
				//取文章title
				travelDiaryVO.setTravelDiary_Name(rs.getString("TravelDiary_Name"));
				//System.out.println("title:"+rs.getString("TravelDiary_Name"));
				//取文章日期
				travelDiaryVO.setPublish_date(rs.getTimestamp("publish_date"));
				//System.out.println("date:"+rs.getDate("publish_date"));
				//取ID
				travelDiaryVO.setTravelDiary_ID(rs.getInt("TravelDiary_ID"));
				//System.out.println("count:"+rs.getInt("TravelDiary_ID"));
				//取會員編號
				travelDiaryVO.setMember_loginID(rs.getString("member_loginID"));
				//System.out.println("memberid:"+rs.getString("member_loginID"));
				
				
				
				
				//一次將這4筆資料放到list 之後jsp取出
//				System.out.println("*******************************");
				list.add(travelDiaryVO);
			}			
		}catch(SQLException e){
			throw new RuntimeException("A database error occured."+e.getMessage());
		}finally{
			if(rs!=null){
				try{
					rs.close();
				}catch(SQLException e){
					e.printStackTrace(System.err);
				}
			}
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
		return list;
	}
	
	
	//取出要修改的某一筆資料的欄位
	@Override
	public TravelDiaryVO findByPrimaryKey(Integer TravelDiary_ID) {
		TravelDiaryVO travelDiaryVO =null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//System.out.println("3");
		try{
			con =ds.getConnection();
			pstmt=con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1,TravelDiary_ID );
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				travelDiaryVO=new TravelDiaryVO();
				//取文章title 並放剛new的vo
				travelDiaryVO.setTravelDiary_Name(rs.getString("TravelDiary_Name"));
				//System.out.println("title:"+rs.getString("TravelDiary_Name"));
				//取文章日期 	   並放剛new的vo
				travelDiaryVO.setPublish_date(rs.getTimestamp("publish_date"));
				//System.out.println("date:"+rs.getDate("publish_date"));
				//取文章內容    並放剛new的vo
				travelDiaryVO.setTravelDiary_Content(rs.getString("TravelDiary_Content"));
				//System.out.println("count:"+rs.getInt("TravelDiary_ID"));
				//取會員編號    並放剛new的vo
				travelDiaryVO.setMember_loginID(rs.getString("member_loginID"));
				//System.out.println("memberid:"+rs.getString("member_loginID"));
				travelDiaryVO.setTravelDiary_ID(rs.getInt("TravelDiary_ID"));
				//System.out.println("memberid:"+rs.getString("TravelDiary_ID"));
				
				
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
				
		return travelDiaryVO;
	}
	@Override
	public ArrayList<String> getPic(String memberinfo) {
		ArrayList<String> list=new ArrayList<String>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			con =ds.getConnection();
			pstmt=con.prepareStatement(GET_PIC);
			pstmt.setString(1,memberinfo );
			rs=pstmt.executeQuery();
			//String TravelContent="";
			
			while(rs.next()){
				//計算有幾次
				
				String Content="";
				Content=rs.getString("TravelDiary_Content");
				//取img標籤
				//找<img開頭位置
				int idx=Content.indexOf("<img");
				String cut2="";
				if(idx==-1){
					//若沒有img標籤
					cut2="<img src='img/error.jpg'>";
				}else{
					//有img標籤
					//刪除<img 之前的所有字串
					String cut1=Content.substring(idx);
					//找img結尾>位置
					int end=cut1.indexOf(">");
					cut2=cut1.substring(0,end+1);
				}
				
				
				list.add(cut2);
			}
			
			//System.out.println("rs.getString(TravelDiary_Content)="+rs.getString("TravelDiary_Content"));
			
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
		
		
		return list;
	}
	@Override
	public List<TravelDiaryVO> getPic2(String memberinfo) {
		TravelDiaryVO travelDiaryVO =null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<TravelDiaryVO> list=new ArrayList<TravelDiaryVO>();
		

		try{
			con =ds.getConnection();
			pstmt=con.prepareStatement(GET_PIC2);
			pstmt.setString(1,memberinfo );
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				travelDiaryVO=new TravelDiaryVO();
				String Content="";
				String imgend=" width='190' height='200' >";
				
				Content=rs.getString("TravelDiary_Content");
				//取img標籤
				//找<img開頭位置
				int idx=Content.indexOf("<img");
				String cut2="";
				if(idx==-1){
					//若沒有img標籤
					cut2="<img src='img/error.jpg'>";
					
				}else{
					//有img標籤
					//刪除<img 之前的所有字串
					String cut1=Content.substring(idx);
					//找img結尾>位置
					int end=cut1.indexOf(">");
					cut2=cut1.substring(0,end+1);
					
					//將原本圖片的屬性刪除
					int imgcut=cut2.indexOf("style=");
					cut2=cut2.substring(0,imgcut) +" >";
				}
				
				//換掉wookmar要用的屬性
				cut2=cut2.replace(">", imgend);
				travelDiaryVO.setTravelDiary_Name(rs.getString("TravelDiary_Name"));
				travelDiaryVO.setTravelDiary_Content(cut2);
				travelDiaryVO.setTravelDiary_ID(rs.getInt("TravelDiary_ID"));
				list.add(travelDiaryVO);
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
			
		return list;
	}

}
