package kr.co.purplaying.domain;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

public class ProjectDto {
  
  private String writer;
  private int product_id;
  private String  prdt_title;
  private String  prdt_desc;
  private String  prdt_desc_detail;
  private Date    prdt_regdate;
  private Date    prdt_opendate;
  private Date    prdt_enddate;
  private int     prdt_goal;
  private int     prdt_currenttotal;
  private boolean prdt_open;
  private String  prdt_desc_policy;
  private int     prdt_cate;
  private String  prdt_thumbnail;
  
  static DateFormat prjDate = new SimpleDateFormat("yyyy-MM-dd");
  
//  public ProjectDto() throws ParseException {
//    this("", "", "", "", prjDate.parse("yyyy-MM-dd"), prjDate.parse("yyyy-MM-dd"), 500000, true,"", 0, "");
// 
//  }
  public ProjectDto(){
    this("", "", "", "", null, null, 0, false, "", 0, "");
  }

  public ProjectDto(String writer, String prdt_title, String prdt_desc, String prdt_desc_detail, Date prdt_opendate,
      Date prdt_enddate, int prdt_goal, boolean prdt_open, String prdt_desc_policy, int prdt_cate, String  prdt_thumbnail) {
//    super();
    this.writer = writer;
    this.prdt_title = prdt_title;
    this.prdt_desc = prdt_desc;
    this.prdt_desc_detail = prdt_desc_detail;
    this.prdt_opendate = prdt_opendate;
    this.prdt_enddate = prdt_enddate;
    this.prdt_goal = prdt_goal;
    this.prdt_open = prdt_open;
    this.prdt_desc_policy = prdt_desc_policy;
    this.prdt_cate = prdt_cate;
    this.prdt_thumbnail = prdt_thumbnail;
  }

  @Override
  public int hashCode() {
    return Objects.hash(prdt_currenttotal, prdt_desc, prdt_desc_detail, prdt_desc_policy, prdt_enddate, prdt_goal,
        prdt_title, prdt_open, prdt_opendate, prdt_regdate, product_id, writer, prdt_cate, prdt_thumbnail);
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
    return prdt_currenttotal == other.prdt_currenttotal && Objects.equals(prdt_desc, other.prdt_desc)
        && Objects.equals(prdt_desc_detail, other.prdt_desc_detail)
        && Objects.equals(prdt_desc_policy, other.prdt_desc_policy) && Objects.equals(prdt_enddate, other.prdt_enddate)
        && prdt_goal == other.prdt_goal && Objects.equals(prdt_title, other.prdt_title) && prdt_open == other.prdt_open
        && Objects.equals(prdt_opendate, other.prdt_opendate) && Objects.equals(prdt_regdate, other.prdt_regdate)
        && product_id == other.product_id && Objects.equals(writer, other.writer) 
        && Objects.equals(prdt_cate, other.prdt_cate) && Objects.equals(prdt_thumbnail, other.prdt_thumbnail);
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

  public String getPrdt_title() {
    return prdt_title;
  }

  public void setPrdt_title(String prdt_title) {
    this.prdt_title = prdt_title;
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

  public int getPrdt_cate() {
    return prdt_cate;
  }

  public void setPrdt_cate(int prdt_cate) {
    this.prdt_cate = prdt_cate;
  }

  public String getPrdt_thumbnail() {
    return prdt_thumbnail;
  }

  public void setPrdt_thumbnail(String prdt_thumbnail) {
    this.prdt_thumbnail = prdt_thumbnail;
  }
  
  
  
  
  
  
  
}
