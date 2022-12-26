package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Objects;

public class GenreDto {
  private int prdt_id;
  private int prdt_genre;
  private String prdt_name;
  private Date prdt_opendate;
  private Date prdt_enddate;
  private int prdt_goal;
  private int prdt_currenttotal;
  private int prdt_percent;
  private int prdt_dday;
  private Order order;
  
  public GenreDto() {
    // TODO Auto-generated constructor stub
  }
  

  public GenreDto(int prdt_id, int prdt_genre, String prdt_name) {
    super();
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
    GenreDto other = (GenreDto) obj;
    return prdt_genre == other.prdt_genre && prdt_id == other.prdt_id && Objects.equals(prdt_name, other.prdt_name);
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
    return "GenreDto [prdt_genre=" + prdt_genre + ", prdt_name=" + prdt_name + ", prdt_currenttotal="
        + prdt_currenttotal + ", prdt_percent=" + prdt_percent + ", prdt_dday=" + prdt_dday + "]";
  }


  public Order getOrder() {
    return order;
  }


  public void setOrder(Order order) {
    this.order = order;
  }

  
  
  
}
