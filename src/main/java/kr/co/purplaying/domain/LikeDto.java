package kr.co.purplaying.domain;

import java.util.Date;

public class LikeDto {
  private int like_id;
  private Date like_regdate;
  private String user_id;
  private int prdt_id;
   
  public LikeDto() {
    super();
  }

  public LikeDto(int like_id, Date like_regdate, String user_id, int prdt_id) {
    super();
    this.like_id = like_id;
    this.like_regdate = like_regdate;
    this.user_id = user_id;
    this.prdt_id = prdt_id;
  }
  
  public int getLike_id() {
    return like_id;
  }

  public void setLike_id(int like_id) {
    this.like_id = like_id;
  }

  public Date getLike_regdate() {
    return like_regdate;
  }

  public void setLike_regdate(Date like_regdate) {
    this.like_regdate = like_regdate;
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

  @Override
  public String toString() {
    return "LikeDto [like_id=" + like_id + ", like_regdate=" + like_regdate + ", user_id=" + user_id + ", prdt_id="
        + prdt_id + "]";
  }

  
  
}
