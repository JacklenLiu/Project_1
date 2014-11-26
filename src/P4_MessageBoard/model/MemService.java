package P4_MessageBoard.model;

import java.util.List;

public class MemService {
	
	private MemDAO_interface dao;
	public MemService(){
		dao = new MemDAO();
	}
	
	public List<MemVO> getAll(String query_string){
		return dao.getAll(query_string);
	}
	
	public String getAllJSON(String query_string) {
		return dao.getAllJSON(query_string);
	}
	
	
	//新增查詢會員 join 好友狀態....
	public String getAllJSON2(String loginID, String query_string) {
		return dao.getAllJSON2(loginID, query_string);
	}
	
}
