package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Objects;

public class PopularFundingDto {
  private int prdt_id;
  private int prdt_gerne;
  private String prdt_name;
  private Date prdt_opendate;
  private Date prdt_enddate;
  private int prdt_goal;
  private int prdt_currenttotal;
  private int prdt_rank;
  private int prdt_percent;
  private int prdt_dday;
  
  public PopularFundingDto() {
    // TODO Auto-generated constructor stub
  }

  public PopularFundingDto(int prdt_id, int prdt_gerne, String prdt_name) {
    //super();
    this.prdt_id = prdt_id;
    this.prdt_gerne = prdt_gerne;
    this.prdt_name = prdt_name;
  }

  @Override
  public int hashCode() {
    return Objects.hash(prdt_gerne, prdt_id, prdt_name);
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    PopularFundingDto other = (PopularFundingDto) obj;
    return prdt_gerne == other.prdt_gerne && prdt_id == other.prdt_id && Objects.equals(prdt_name, other.prdt_name);
  }

  public int getPrdt_id() {
    return prdt_id;
  }

  public void setPrdt_id(int prdt_id) {
    this.prdt_id = prdt_id;
  }

  public int getPrdt_gerne() {
    return prdt_gerne;
  }

  public void setPrdt_gerne(int prdt_gerne) {
    this.prdt_gerne = prdt_gerne;
  }

  public String getPrdt_name() {
    return prdt_name;
  }

  public void setPrdt_name(String prdt_name) {
    this.prdt_name = prdt_name;
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

  public int getPrdt_rank() {
    return prdt_rank;
  }

  public void setPrdt_rank(int prdt_rank) {
    this.prdt_rank = prdt_rank;
  }

  public int getPrdt_percent() {
    return prdt_percent;
  }

  public void setPrdt_percent(int prdt_percent) {
    this.prdt_percent = prdt_percent;
  }

  public int getPrdt_dday() {
    return prdt_dday;
  }

  public void setPrdt_dday(int prdt_dday) {
    this.prdt_dday = prdt_dday;
  }

  @Override
  public String toString() {
    return "PopularFundingDto [prdt_gerne=" + prdt_gerne + ", prdt_name=" + prdt_name + ", prdt_currenttotal="
        + prdt_currenttotal + ", prdt_percent=" + prdt_percent + ", prdt_dday=" + prdt_dday + "]";
  }
  
  
}
