package kr.co.purplaying;

import java.util.Date;
import java.util.Objects;

public class UserDto {

  private Integer user_no;
  private String user_id;
  private String user_pwd;
  private String user_name;
  private String user_phone;
  private Date user_regdate;
  private char user_activate;
  private Integer user_role;
  
  public UserDto() {
    this("", "", "");
  }

  public UserDto(String user_id, String user_pwd, String user_name) {
    this.user_id = user_id;
    this.user_pwd = user_pwd;
    this.user_name = user_name;
  }

  @Override
  public int hashCode() {
    return Objects.hash(user_id, user_name, user_no, user_phone);
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
    return Objects.equals(user_id, other.user_id) && Objects.equals(user_name, other.user_name)
        && Objects.equals(user_no, other.user_no) && Objects.equals(user_phone, other.user_phone);
  }

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

  public char getUser_activate() {
    return user_activate;
  }

  public void setUser_activate(char user_activate) {
    this.user_activate = user_activate;
  }

  public Integer getUser_role() {
    return user_role;
  }

  public void setUser_role(Integer user_role) {
    this.user_role = user_role;
  }

  @Override
  public String toString() {
    return "UserDto [user_no=" + user_no + ", user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name="
        + user_name + ", user_phone=" + user_phone + ", user_regdate=" + user_regdate + ", user_activate="
        + user_activate + ", user_role=" + user_role + "]";
  }
  
}
