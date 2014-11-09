package P5_index.model;

import java.sql.Date;

public class newsVO {
	 
	 private Date   news_date 		;		
	 private String news_title		;		
	 private String news_image		;		 
	 private String news_Content    ;
	 
	 
	public Date getNews_date() {
		return news_date;
	}
	public void setNews_date(Date news_date) {
		this.news_date = news_date;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public String getNews_image() {
		return news_image;
	}
	public void setNews_image(String news_image) {
		this.news_image = news_image;
	}
	public String getNews_Content() {
		return news_Content;
	}
	public void setNews_Content(String news_Content) {
		this.news_Content = news_Content;
	}    
	 
	 
	 
}
