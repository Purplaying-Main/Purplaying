package kr.co.purplaying.domain;

import java.util.Date;

public class AlarmDto {
  private int alarm_no;
  private int alarm_cnt;
  private Date alarm_regdate;
  private int like_id;
  private String user_id;
  private int prdt_id;
  private int prdt_comingday;
  private int prdt_dday;
  private String prdt_thumbnail;
  private String prdt_name;
  
   
  public AlarmDto() {
    super();
  }

  public AlarmDto(int alarm_no, int alarm_cnt, Date alarm_regdate, int like_id, int prdt_id, String user_id, String prdt_thumbnail, String prdt_name) {
    super();
    this.alarm_no = alarm_no;
    this.alarm_cnt = alarm_cnt;
    this.alarm_regdate = alarm_regdate;
    this.like_id = like_id;
    this.prdt_id = prdt_id;
    this.user_id = user_id;
    this.prdt_thumbnail = prdt_thumbnail;
    this.prdt_name = prdt_name;
  }

  @Override
  public String toString() {
    return "AlarmDto [alarm_no=" + alarm_no + ", alarm_cnt=" + alarm_cnt + ", alarm_regdate=" + alarm_regdate
        + ", like_id=" + like_id + ", prdt_id=" + prdt_id + ", user_id=" + user_id+", prdt_thumbnail=" + prdt_thumbnail+", prdt_name=" + prdt_name+  "]";
  }

  public int getAlarm_no() {
    return alarm_no;
  }

  public void setAlarm_no(int alarm_no) {
    this.alarm_no = alarm_no;
  }

  public int getAlarm_cnt() {
    return alarm_cnt;
  }

  public void setAlarm_cnt(int alarm_cnt) {
    this.alarm_cnt = alarm_cnt;
  }

  public Date getAlarm_regdate() {
    return alarm_regdate;
  }

  public void setAlarm_regdate(Date alarm_regdate) {
    this.alarm_regdate = alarm_regdate;
  }

  public int getLike_id() {
    return like_id;
  }

  public void setLike_id(int like_id) {
    this.like_id = like_id;
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

  public int getPrdt_comingday() {
    return prdt_comingday;
  }

  public void setPrdt_comingday(int prdt_comingday) {
    this.prdt_comingday = prdt_comingday;
  }

  public int getPrdt_dday() {
    return prdt_dday;
  }

  public void setPrdt_dday(int prdt_dday) {
    this.prdt_dday = prdt_dday;
  }

  public String getPrdt_thumbnail() {
    return prdt_thumbnail;
  }

  public void setPrdt_thumbnail(String prdt_thumbnail) {
    this.prdt_thumbnail = prdt_thumbnail;
  }

  public String getPrdt_name() {
    return prdt_name;
  }

  public void setPrdt_name(String prdt_name) {
    this.prdt_name = prdt_name;
  }
  
  
  
}
