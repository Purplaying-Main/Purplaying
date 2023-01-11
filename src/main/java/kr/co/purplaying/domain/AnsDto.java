package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Objects;

public class AnsDto {

    private Integer ans_no;
    private Integer ans_state;
    private String admin_id;
  
    private Integer inquiry_no;
    
    private String ans_context;
    private Date ans_regdate;

    /*
    private boolean inquiry_state;
    private String user_id;
    private String inquiry_title;
    private String inquiry_context;
    private boolean inquiry_private;
    private Date inquiry_regdate;
    */
  
    
    public AnsDto() {
      // TODO Auto-generated constructor stub
    }

    public AnsDto(Integer ans_no, Integer ans_state, String admin_id, Integer inquiry_no, String ans_context,
        Date ans_regdate) {
      super();
      this.ans_no = ans_no;
      this.ans_state = ans_state;
      this.admin_id = admin_id;
      this.inquiry_no = inquiry_no;
      this.ans_context = ans_context;
      this.ans_regdate = ans_regdate;
    }

    public Integer getAns_no() {
      return ans_no;
    }

    public void setAns_no(Integer ans_no) {
      this.ans_no = ans_no;
    }

    public Integer getAns_state() {
      return ans_state;
    }

    public void setAns_state(Integer ans_state) {
      this.ans_state = ans_state;
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

    @Override
    public int hashCode() {
      return Objects.hash(admin_id, ans_context, ans_no, ans_regdate, ans_state, inquiry_no);
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
          && Objects.equals(ans_state, other.ans_state) && Objects.equals(inquiry_no, other.inquiry_no);
    }

    @Override
    public String toString() {
      return "AnsDto [ans_no=" + ans_no + ", ans_state=" + ans_state + ", admin_id=" + admin_id + ", inquiry_no="
          + inquiry_no + ", ans_context=" + ans_context + ", ans_regdate=" + ans_regdate + "]";
    }
    
    
  
}
