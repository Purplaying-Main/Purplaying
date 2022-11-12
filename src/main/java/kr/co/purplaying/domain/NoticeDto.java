package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Objects;

public class NoticeDto{
  
	private Integer notice_id;
	private String writer; // user_id(email) FK
	private String notice_title;
	private String notice_context;
	private Date notice_regdate;
	private Integer notice_category;
	private boolean notice_private;
	private int view_cnt;

	
	public NoticeDto() {
		this("", "", "", 1, true);
	}


  public NoticeDto(String writer, String notice_title, String notice_context,
      Integer notice_category, boolean notice_private) {

    this.writer = writer;
    this.notice_title = notice_title;
    this.notice_context = notice_context;
    this.notice_category = notice_category;
    this.notice_private = notice_private;
    
  }

  @Override
  public int hashCode() {
    return Objects.hash(notice_category, notice_context, notice_id, notice_private, notice_title, writer);
  }


  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    NoticeDto other = (NoticeDto) obj;
    return Objects.equals(notice_category, other.notice_category)
        && Objects.equals(notice_context, other.notice_context) && Objects.equals(notice_id, other.notice_id)
        && notice_private == other.notice_private && Objects.equals(notice_title, other.notice_title)
        && Objects.equals(writer, other.writer);
  }


  @Override
  public String toString() {
    return "NoticeDto [notice_id=" + notice_id + ", writer=" + writer + ", notice_title=" + notice_title
        + ", notice_context=" + notice_context + ", notice_regdate=" + notice_regdate + ", notice_category="
        + notice_category + ", notice_private=" + notice_private + ", view_cnt=" + view_cnt + "]";
  }


  public Integer getNotice_id() {
    return notice_id;
  }


  public void setNotice_id(Integer notice_id) {
    this.notice_id = notice_id;
  }


  public String getWriter() {
    return writer;
  }


  public void setWriter(String writer) {
    this.writer = writer;
  }


  public String getNotice_title() {
    return notice_title;
  }


  public void setNotice_title(String notice_title) {
    this.notice_title = notice_title;
  }


  public String getNotice_context() {
    return notice_context;
  }


  public void setNotice_context(String notice_context) {
    this.notice_context = notice_context;
  }


  public Date getNotice_regdate() {
    return notice_regdate;
  }


  public void setNotice_regdate(Date notice_regdate) {
    this.notice_regdate = notice_regdate;
  }


  public Integer getNotice_category() {
    return notice_category;
  }


  public void setNotice_category(Integer notice_category) {
    this.notice_category = notice_category;
  }


  public boolean isNotice_private() {
    return notice_private;
  }


  public void setNotice_private(boolean notice_private) {
    this.notice_private = notice_private;
  }


  public int getView_cnt() {
    return view_cnt;
  }


  public void setView_cnt(int view_cnt) {
    this.view_cnt = view_cnt;
  }

	
}
