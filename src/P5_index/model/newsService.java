package P5_index.model;


public class newsService {

	private newsDAO_interface dao;

	public newsService() {
		dao = new newsDAO();
	}
	
	public String getAllNewsJSON() {
		return dao.getAllNewsJSON();
	}
	
	public newsVO getOne(String newsID) {
		return dao.getOne(newsID);
	}
	
}
