package P7_ForgetPassWord.model;

public interface ForgetPassWord_interface {
	public ForgetPassWordVO findByPrimaryKey(String member_loginID ,String member_email);
	public void update(String member_loginID ,String create);//修改文章
}
