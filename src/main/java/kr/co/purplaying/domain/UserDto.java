package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Objects;

public class UserDto {
  
  private Integer user_no;
  private String user_id;
  private String user_pwd;
  private String user_name;
  private String user_phone;
  private Date user_regdate;
  private int user_active;
  private int user_role;
  
  
  
  public Integer getUser_no() {
    return user_no;
  }

  public void setUser_no(Integer user_no) {
    this.user_no = user_no;
  }

  public String getUser_id() {
    return user_id;
  }
  
  public void setUser_id(String user_id) {
    this.user_id = user_id;
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
  
  public String getUser_phone() {
    return user_phone;
  }
  
  public void setUser_phone(String user_phone) {
    this.user_phone = user_phone;
  }
  
  public Date getUser_regdate() {
    return user_regdate;
  }
  
  public void setUser_regdate(Date user_regdate) {
    this.user_regdate = user_regdate;
  }
  
  public int getUser_active() {
    return user_active;
  }
  
  public void setUser_active(int user_active) {
    this.user_active = user_active;
  }
  
  public int getUser_role() {
    return user_role;
  }
  
  public void setUser_role(int user_role) {
    this.user_role = user_role;
  }
  
  public UserDto() {
    this("","",0);
  }
  
  
  public UserDto(String user_id, String user_pwd, int user_role) {
    //super();
    this.user_id = user_id;
    this.user_pwd = user_pwd;
    this.user_role = user_role;
  }

  @Override
  public int hashCode() {
    return Objects.hash(user_id, user_no, user_pwd, user_role);
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    UserDto other = (UserDto) obj;
    return Objects.equals(user_id, other.user_id) && user_no == other.user_no
        && Objects.equals(user_pwd, other.user_pwd) && user_role == other.user_role;
  }
  
  
  
  
  
}
