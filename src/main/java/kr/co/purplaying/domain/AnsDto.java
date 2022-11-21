package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Objects;

public class AnsDto {

    private Integer ans_no;
    private String admin_id;
  
    private Integer inquiry_no;
    
    private String ans_context;
    private Date ans_regdate;
    
    private boolean inquiry_state;
    private String user_id;
    private String inquiry_title;
    private String inquiry_context;
    private boolean inquiry_private;
    private Date inquiry_regdate;
  
  
    public AnsDto() {
      // TODO Auto-generated constructor stub
    }


    public AnsDto(Integer ans_no, String admin_id, Integer inquiry_no, String ans_context, Date ans_regdate,
        boolean inquiry_state, String user_id, String inquiry_title, String inquiry_context, boolean inquiry_private,
        Date inquiry_regdate) {
      super();
      this.ans_no = ans_no;
      this.admin_id = admin_id;
      this.inquiry_no = inquiry_no;
      this.ans_context = ans_context;
      this.ans_regdate = ans_regdate;
      this.inquiry_state = inquiry_state;
      this.user_id = user_id;
      this.inquiry_title = inquiry_title;
      this.inquiry_context = inquiry_context;
      this.inquiry_private = inquiry_private;
      this.inquiry_regdate = inquiry_regdate;
    }


    @Override
    public int hashCode() {
      return Objects.hash(admin_id, ans_context, ans_no, ans_regdate, inquiry_context, inquiry_no, inquiry_private,
          inquiry_regdate, inquiry_state, inquiry_title, user_id);
    }


    @Override
    public boolean equals(Object obj) {
      if (this == obj)
        return true;
      if (obj == null)
        return false;
      if (getClass() != obj.getClass())
        return false;
      AnsDto other = (AnsDto) obj;
      return Objects.equals(admin_id, other.admin_id) && Objects.equals(ans_context, other.ans_context)
          && Objects.equals(ans_no, other.ans_no) && Objects.equals(ans_regdate, other.ans_regdate)
          && Objects.equals(inquiry_context, other.inquiry_context) && Objects.equals(inquiry_no, other.inquiry_no)
          && inquiry_private == other.inquiry_private && Objects.equals(inquiry_regdate, other.inquiry_regdate)
          && inquiry_state == other.inquiry_state && Objects.equals(inquiry_title, other.inquiry_title)
          && Objects.equals(user_id, other.user_id);
    }


    public Integer getAns_no() {
      return ans_no;
    }


    public void setAns_no(Integer ans_no) {
      this.ans_no = ans_no;
    }


    public String getAdmin_id() {
      return admin_id;
    }


    public void setAdmin_id(String admin_id) {
      this.admin_id = admin_id;
    }


    public Integer getInquiry_no() {
      return inquiry_no;
    }


    public void setInquiry_no(Integer inquiry_no) {
      this.inquiry_no = inquiry_no;
    }


    public String getAns_context() {
      return ans_context;
    }


    public void setAns_context(String ans_context) {
      this.ans_context = ans_context;
    }


    public Date getAns_regdate() {
      return ans_regdate;
    }


    public void setAns_regdate(Date ans_regdate) {
      this.ans_regdate = ans_regdate;
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
      return "AnsDto [ans_no=" + ans_no + ", admin_id=" + admin_id + ", inquiry_no=" + inquiry_no + ", ans_context="
          + ans_context + ", ans_regdate=" + ans_regdate + ", inquiry_state=" + inquiry_state + ", user_id=" + user_id
          + ", inquiry_title=" + inquiry_title + ", inquiry_context=" + inquiry_context + ", inquiry_private="
          + inquiry_private + ", inquiry_regdate=" + inquiry_regdate + "]";
    }
    
  
  
}
