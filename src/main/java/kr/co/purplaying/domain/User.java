package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Objects;

public class User {
    private String user_id;
    private String user_pwd;
    private String user_name;
    private String user_phone;
    private Date user_regdate;
    private int user_active;
    private int user_role;
	
	
	public User() {
		// TODO Auto-generated constructor stub
	}


  public User(String user_id, String user_pwd, String user_name, String user_phone, Date user_regdate, int user_active,
      int user_role) {
    super();
    this.user_id = user_id;
    this.user_pwd = user_pwd;
    this.user_name = user_name;
    this.user_phone = user_phone;
    this.user_regdate = user_regdate;
    this.user_active = user_active;
    this.user_role = user_role;
  }


  @Override
  public int hashCode() {
    return Objects.hash(user_active, user_id, user_name, user_phone, user_pwd, user_regdate, user_role);
  }


  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    User other = (User) obj;
    return user_active == other.user_active && Objects.equals(user_id, other.user_id)
        && Objects.equals(user_name, other.user_name) && Objects.equals(user_phone, other.user_phone)
        && Objects.equals(user_pwd, other.user_pwd) && Objects.equals(user_regdate, other.user_regdate)
        && user_role == other.user_role;
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


  @Override
  public String toString() {
    return "User [user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name=" + user_name + ", user_phone="
        + user_phone + ", user_regdate=" + user_regdate + ", user_active=" + user_active + ", user_role=" + user_role
        + "]";
  }
	
	
	

	
	
}
