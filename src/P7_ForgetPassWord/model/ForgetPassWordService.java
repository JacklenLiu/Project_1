package P7_ForgetPassWord.model;

public class ForgetPassWordService {
	private ForgetPassWord_interface dao;
	public ForgetPassWordService(){
		dao =new  ForgetPassWordDAO();
	}
	
	//驗證是否有這筆會員帳號
	public ForgetPassWordVO checkMember(String member_loginID){

		return dao.findByPrimaryKey(member_loginID, member_loginID);
	}
	//產生亂數
	public String num(){
		ForgetPassWordRandom forgetPassWordRandom=new ForgetPassWordRandom();
		return forgetPassWordRandom.num();
		
	}
	
	//update會員的密碼
	public Boolean update(String member_loginID,String create){
		dao.update(member_loginID,create);
		return null;
	}
	
	
	public void autoEmail(
			String member_loginID,String member_email,String create){
		//new自動寄信的class
		ForgetPassWordAutoMail forgetPassWordAutoMail=new ForgetPassWordAutoMail(member_loginID, member_email,create);
		//自動寄信的方法開始送
		forgetPassWordAutoMail.start();
	}
	
	
}	
	
	

