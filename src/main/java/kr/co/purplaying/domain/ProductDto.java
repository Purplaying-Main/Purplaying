package kr.co.purplaying.domain;

import java.util.Date;

public class ProductDto {

  private Integer prdt_id;
  private Integer prdt_genre;
  private String prdt_name;
  private String prdt_desc;
  private String prdt_desc_detail;
  private Date prdt_regdate;
  private Date prdt_opendate;
  private Date prdt_enddate;
  private Integer prdt_goal;
  private Integer prdt_currenttotal;
  private Integer prdt_open;
  private String prdt_desc_policy;
  private Integer user_id;
  
  
  
  public ProductDto(Integer prdt_id, Integer prdt_genre, String prdt_name, String prdt_desc, String prdt_desc_detail,
      Date prdt_regdate, Date prdt_opendate, Date prdt_enddate, Integer prdt_goal, Integer prdt_currenttotal,
      Integer prdt_open, String prdt_desc_policy, Integer user_id) {
    //super();
    this.prdt_id = prdt_id;
    this.prdt_genre = prdt_genre;
    this.prdt_name = prdt_name;
    this.prdt_desc = prdt_desc;
    this.prdt_desc_detail = prdt_desc_detail;
    this.prdt_regdate = prdt_regdate;
    this.prdt_opendate = prdt_opendate;
    this.prdt_enddate = prdt_enddate;
    this.prdt_goal = prdt_goal;
    this.prdt_currenttotal = prdt_currenttotal;
    this.prdt_open = prdt_open;
    this.prdt_desc_policy = prdt_desc_policy;
    this.user_id = user_id;
  }

  public Integer getPrdt_id() {
    return prdt_id;
  }

  public void setPrdt_id(Integer prdt_id) {
    this.prdt_id = prdt_id;
  }

  public Integer getPrdt_genre() {
    return prdt_genre;
  }

  public void setPrdt_genre(Integer prdt_genre) {
    this.prdt_genre = prdt_genre;
  }

  public String getPrdt_name() {
    return prdt_name;
  }

  public void setPrdt_name(String prdt_name) {
    this.prdt_name = prdt_name;
  }

  public String getPrdt_desc() {
    return prdt_desc;
  }

  public void setPrdt_desc(String prdt_desc) {
    this.prdt_desc = prdt_desc;
  }

  public String getPrdt_desc_detail() {
    return prdt_desc_detail;
  }

  public void setPrdt_desc_detail(String prdt_desc_detail) {
    this.prdt_desc_detail = prdt_desc_detail;
  }

  public Date getPrdt_regdate() {
    return prdt_regdate;
  }

  public void setPrdt_regdate(Date prdt_regdate) {
    this.prdt_regdate = prdt_regdate;
  }

  public Date getPrdt_opendate() {
    return prdt_opendate;
  }

  public void setPrdt_opendate(Date prdt_opendate) {
    this.prdt_opendate = prdt_opendate;
  }

  public Date getPrdt_enddate() {
    return prdt_enddate;
  }

  public void setPrdt_enddate(Date prdt_enddate) {
    this.prdt_enddate = prdt_enddate;
  }

  public Integer getPrdt_goal() {
    return prdt_goal;
  }

  public void setPrdt_goal(Integer prdt_goal) {
    this.prdt_goal = prdt_goal;
  }

  public Integer getPrdt_currenttotal() {
    return prdt_currenttotal;
  }

  public void setPrdt_currenttotal(Integer prdt_currenttotal) {
    this.prdt_currenttotal = prdt_currenttotal;
  }

  public Integer isPrdt_open() {
    return prdt_open;
  }

  public void setPrdt_open(Integer prdt_open) {
    this.prdt_open = prdt_open;
  }

  public String getPrdt_desc_policy() {
    return prdt_desc_policy;
  }

  public void setPrdt_desc_policy(String prdt_desc_policy) {
    this.prdt_desc_policy = prdt_desc_policy;
  }

  public Integer getUser_id() {
    return user_id;
  }

  public void setUser_id(Integer user_id) {
    this.user_id = user_id;
  }

  @Override
  public String toString() {
    return "ProductDto [prdt_id=" + prdt_id + ", prdt_genre=" + prdt_genre + ", prdt_name=" + prdt_name + ", prdt_desc="
        + prdt_desc + ", prdt_desc_detail=" + prdt_desc_detail + ", prdt_regdate=" + prdt_regdate + ", prdt_opendate="
        + prdt_opendate + ", prdt_enddate=" + prdt_enddate + ", prdt_goal=" + prdt_goal + ", prdt_currenttotal="
        + prdt_currenttotal + ", prdt_open=" + prdt_open + ", prdt_desc_policy=" + prdt_desc_policy + ", user_id="
        + user_id + "]";
  }
  
  
  
}
