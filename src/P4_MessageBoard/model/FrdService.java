package P4_MessageBoard.model;

import java.util.List;

public class FrdService {
	
	private FrdDAO_interface dao;
	
	public FrdService(){
		dao = new FrdDAO();
	}
	
	
	// 新增一筆友誼狀態(尚未確認其友誼狀態)
	public FrdVO addFrd(String member_loginID, String friend_loginID, String invite_msg, int relationship_status, String cooperation_friend){
		
		FrdVO frdVO = new FrdVO();
		
		frdVO.setMember_loginID(member_loginID);
		frdVO.setFriend_loginID(friend_loginID);
		frdVO.setInvite_msg(invite_msg);
		frdVO.setRelationship_status(relationship_status);
		frdVO.setCooperation_friend(cooperation_friend);
		
		dao.insert(frdVO);
		
		return frdVO;
		
	} //end of addFrd
	
	
	public void updateFrd(Integer friendNum){
		
//		FrdVO frdVO = new FrdVO();
//		
//		frdVO.setRelationship_status(friendNum);
		
		dao.update(friendNum);
		
		//return;
		
	}
	
	
	//從jsp呼叫service getall方法 
	public List<FrdVO> getPart(String friend_loginID){
	//叫工人去做getall 先去DAO 從資料庫抓全部資料出來
		return dao.getPart(friend_loginID);
		
	}
	
	//從jsp呼叫service getMyFrdStatus方法 
		public List<FrdVO> getMyFrdStatus(String friend_loginID){
		//叫工人去做getMyFrdStatus 先去DAO 從資料庫抓全部資料出來
			return dao.getMyFrdStatus(friend_loginID);
			
		}
	
	//Get member's friends.
	public String getFrds(String memID){
		return dao.getFrds(memID);
	}
	
	public String getFrdsName(String memID){
		return dao.getFrdsName(memID);
	}
	
	public String updateCoNotify(String memID, String frdID, String msg){
		return dao.updateCoNotify(memID, frdID, msg);
	}
	
	public String getCoNotify(String memID){
		return dao.getCoNotify(memID);
	}
	
	public String clearCoNotify(String memID){
		//memID -> 開啟平台者
 		return dao.clearCoNotify(memID);
	}
	
	public String FrdclearCoNotify(String memID){
		//memID -> 受邀加入平台者
		return dao.FrdclearCoNotify(memID);
	}
}
