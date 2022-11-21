package kr.co.purplaying.domain;

import java.util.Objects;

public class AddressDto {

  private Integer address_id;
  private String address_name;
  private String address_num;
  private String address;
  private String address_detail;
  private String receiver_phonenum;
  private String receiver_name;
  private boolean default_address;
  private Integer user_no;
  
  public AddressDto() {
    this(0, "", "", "", "", "", "", false, 0);
  }
  
  public AddressDto(Integer address_id, String address_name, String address_num, String address, String address_detail, 
      String receiver_phonenum, String receiver_name, boolean default_address, Integer user_no) {
    this.address_id = address_id;
    this.address_name = address_name;
    this.address_num = address_num;
    this.address = address;
    this.address_detail = address_detail;
    this.receiver_phonenum = receiver_phonenum;
    this.receiver_name = receiver_name;
    this.default_address = default_address;
  }
  
  @Override
  public int hashCode() {
    return Objects.hash(address, address_id, address_num, user_no);
  }
  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    AddressDto other = (AddressDto) obj;
    return Objects.equals(address, other.address) && address_id == other.address_id
        && Objects.equals(address_num, other.address_num) && user_no == other.user_no;
  }
  
  
  
  public Integer getAddress_id() {
    return address_id;
  }
  public void setAddress_id(Integer address_id) {
    this.address_id = address_id;
  }
  public String getAddress_name() {
    return address_name;
  }
  public void setAddress_name(String address_name) {
    this.address_name = address_name;
  }
  public String getAddress_num() {
    return address_num;
  }
  public void setAddress_num(String address_num) {
    this.address_num = address_num;
  }
  public String getAddress() {
    return address;
  }
  public void setAddress(String address) {
    this.address = address;
  }
  public String getAddress_detail() {
    return address_detail;
  }
  public void setAddress_detail(String address_detail) {
    this.address_detail = address_detail;
  }
  public String getreceiver_phonenum() {
    return receiver_phonenum;
  }
  public void setreceiver_phonenum(String receiver_phonenum) {
    this.receiver_phonenum = receiver_phonenum;
  }
  public String getreceiver_name() {
    return receiver_name;
  }
  public void setreceiver_name(String receiver_name) {
    this.receiver_name = receiver_name;
  }
  public boolean isDefault_address() {
    return default_address;
  }
  public void setDefault_address(boolean default_address) {
    this.default_address = default_address;
  }
  public Integer getUser_no() {
    return user_no;
  }
  public void setUser_no(Integer user_no) {
    this.user_no = user_no;
  }
  
  
  
}
