package P5_index.model;


public class knowledgeService {

	private knowledgeDAO_interface dao;

	public knowledgeService() {
		dao = new knowledgeDAO();
	}
	
	public String getAllKnowledgeJSON() {
		return dao.getAllKnowledgeJSON();
	}
	

	
}
