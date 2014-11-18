package P5_index.model;

import java.sql.*;

public class knowledgeVO {
	 
	 private String   knowledge_type;
	 private String	  knowledge_title;
	 private String	  knowledge_content;
	 private Blob     knowledge_img;
	 
	public String getKnowledge_type() {
		return knowledge_type;
	}
	public void setKnowledge_type(String knowledge_type) {
		this.knowledge_type = knowledge_type;
	}
	public String getKnowledge_title() {
		return knowledge_title;
	}
	public void setKnowledge_title(String knowledge_title) {
		this.knowledge_title = knowledge_title;
	}
	public String getKnowledge_content() {
		return knowledge_content;
	}
	public void setKnowledge_content(String knowledge_content) {
		this.knowledge_content = knowledge_content;
	}
	public Blob getKnowledge_img() {
		return knowledge_img;
	}
	public void setKnowledge_img(Blob knowledge_img) {
		this.knowledge_img = knowledge_img;
	}
	 
	 
	 
	 
	 
}
