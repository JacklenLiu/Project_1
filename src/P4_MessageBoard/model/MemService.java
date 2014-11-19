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
	
}
