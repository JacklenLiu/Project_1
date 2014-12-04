package X1_ComputeLoginCount.model;

public interface MemDAO_interface {
	
	public void insert(MemVO memVO); //註冊成功後 新增一筆
	
	public void update(String member_loginID);

}
