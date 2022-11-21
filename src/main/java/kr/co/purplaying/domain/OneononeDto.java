package kr.co.purplaying.domain;

import java.util.Date;

public class OneononeDto{
  
	private Integer inquiry_no;
    private boolean inquiry_state;
    private String user_id;
	private String inquiry_title;
	private String inquiry_context;
	private boolean inquiry_private;
	private Date inquiry_regdate;
	
	
	public OneononeDto() {
	    
	}
	
//	public OneononeDto(String inquiry_title, String inquiry_context, String user_id) {
//        super();
//        this.inquiry_title = inquiry_title;
//        this.inquiry_context = inquiry_context;
//        this.user_id = user_id;
//    }

  public OneononeDto(Integer inquiry_no, boolean inquiry_state, String user_id, String inquiry_title,
      String inquiry_context, boolean inquiry_private, Date inquiry_regdate) {
    super();
    this.inquiry_no = inquiry_no;
    this.inquiry_state = inquiry_state;
    this.user_id = user_id;
    this.inquiry_title = inquiry_title;
    this.inquiry_context = inquiry_context;
    this.inquiry_private = inquiry_private;
    this.inquiry_regdate = inquiry_regdate;
  }

  public Integer getInquiry_no() {
    return inquiry_no;
  }

  public void setInquiry_no(Integer inquiry_no) {
    this.inquiry_no = inquiry_no;
  }

  public boolean isInquiry_state() {
    return inquiry_state;
  }

  public void setInquiry_state(boolean inquiry_state) {
    this.inquiry_state = inquiry_state;
  }

  public String getUser_id() {
    return user_id;
  }

  public void setUser_id(String user_id) {
    this.user_id = user_id;
  }

  public String getInquiry_title() {
    return inquiry_title;
  }

  public void setInquiry_title(String inquiry_title) {
    this.inquiry_title = inquiry_title;
  }

  public String getInquiry_context() {
    return inquiry_context;
  }

  public void setInquiry_context(String inquiry_context) {
    this.inquiry_context = inquiry_context;
  }

  public boolean isInquiry_private() {
    return inquiry_private;
  }

  public void setInquiry_private(boolean inquiry_private) {
    this.inquiry_private = inquiry_private;
  }

  public Date getInquiry_regdate() {
    return inquiry_regdate;
  }

  public void setInquiry_regdate(Date inquiry_regdate) {
    this.inquiry_regdate = inquiry_regdate;
  }

  @Override
  public String toString() {
    return "OneononeDto [inquiry_no=" + inquiry_no + ", inquiry_state=" + inquiry_state + ", user_id=" + user_id
        + ", inquiry_title=" + inquiry_title + ", inquiry_context=" + inquiry_context + ", inquiry_private="
        + inquiry_private + ", inquiry_regdate=" + inquiry_regdate + "]";
  }

	
	
	
	
	
}
