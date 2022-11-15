package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Objects;

public class ProductDto {

  private int prdt_id;
  private int prdt_genre;
  private String prdt_name;
  private String prdt_desc;
  private String prdt_desc_detail;
  private Date prdt_regdate;
  private Date prdt_opendate;
  private Date prdt_enddate;
  private int prdt_goal;
  private int prdt_currenttotal;
  private int prdt_open;
  private String prdt_desc_policy;
  private int user_id;
  
  public ProductDto() {
    // TODO Auto-generated constructor stub
  }

  
  public ProductDto(int prdt_id, int prdt_genre, String prdt_name) {
    //super();
    this.prdt_id = prdt_id;
    this.prdt_genre = prdt_genre;
    this.prdt_name = prdt_name;
  }


  @Override
  public int hashCode() {
    return Objects.hash(prdt_genre, prdt_id, prdt_name);
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    ProductDto other = (ProductDto) obj;
    return prdt_genre == other.prdt_genre && prdt_id == other.prdt_id && Objects.equals(prdt_name, other.prdt_name);
  }

  public final int getPrdt_id() {
    return prdt_id;
  }

  public final void setPrdt_id(int prdt_id) {
    this.prdt_id = prdt_id;
  }

  public final int getPrdt_genre() {
    return prdt_genre;
  }

  public final void setPrdt_genre(int prdt_genre) {
    this.prdt_genre = prdt_genre;
  }

  public final String getPrdt_name() {
    return prdt_name;
  }

  public final void setPrdt_name(String prdt_name) {
    this.prdt_name = prdt_name;
  }

  public final String getPrdt_desc() {
    return prdt_desc;
  }

  public final void setPrdt_desc(String prdt_desc) {
    this.prdt_desc = prdt_desc;
  }

  public final String getPrdt_desc_detail() {
    return prdt_desc_detail;
  }

  public final void setPrdt_desc_detail(String prdt_desc_detail) {
    this.prdt_desc_detail = prdt_desc_detail;
  }

  public final Date getPrdt_regdate() {
    return prdt_regdate;
  }

  public final void setPrdt_regdate(Date prdt_regdate) {
    this.prdt_regdate = prdt_regdate;
  }

  public final Date getPrdt_opendate() {
    return prdt_opendate;
  }

  public final void setPrdt_opendate(Date prdt_opendate) {
    this.prdt_opendate = prdt_opendate;
  }

  public final Date getPrdt_enddate() {
    return prdt_enddate;
  }

  public final void setPrdt_enddate(Date prdt_enddate) {
    this.prdt_enddate = prdt_enddate;
  }

  public final int getPrdt_goal() {
    return prdt_goal;
  }

  public final void setPrdt_goal(int prdt_goal) {
    this.prdt_goal = prdt_goal;
  }

  public final int getPrdt_currenttotal() {
    return prdt_currenttotal;
  }

  public final void setPrdt_currenttotal(int prdt_currenttotal) {
    this.prdt_currenttotal = prdt_currenttotal;
  }

  public final int getPrdt_open() {
    return prdt_open;
  }

  public final void setPrdt_open(int prdt_open) {
    this.prdt_open = prdt_open;
  }

  public final String getPrdt_desc_policy() {
    return prdt_desc_policy;
  }

  public final void setPrdt_desc_policy(String prdt_desc_policy) {
    this.prdt_desc_policy = prdt_desc_policy;
  }

  public final int getUser_id() {
    return user_id;
  }

  public final void setUser_id(int user_id) {
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
 
  