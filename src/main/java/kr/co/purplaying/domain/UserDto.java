package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Objects;

public class UserDto {
	private String user_id;
	private String pwd;
	private String name;
	private String email;
	private Date birth;
	private String sns;
	private Date reg_date;
	
	
	public UserDto() {
		// TODO Auto-generated constructor stub
	}


	public UserDto(String user_id, String pwd, String name, String email, Date birth, String sns, Date reg_date) {
		//super();
		this.user_id = user_id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.birth = birth;
		this.sns = sns;
		this.reg_date = reg_date;
	}


	


	@Override
	public int hashCode() {
		return Objects.hash(birth, email, user_id, name, pwd, reg_date, sns);
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
		return Objects.equals(birth, other.birth) && Objects.equals(email, other.email) && Objects.equals(user_id, other.user_id)
				&& Objects.equals(name, other.name) && Objects.equals(pwd, other.pwd)
				&& Objects.equals(reg_date, other.reg_date) && Objects.equals(sns, other.sns);
	}


	public String getUser_Id() {
		return user_id;
	}


	public void setUser_Id(String User_id) {
		this.user_id = user_id;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getBirth() {
		return birth;
	}


	public void setBirth(Date birth) {
		this.birth = birth;
	}


	public String getSns() {
		return sns;
	}


	public void setSns(String sns) {
		this.sns = sns;
	}


	public Date getReg_date() {
		return reg_date;
	}


	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}


	@Override
	public String toString() {
		return "User [user=" + user_id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", birth=" + birth + ", sns="
				+ sns + ", reg_date=" + reg_date + "]";
	}



	
	
}
