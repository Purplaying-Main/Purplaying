package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Objects;

public class ProductDetailDto {

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
  private int prdt_user_no;
  private int prdt_dday;
  private int prdt_percent;
  private Date prdt_purchaseday;
  private Date prdt_limitday;
  private int user_no;
  private String user_id;
  private String user_pwd;
  private String user_name;
  private int user_phone;
  private Date user_regdate;
  private String user_activate;
  private String user_role;
  
  public ProductDetailDto() {
    // TODO Auto-generated constructor stub
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

  public int getPrdt_genre() {
    return prdt_genre;
  }

  public void setPrdt_genre(int prdt_genre) {
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

  public int getPrdt_open() {
    return prdt_open;
  }

  public void setPrdt_open(int prdt_open) {
    this.prdt_open = prdt_open;
  }

  public String getPrdt_desc_policy() {
    return prdt_desc_policy;
  }

  public void setPrdt_desc_policy(String prdt_desc_policy) {
    this.prdt_desc_policy = prdt_desc_policy;
  }

  public int getPrdt_user_no() {
    return prdt_user_no;
  }

  public void setPrdt_user_no(int prdt_user_no) {
    this.prdt_user_no = prdt_user_no;
  }

  public int getPrdt_dday() {
    return prdt_dday;
  }

  public void setPrdt_dday(int prdt_dday) {
    this.prdt_dday = prdt_dday;
  }

  public int getPrdt_percent() {
    return prdt_percent;
  }

  public void setPrdt_percent(int prdt_percent) {
    this.prdt_percent = prdt_percent;
  }

  public Date getPrdt_purchaseday() {
    return prdt_purchaseday;
  }

  public void setPrdt_purchaseday(Date prdt_purchaseday) {
    this.prdt_purchaseday = prdt_purchaseday;
  }

  public Date getPrdt_limitday() {
    return prdt_limitday;
  }

  public void setPrdt_limitday(Date prdt_limitday) {
    this.prdt_limitday = prdt_limitday;
  }

  public int getUser_no() {
    return user_no;
  }

  public void setUser_no(int user_no) {
    this.user_no = user_no;
  }

  public String getUser_pwd() {
    return user_pwd;
  }

  public void setUser_pwd(String user_pwd) {
    this.user_pwd = user_pwd;
  }

  public String getUser_name() {
    return user_name;
  }

  public void setUser_name(String user_name) {
    this.user_name = user_name;
  }

  public int getUser_phone() {
    return user_phone;
  }

  public void setUser_phone(int user_phone) {
    this.user_phone = user_phone;
  }

  public Date getUser_regdate() {
    return user_regdate;
  }

  public void setUser_regdate(Date user_regdate) {
    this.user_regdate = user_regdate;
  }

  public String getUser_activate() {
    return user_activate;
  }

  public void setUser_activate(String user_activate) {
    this.user_activate = user_activate;
  }

  public String getUser_role() {
    return user_role;
  }

  public void setUser_role(String user_role) {
    this.user_role = user_role;
  }

  @Override
  public int hashCode() {
    return Objects.hash(prdt_id, prdt_user_no, user_no);
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    ProductDetailDto other = (ProductDetailDto) obj;
    return prdt_id == other.prdt_id && prdt_user_no == other.prdt_user_no && user_no == other.user_no;
  }

  @Override
  public String toString() {
    return "ProductDetailDto [prdt_id=" + prdt_id + ", prdt_genre=" + prdt_genre + ", prdt_name=" + prdt_name + ", prdt_desc="
        + prdt_desc + ", prdt_desc_detail=" + prdt_desc_detail + ", prdt_regdate=" + prdt_regdate + ", prdt_opendate="
        + prdt_opendate + ", prdt_enddate=" + prdt_enddate + ", prdt_goal=" + prdt_goal + ", prdt_currenttotal="
        + prdt_currenttotal + ", prdt_open=" + prdt_open + ", prdt_desc_policy=" + prdt_desc_policy + ", prdt_user_no="
        + prdt_user_no + ", prdt_dday=" + prdt_dday + ", prdt_percent=" + prdt_percent + ", prdt_purchaseday="
        + prdt_purchaseday + ", prdt_limitday=" + prdt_limitday + ", user_no=" + user_no + ", user_pwd=" + user_pwd
        + ", user_name=" + user_name + ", user_phone=" + user_phone + ", user_regdate=" + user_regdate
        + ", user_activate=" + user_activate + ", user_role=" + user_role + "]";
  }

  public ProductDetailDto(int prdt_id, int prdt_genre, String prdt_name, String prdt_desc, String prdt_desc_detail,
      Date prdt_regdate, Date prdt_opendate, Date prdt_enddate, int prdt_goal, int prdt_currenttotal, int prdt_open,
      String prdt_desc_policy, int prdt_user_no, int prdt_dday, int prdt_percent, Date prdt_purchaseday,
      Date prdt_limitday, int user_no, String user_pwd, String user_name, int user_phone, Date user_regdate,
      String user_activate, String user_role, String user_id) {
    super();
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
    this.prdt_user_no = prdt_user_no;
    this.prdt_dday = prdt_dday;
    this.prdt_percent = prdt_percent;
    this.prdt_purchaseday = prdt_purchaseday;
    this.prdt_limitday = prdt_limitday;
    this.user_no = user_no;
    this.user_id = user_id;
    this.user_pwd = user_pwd;
    this.user_name = user_name;
    this.user_phone = user_phone;
    this.user_regdate = user_regdate;
    this.user_activate = user_activate;
    this.user_role = user_role;
  }

  
  
}