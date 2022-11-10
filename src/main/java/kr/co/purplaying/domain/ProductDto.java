package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Objects;

public class ProductDto {
  
  private Integer product_id;
  private String user_id;
  private Integer genre_code;
  private String product_name;
  private Date product_regdate;
  private Date product_startdate;
  private Date product_enddate;
  private int product_goal;
  private String product_content;
  private int product_funded;
  private int product_buycount;
  
  public ProductDto() {
      this("","","");  
  }
  
  public ProductDto(String user_id, String product_name, String product_content) {
    this.user_id = user_id;
    this.product_name = product_name;
    this.product_content = product_content;
  }

  @Override
  public int hashCode() {
    return Objects.hash(product_content, product_id, product_name, user_id);
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
    return Objects.equals(product_content, other.product_content) && product_id == other.product_id
        && Objects.equals(product_name, other.product_name) && Objects.equals(user_id, other.user_id);
  }

  public Integer getProduct_id() {
    return product_id;
  }

  public void setProduct_id(Integer product_id) {
    this.product_id = product_id;
  }

  public String getUser_id() {
    return user_id;
  }

  public void setUser_id(String user_id) {
    this.user_id = user_id;
  }

  public Integer getGenre_code() {
    return genre_code;
  }

  public void setGenre_code(Integer genre_code) {
    this.genre_code = genre_code;
  }

  public String getProduct_name() {
    return product_name;
  }

  public void setProduct_name(String product_name) {
    this.product_name = product_name;
  }

  public Date getProduct_regdate() {
    return product_regdate;
  }

  public void setProduct_regdate(Date product_regdate) {
    this.product_regdate = product_regdate;
  }

  public Date getProduct_startdate() {
    return product_startdate;
  }

  public void setProduct_startdate(Date product_startdate) {
    this.product_startdate = product_startdate;
  }

  public Date getProduct_enddate() {
    return product_enddate;
  }

  public void setProduct_enddate(Date product_enddate) {
    this.product_enddate = product_enddate;
  }

  public int getProduct_goal() {
    return product_goal;
  }

  public void setProduct_goal(int product_goal) {
    this.product_goal = product_goal;
  }

  public String getProduct_content() {
    return product_content;
  }

  public void setProduct_content(String product_content) {
    this.product_content = product_content;
  }

  public int getProduct_funded() {
    return product_funded;
  }

  public void setProduct_funded(int product_funded) {
    this.product_funded = product_funded;
  }

  public int getProduct_buycount() {
    return product_buycount;
  }

  public void setProduct_buycount(int product_buycount) {
    this.product_buycount = product_buycount;
  }

  @Override
  public String toString() {
    return "ProductDto [product_id=" + product_id + ", user_id=" + user_id + ", genre_code=" + genre_code
        + ", product_name=" + product_name + ", product_regdate=" + product_regdate + ", product_startdate="
        + product_startdate + ", product_enddate=" + product_enddate + ", product_goal=" + product_goal
        + ", product_content=" + product_content + ", product_funded=" + product_funded + ", product_buycount="
        + product_buycount + "]";
  }
  
  
  
}