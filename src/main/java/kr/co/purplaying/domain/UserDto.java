package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Objects;

public class UserDto {
    private int user_no;
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_phone;
	private Date user_regdate;
	private int user_activate;
	private int user_role;
	
	public UserDto() {
		// TODO Auto-generated constructor stub
	}

	public UserDto(int user_no, String user_id, String user_pwd, String user_name, String user_phone, Date reg_date,
      int user_activate, int user_role) {
    //super();
    this.user_no = user_no;
    this.user_id = user_id;
    this.user_pwd = user_pwd;
    this.user_name = user_name;
    this.user_phone = user_phone;
    this.user_regdate = reg_date;
    this.user_activate = user_activate;
    this.user_role = user_role;
  }

  @Override
  public int hashCode() {
    return Objects.hash(user_id, user_no, user_pwd);
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
        && Objects.equals(user_pwd, other.user_pwd);
  }

  public int getUser_no() {
    return user_no;
  }

  public void setUser_no(int user_no) {
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

  public Date getReg_date() {
    return user_regdate;
  }

  public void setReg_date(Date reg_date) {
    this.user_regdate = reg_date;
  }

  public int getUser_activate() {
    return user_activate;
  }

  public void setUser_activate(int user_activate) {
    this.user_activate = user_activate;
  }

  public int getUser_role() {
    return user_role;
  }

  public void setUser_role(int user_role) {
    this.user_role = user_role;
  }

  @Override
  public String toString() {
    return "UserDto [user_no=" + user_no + ", user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name="
        + user_name + ", user_phone=" + user_phone + ", reg_date=" + user_regdate + ", user_activate=" + user_activate
        + ", user_role=" + user_role + "]";
  }

	
}
