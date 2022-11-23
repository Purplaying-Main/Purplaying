package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Objects;

public class OneononeDto{
  
    private Integer inquiry_no;
    private Integer inquiry_state;
    private String writer;
    private String inquiry_title;
    private String inquiry_context;
    private boolean inquiry_private;
    private Date inquiry_regdate;
    private AnsDto ansDto;
    
    
    public OneononeDto() {
      // TODO Auto-generated constructor stub
    }


  public OneononeDto(Integer inquiry_no, Integer inquiry_state, String writer, String inquiry_title,
      String inquiry_context, boolean inquiry_private, Date inquiry_regdate, AnsDto ansDto) {
    super();
    this.inquiry_no = inquiry_no;
    this.inquiry_state = inquiry_state;
    this.writer = writer;
    this.inquiry_title = inquiry_title;
    this.inquiry_context = inquiry_context;
    this.inquiry_private = inquiry_private;
    this.inquiry_regdate = inquiry_regdate;
    this.ansDto = ansDto;
  }


  public Integer getInquiry_no() {
    return inquiry_no;
  }


  public void setInquiry_no(Integer inquiry_no) {
    this.inquiry_no = inquiry_no;
  }


  public Integer getInquiry_state() {
    return inquiry_state;
  }


  public void setInquiry_state(Integer inquiry_state) {
    this.inquiry_state = inquiry_state;
  }


  public String getWriter() {
    return writer;
  }


  public void setWriter(String writer) {
    this.writer = writer;
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


  public AnsDto getAnsDto() {
    return ansDto;
  }


  public void setAnsDto(AnsDto ansDto) {
    this.ansDto = ansDto;
  }


  @Override
  public int hashCode() {
    return Objects.hash(ansDto, inquiry_context, inquiry_no, inquiry_private, inquiry_regdate, inquiry_state,
        inquiry_title, writer);
  }


  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    OneononeDto other = (OneononeDto) obj;
    return Objects.equals(ansDto, other.ansDto) && Objects.equals(inquiry_context, other.inquiry_context)
        && Objects.equals(inquiry_no, other.inquiry_no) && inquiry_private == other.inquiry_private
        && Objects.equals(inquiry_regdate, other.inquiry_regdate) && Objects.equals(inquiry_state, other.inquiry_state)
        && Objects.equals(inquiry_title, other.inquiry_title) && Objects.equals(writer, other.writer);
  }


  @Override
  public String toString() {
    return "OneononeDto [inquiry_no=" + inquiry_no + ", inquiry_state=" + inquiry_state + ", writer=" + writer
        + ", inquiry_title=" + inquiry_title + ", inquiry_context=" + inquiry_context + ", inquiry_private="
        + inquiry_private + ", inquiry_regdate=" + inquiry_regdate + ", ansDto=" + ansDto + "]";
  }
    
    
  
  
    
}
