package P4_MessageBoard.model;

import java.sql.Date;

public class MsgVO implements java.io.Serializable {
	private int 	messageNum;
	private String 	member_loginID;
	private String	title;
	private String	content;
	private Date	build_time;
	private int	message_stop;
	private int		replyfrom;
	
	private String member_name;
	
	public int getMessageNum() {
		return messageNum;
	}
	public void setMessageNum(int messageNum) {
		this.messageNum = messageNum;
	}
	public String getMember_loginID() {
		return member_loginID;
	}
	public void setMember_loginID(String member_loginID) {
		this.member_loginID = member_loginID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getBuild_time() {
		return build_time;
	}
	public void setBuild_time(Date build_time) {
		this.build_time = build_time;
	}
	public int getMessage_stop() {
		return message_stop;
	}
	public void setMessage_stop(int message_stop) {
		this.message_stop = message_stop;
	}
	public int getReplyfrom() {
		return replyfrom;
	}
	public void setReplyfrom(int replyfrom) {
		this.replyfrom = replyfrom;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	
	
}
