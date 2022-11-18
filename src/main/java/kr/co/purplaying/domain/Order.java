package kr.co.purplaying.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class Order {
  private String order = "";
  
  public Order() {
    // TODO Auto-generated constructor stub
  }
  
  public String getQuery() {
    return getQuery(order);
  }
  
  public String getQuery(String order) {
    return UriComponentsBuilder.newInstance().queryParam("order", order).build().toString();
  }


  public Order(String order) {
    //super();
    this.order = order;
  }

  @Override
  public String toString() {
    return "Order [order=" + order + "]";
  }
  
  
}
