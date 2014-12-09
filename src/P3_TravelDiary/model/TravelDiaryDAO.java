package P3_TravelDiary.model;

import java.util.*;
import java.sql.*;

import javax.naming.*;
import javax.sql.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
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
	
	//取會員朋友ID(不用ID)
//	private static final String GET_FRIENS_ID="select friend_loginID from member_friend where member_loginID=?";
	
	//取會員朋友Name()改用Name
//	private static final String GET_FRIENS_ID="select s.member_name ,s.member_loginID from member_friend f join  sysmember s  on f.friend_loginID=s.member_loginID where f.member_loginID=?";
	
	//上面指令寫錯改用這個
	private static final String GET_FRIENS_ID="select s.member_name ,s.member_loginID from member_friend f join  sysmember s  on f.friend_loginID=s.member_loginID where f.relationship_status=1 and f.member_loginID=?";
		
	//取文章
	private static final String GET_PIC2="select TravelDiary_ID,TravelDiary_Name,TravelDiary_Content , diary_class from TravelDiary where member_loginID=? order by publish_date  desc";
	
	//取朋友文章選擇沒有被封鎖的
	private static final String GET_FREINDS_BLOG="select TravelDiary_ID,TravelDiary_Name,TravelDiary_Content , diary_class from TravelDiary where member_loginID=? and diary_class='0' order by publish_date  desc";
	
	
	//取朋友文章選擇沒有被封鎖的(並抓取名稱)
//	private static final String GET_FREINDS_BLOG2="select  t.TravelDiary_ID,t.TravelDiary_Name,t.TravelDiary_Content , diary_class ,s.member_namefrom TravelDiary t join sysmember s on s.member_loginID=s.member_loginID where s.member_loginID='?' and diary_class='0' order by publish_date desc";
	
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
				//取文章日期
				travelDiaryVO.setPublish_date(rs.getTimestamp("publish_date"));
				//取ID
				travelDiaryVO.setTravelDiary_ID(rs.getInt("TravelDiary_ID"));
				//取會員編號
				travelDiaryVO.setMember_loginID(rs.getString("member_loginID"));
							
				//一次將這4筆資料放到list 之後jsp取出
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
		try{
			con =ds.getConnection();
			pstmt=con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1,TravelDiary_ID );
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				travelDiaryVO=new TravelDiaryVO();
				//取文章title 並放剛new的vo
				travelDiaryVO.setTravelDiary_Name(rs.getString("TravelDiary_Name"));
				//取文章日期 	   並放剛new的vo
				travelDiaryVO.setPublish_date(rs.getTimestamp("publish_date"));
				//取文章內容    並放剛new的vo
				travelDiaryVO.setTravelDiary_Content(rs.getString("TravelDiary_Content"));
				//取會員編號    並放剛new的vo
				travelDiaryVO.setMember_loginID(rs.getString("member_loginID"));
				travelDiaryVO.setTravelDiary_ID(rs.getInt("TravelDiary_ID"));
				
				
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
	//顯示全部文章瀑布流頁面
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
				//判別是否停權用
				String diaryClass="";
				diaryClass=rs.getString("diary_class");
				String cut2="";
				String Content="";
				String imgend=" width='190' height='200' >";
				if("0".equals(diaryClass)){
					Content=rs.getString("TravelDiary_Content");
					//取img標籤
					//找<img開頭位置
					int idx=Content.indexOf("<img");
					
					if(idx==-1){
						//若沒有img標籤
						cut2="<img src='../Images/nopic.jpg'>";
						
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
						//刪除不是寫在style裡面的高與寬
						cut2=cut2.replace("width","");
						cut2=cut2.replace("height","");
						
					}
				}else{
					cut2="<img src='../Images/stopblog.jpg'>";
				}
				//換掉wookmar要用的屬性
				cut2=cut2.replace(">", imgend);
				travelDiaryVO.setTravelDiary_Name(rs.getString("TravelDiary_Name"));
				travelDiaryVO.setTravelDiary_Content(cut2);
				travelDiaryVO.setTravelDiary_ID(rs.getInt("TravelDiary_ID"));
				travelDiaryVO.setDiary_class(rs.getString("diary_class"));
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
	
	//取會員朋友ID
	@Override
	public String getFriends(String member_loginID) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String memberFirendsID="";
		List<String> cols = new ArrayList<String>();
		try{
			con =ds.getConnection();
			pstmt=con.prepareStatement(GET_FRIENS_ID);
			pstmt.setString(1,member_loginID );
			rs=pstmt.executeQuery();	
			//欄位名稱只會找我在prepareStatement下的欄位名稱
			ResultSetMetaData rsmd = rs.getMetaData();
			int count = rsmd.getColumnCount();
			for(int i = 1; i <= count; i++) {
				cols.add(rsmd.getColumnLabel(i));
			}
			
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObj;
			while(rs.next()){
				jsonObj = new JSONObject();
				jsonObj.put(cols.get(0), rs.getString(1));//s.member_name
				jsonObj.put(cols.get(1), rs.getString(2));//s.member_loginID
				jsonArray.put(jsonObj);
			}
			
			memberFirendsID = jsonArray.toString();
			
		}catch(SQLException e){
			throw new RuntimeException("A database error occured."+e.getMessage());
		}catch (JSONException e) {
			e.printStackTrace();
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
		return memberFirendsID;
	}
	
	//取好友文章
	@Override
	public String getFriendsBlog(String myFriendID) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String myFriendsBlog="";
		List<String> cols = new ArrayList<String>();
		try{
			con =ds.getConnection();
			pstmt=con.prepareStatement(GET_FREINDS_BLOG);
			pstmt.setString(1,myFriendID);
			rs=pstmt.executeQuery();	
			
			
			ResultSetMetaData rsmd = rs.getMetaData();
			int count = rsmd.getColumnCount();
			for(int i = 1; i <= count; i++) {
				cols.add(rsmd.getColumnLabel(i));
//				System.out.println(rsmd.getColumnLabel(i));
			}
			
			JSONArray jsonArray = new JSONArray();
			JSONObject jsonObj;
			while(rs.next()){
				//判別是否停權用
				String diaryClass="";
				diaryClass=rs.getString("diary_class");
				String cut2="";
				String Content="";
				String imgend=" width='190' height='200' >";
				if("0".equals(diaryClass)){
					Content=rs.getString("TravelDiary_Content");
					//取img標籤
					//找<img開頭位置
					int idx=Content.indexOf("<img");
					
					if(idx==-1){
						//若沒有img標籤
						cut2="<img src='../Images/nopic.jpg'>";
						
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
				}else{
					cut2="<img src='../Images/stopblog.jpg'>";
				}
				
				
				
				//2.放回json裡面
				jsonObj = new JSONObject();
				jsonObj.put(cols.get(0), rs.getString(1));//TravelDiary_ID
				jsonObj.put(cols.get(1), rs.getString(2));//TravelDiary_Name
				jsonObj.put(cols.get(2), cut2);//TravelDiary_Content
				jsonArray.put(jsonObj);
			}
			
			myFriendsBlog = jsonArray.toString();
			
		}catch(SQLException e){
			throw new RuntimeException("A database error occured."+e.getMessage());
		}catch (JSONException e) {
			e.printStackTrace();
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
		
		
		
		return myFriendsBlog;
	}

}
