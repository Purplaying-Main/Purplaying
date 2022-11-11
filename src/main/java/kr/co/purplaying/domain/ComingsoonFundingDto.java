package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Objects;

public class ComingsoonFundingDto {
  private int prdt_id;
  private int prdt_gerne;
  private String prdt_name;
  private Date prdt_opendate;
  private int prdt_comingday;
  
  public ComingsoonFundingDto() {
    // TODO Auto-generated constructor stub
  }

  public ComingsoonFundingDto(int prdt_id, int prdt_gerne, String prdt_name) {
    super();
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
    ComingsoonFundingDto other = (ComingsoonFundingDto) obj;
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

  public int getPrdt_comingday() {
    return prdt_comingday;
  }

  public void setPrdt_comingday(int prdt_comingday) {
    this.prdt_comingday = prdt_comingday;
  }

  @Override
  public String toString() {
    return "ComingsoonFundingDto [prdt_gerne=" + prdt_gerne + ", prdt_name=" + prdt_name + ", prdt_comingday="
        + prdt_comingday + "]";
  }
  
}
