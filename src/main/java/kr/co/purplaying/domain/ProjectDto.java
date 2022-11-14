package kr.co.purplaying.domain;

import java.sql.Date;
import java.util.Objects;

public class ProjectDto {
  
  private String writer;
  private int product_id;
  private String  prdt_name;
  private String  prdt_desc;
  private String  prdt_desc_detail;
  private Date    prdt_regdate;
  private Date    prdt_opendate;
  private Date    prdt_enddate;
  private int     prdt_goal;
  private int     prdt_currenttotal;
  private boolean prdt_open;
  private String  prdt_desc_policy;
  
  
  public ProjectDto(String writer, String prdt_name, String prdt_desc, String prdt_desc_detail, Date prdt_opendate, Date prdt_enddate,
                    int prdt_goal, boolean prdt_open, String prdt_desc_policy) {
    
    this.writer = writer;
    this.prdt_name = prdt_name;
    this.prdt_desc = prdt_desc;
    this.prdt_desc_detail = prdt_desc_detail;
    this.prdt_opendate = prdt_opendate;
    this.prdt_enddate = prdt_enddate;
    this.prdt_goal = prdt_goal;
    this.prdt_open = prdt_open;
    this.prdt_desc_policy = prdt_desc_policy;
  }


  @Override
  public int hashCode() {
    return Objects.hash(prdt_desc, prdt_desc_detail, prdt_desc_policy, prdt_enddate, prdt_goal, prdt_name, prdt_open,
        prdt_opendate, product_id);
  }


  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    ProjectDto other = (ProjectDto) obj;
    return Objects.equals(prdt_desc, other.prdt_desc) && Objects.equals(prdt_desc_detail, other.prdt_desc_detail)
        && Objects.equals(prdt_desc_policy, other.prdt_desc_policy) && Objects.equals(prdt_enddate, other.prdt_enddate)
        && prdt_goal == other.prdt_goal && Objects.equals(prdt_name, other.prdt_name) && prdt_open == other.prdt_open
        && Objects.equals(prdt_opendate, other.prdt_opendate) && product_id == other.product_id;
  }

  
  public String getWriter() {
    return writer;
  }


  public void setWriter(String writer) {
    this.writer = writer;
  }


  public int getProduct_id() {
    return product_id;
  }


  public void setProduct_id(int product_id) {
    this.product_id = product_id;
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


  public int getPrdt_goal() {
    return prdt_goal;
  }


  public void setPrdt_goal(int prdt_goal) {
    this.prdt_goal = prdt_goal;
  }


  public int getPrdt_currenttotal() {
    return prdt_currenttotal;
  }


  public void setPrdt_currenttotal(int prdt_currenttotal) {
    this.prdt_currenttotal = prdt_currenttotal;
  }


  public boolean isPrdt_open() {
    return prdt_open;
  }


  public void setPrdt_open(boolean prdt_open) {
    this.prdt_open = prdt_open;
  }


  public String getPrdt_desc_policy() {
    return prdt_desc_policy;
  }


  public void setPrdt_desc_policy(String prdt_desc_policy) {
    this.prdt_desc_policy = prdt_desc_policy;
  }


  @Override
  public String toString() {
    return "ProjectDto [product_id=" + product_id + ", prdt_name=" + prdt_name + ", prdt_desc=" + prdt_desc
        + ", prdt_desc_detail=" + prdt_desc_detail + ", prdt_regdate=" + prdt_regdate + ", prdt_opendate="
        + prdt_opendate + ", prdt_enddate=" + prdt_enddate + ", prdt_goal=" + prdt_goal + ", prdt_currenttotal="
        + prdt_currenttotal + ", prdt_open=" + prdt_open + ", prdt_desc_policy=" + prdt_desc_policy + "]";
  }
  
  
  
  
  
  
}
