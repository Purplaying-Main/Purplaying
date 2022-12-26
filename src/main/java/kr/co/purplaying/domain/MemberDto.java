package kr.co.purplaying.domain;

import java.util.Date;

public class MemberDto {

//  private UserDto userDto;
//  private AgreementDto agreementDto;
//  
//  public MemberDto() {
//  }
//
//  public MemberDto(UserDto userDto, AgreementDto agreementDto) {
//    this.userDto = userDto;
//    this.agreementDto = agreementDto;
//  }
//
//  public UserDto getUserDto() {
//    return userDto;
//  }
//
//  public void setUserDto(UserDto userDto) {
//    this.userDto = userDto;
//  }
//
//  public AgreementDto getAgreementDto() {
//    return agreementDto;
//  }
//
//  public void setAgreementDto(AgreementDto agreementDto) {
//    this.agreementDto = agreementDto;
//  }
  
  private int user_no;
  private String user_id;
  private String user_pwd;
  private String user_name;
  private String user_nickname;
  private String user_phone;
  private Date user_regdate;
  private int user_active;
  private int user_role;
  private boolean agree_age;
  private boolean agree_terms;
  private boolean agree_inform;
  private boolean agree_inform_third;
  private boolean agree_marketing;
  
  
  

  public MemberDto() {
    
  }
  
  public MemberDto( String user_id, String user_pwd, String user_name, String user_nickname, String user_phone, boolean agree_age, boolean agree_terms, boolean agree_inform,
      boolean agree_inform_third, boolean agree_marketing) {
    this.user_id = user_id;
    this.user_pwd = user_pwd;
    this.user_name = user_name;
    this.user_nickname = user_nickname;
    this.user_phone = user_phone;
    this.agree_age = agree_age;
    this.agree_terms = agree_terms;
    this.agree_inform = agree_inform;
    this.agree_inform_third = agree_inform_third;
    this.agree_marketing = agree_marketing;
  }

  public MemberDto(int user_no, String user_id, String user_pwd, String user_name, String user_nickname, String user_phone, boolean agree_age, boolean agree_terms, boolean agree_inform,
      boolean agree_inform_third, boolean agree_marketing) {
    this.user_no = user_no;
    this.user_id = user_id;
    this.user_pwd = user_pwd;
    this.user_name = user_name;
    this.user_nickname = user_nickname;
    this.user_phone = user_phone;
    this.agree_age = agree_age;
    this.agree_terms = agree_terms;
    this.agree_inform = agree_inform;
    this.agree_inform_third = agree_inform_third;
    this.agree_marketing = agree_marketing;
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

  public String getUser_nickname() {
    return user_nickname;
  }


  public void setUser_nickname(String user_nickname) {
    this.user_nickname = user_nickname;
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


  public boolean isAgree_age() {
    return agree_age;
  }


  public void setAgree_age(boolean agree_age) {
    this.agree_age = agree_age;
  }


  public boolean isAgree_terms() {
    return agree_terms;
  }


  public void setAgree_terms(boolean agree_terms) {
    this.agree_terms = agree_terms;
  }


  public boolean isAgree_inform() {
    return agree_inform;
  }


  public void setAgree_inform(boolean agree_inform) {
    this.agree_inform = agree_inform;
  }


  public boolean isAgree_inform_third() {
    return agree_inform_third;
  }


  public void setAgree_inform_third(boolean agree_inform_third) {
    this.agree_inform_third = agree_inform_third;
  }


  public boolean isAgree_marketing() {
    return agree_marketing;
  }


  public void setAgree_marketing(boolean agree_marketing) {
    this.agree_marketing = agree_marketing;
  }

}
