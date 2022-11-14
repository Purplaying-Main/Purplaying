package kr.co.purplaying.domain;

import java.util.Date;

public class CommunityDto {

  private int cmnt_rno;
  private String cmnt_content;
  private Date cmnt_regdate;
  private int product_id;
  private int user_no;
  private String cmnt_writer;

  public int getCmnt_rno() {
    return cmnt_rno;
  }

  public void setCmnt_rno(int cmnt_rno) {
    this.cmnt_rno = cmnt_rno;
  }

  public String getCmnt_content() {
    return cmnt_content;
  }

  public void setCmnt_content(String cmnt_content) {
    this.cmnt_content = cmnt_content;
  }

  public Date getCmnt_regdate() {
    return cmnt_regdate;
  }

  public void setCmnt_regdate(Date cmnt_regdate) {
    this.cmnt_regdate = cmnt_regdate;
  }

  public int getProduct_id() {
    return product_id;
  }

  public void setProduct_id(int product_id) {
    this.product_id = product_id;
  }

  public int getUser_no() {
    return user_no;
  }



  public String getCmnt_writer() {
    return cmnt_writer;
  }

  public void setCmnt_writer(String cmnt_writer) {
    this.cmnt_writer = cmnt_writer;
  }

  public void setUser_no(int user_no) {
    this.user_no = user_no;
  }

  @Override
  public String toString() {
    return "CommunityDto [cmnt_rno=" + cmnt_rno + ", cmnt_content=" + cmnt_content + ", cmnt_regdate=" + cmnt_regdate
        + ", product_id=" + product_id + ", user_no=" + user_no + ", cmnt_writer=" + cmnt_writer + "]";
  }

}