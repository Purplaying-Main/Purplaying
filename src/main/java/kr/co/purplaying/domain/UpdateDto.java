package kr.co.purplaying.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class UpdateDto {
  SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
  
  private int row_number;
  private int update_id;
  private Date update_regdate;
  private String update_title;
  private String update_desc;
  private String user_id;
  private int prdt_id;
  private String update_regdate_string;
  
  public UpdateDto() {
  }

 
  public UpdateDto(int update_id, Date update_regdate, String update_title, String update_desc, String user_id, int prdt_id) {
    this.update_id = update_id;
    this.update_regdate = update_regdate;
    this.update_title = update_title;
    this.update_desc = update_desc;
    this.user_id = user_id;
    this.prdt_id = prdt_id;
  }

  
  public int getRow_number() {
    return row_number;
  }

  public void setRow_number(int row_number) {
    this.row_number = row_number;
  }
  public String getUpdate_regdate_string() {
    return update_regdate_string;
  }

  public void setUpdate_regdate_string(Date update_regdate) {
    this.update_regdate_string = format.format(update_regdate);
  }

  public int getUpdate_id() {
    return update_id;
  }

  public void setUpdate_id(int update_id) {
    this.update_id = update_id;
  }

  public Date getUpdate_regdate() {
    return update_regdate;
  }

  public void setUpdate_regdate(Date update_regdate) {
    this.update_regdate = update_regdate;
  }

  public String getUpdate_title() {
    return update_title;
  }

  public void setUpdate_title(String update_title) {
    this.update_title = update_title;
  }

  public String getUpdate_desc() {
    return update_desc;
  }

  public void setUpdate_desc(String update_desc) {
    this.update_desc = update_desc;
  }

  public String getUser_id() {
    return user_id;
  }

  public void setUser_id(String user_id) {
    this.user_id = user_id;
  }

  public int getPrdt_id() {
    return prdt_id;
  }

  public void setPrdt_id(int prdt_id) {
    this.prdt_id = prdt_id;
  }


  @Override
  public String toString() {
    return "UpdateDto [row_number=" + row_number + ", update_id=" + update_id + ", update_regdate=" + update_regdate
        + ", update_title=" + update_title + ", update_desc=" + update_desc + ", user_id=" + user_id + ", prdt_id="
        + prdt_id + ", update_regdate_string=" + update_regdate_string + "]";
  }



}
