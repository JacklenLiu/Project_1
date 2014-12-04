package X1_ComputeLoginCount.model;

public class MemService {
	
	private MemDAO_interface dao;
	public MemService(){
		dao = new MemDAO();
	}
	
	public MemVO insert(String 	member_loginID,
						int		totalcount){
		
		MemVO memVO = new MemVO();
		
		memVO.setMember_loginID(member_loginID);
		memVO.setTotalcount(totalcount);
		dao.insert(memVO);
		
		return memVO;
		
	}
	
	public void update(String member_loginID){
		dao.update(member_loginID);;
	}

}
