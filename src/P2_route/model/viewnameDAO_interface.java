package P2_route.model;

import java.util.List;

public interface viewnameDAO_interface {
	public void insert(viewnameVO vnVO);
    public void update(viewnameVO vnVO);
    public void delete(Integer empno);
    public viewnameVO findByPrimaryKey(Integer viewID);
    public List<viewnameVO> getAll();
    public String getAllJSON(String viewArea);
    public String getImgTop6();
}
