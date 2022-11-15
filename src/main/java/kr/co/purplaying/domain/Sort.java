package kr.co.purplaying.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class Sort {
  private String sort = "";
  
  public Sort() {
    // TODO Auto-generated constructor stub
  }
  
  public String getQuery() {
    return getQuery(sort);
  }
  
  public String getQuery(String sort) {
    return UriComponentsBuilder.newInstance().queryParam("sort", sort).build().toString();
  }


  public Sort(String sort) {
    //super();
    this.sort = sort;
  }

  @Override
  public String toString() {
    return "Sort [sort=" + sort + "]";
  }
  
  
}
