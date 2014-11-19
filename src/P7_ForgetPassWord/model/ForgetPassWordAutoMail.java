package P7_ForgetPassWord.model;
import java.sql.Timestamp;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Address;
public class ForgetPassWordAutoMail extends Thread{
	//待會要寄的mail
	String member_loginID;
	String member_email;
	String fromuser="cecj0601@gmail.com";
	String newPass;
	String radomnum;
	public ForgetPassWordAutoMail(String member_loginID, String member_email,String create){
		this.member_loginID=member_loginID;
		this.member_email=member_email;
		this.newPass=create;
	}
	
	
	
	public void run() {
		

		
		//寄信參數準備
		int port = 587;  
        String host = "smtp.gmail.com";
        //管理員mail
        final String username = "cecj0601@gmail.com";
        final String password = "cecj06123"; 

		
        try{
        	//將Gmail的參數設定用好
	        Properties props = new Properties();  
	        props.put("mail.smtp.host", host);  
	        props.put("mail.smtp.auth", "true");  
	        props.put("mail.smtp.starttls.enable", "true");  
	        props.put("mail.smtp.port", port);  
	        props.put("mail.smtp.starttls.enable", "true");

	        
	        
	        
	        Session session = Session.getInstance(props,new Authenticator(){  
	              protected PasswordAuthentication getPasswordAuthentication() {  
	                  return new PasswordAuthentication(username, password);  
	              }} );  
	      
	        
	     

	        Message msg = new MimeMessage(session);
	        msg.setFrom(new InternetAddress( fromuser ));
	        msg.setRecipient(Message.RecipientType.TO, new InternetAddress( member_email ));
	        msg.setSubject( "下一站!幸福!(客服系統)： 忘記密碼重新寄送");
	        //寫給使用者的內容
	        String text=member_loginID+"您好:<br>已經更改您的密碼。<br>新密碼為:<strong> "+newPass+"</strong>。  \n\n 謝謝。";
	        msg.setContent(text, "text/html; charset=utf-8");  
	        
	        Transport transport = session.getTransport("smtp");
	        transport.connect(host,username,password);
	        
	        //取要寄給user的mail
	        String to = InternetAddress.toString(msg.getRecipients(Message.RecipientType.TO)); 
//	        System.out.println(to);
	        //取送信者的mail
//	        System.out.println("Reply-to: " + InternetAddress.toString(msg.getReplyTo()));
	        //取送信者的mail
//	        System.out.println("Reply-to: " + InternetAddress.toString(msg.getFrom()));
	       
	        
	        //開始寄信
	        transport.sendMessage( msg ,msg.getRecipients(Message.RecipientType.TO) );
	       
	        transport.close();
	        } catch (MessagingException e) {  
	            throw new RuntimeException(e);  
	        }  
				
	}
	
	
	
	
	
	
}
