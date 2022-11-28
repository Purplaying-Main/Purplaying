package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Objects;

public class PaymentDto {
 private Integer pay_no;
 private Date pay_time;
 private String pay_cardnum;
 private int pay_carddate;
 private int pay_cvc;
 private int pay_pwd;
 private int pay_total;
 private int prdt_id;
 private int user_no;
 private String delivery_reciever;
 private String delivery_phone;
 private String delivery_postcode;
 private String delivery_address;
 private String delivery_addressdetail;
 private String delivery_memo;
 private int delivery_charge;
 
public PaymentDto() {
  // TODO Auto-generated constructor stub
}




public PaymentDto(Integer pay_no, Date pay_time, String pay_cardnum, int pay_carddate, int pay_cvc, int pay_pwd,
    int pay_total, int prdt_id, int user_no, String delivery_reciever, String delivery_phone, String delivery_postcode,
    String delivery_address, String delivery_addressdetail, String delivery_memo, int delivery_charge) {
  //super();
  this.pay_no = pay_no;
  this.pay_time = pay_time;
  this.pay_cardnum = pay_cardnum;
  this.pay_carddate = pay_carddate;
  this.pay_cvc = pay_cvc;
  this.pay_pwd = pay_pwd;
  this.pay_total = pay_total;
  this.prdt_id = prdt_id;
  this.user_no = user_no;
  this.delivery_reciever = delivery_reciever;
  this.delivery_phone = delivery_phone;
  this.delivery_postcode = delivery_postcode;
  this.delivery_address = delivery_address;
  this.delivery_addressdetail = delivery_addressdetail;
  this.delivery_memo = delivery_memo;
  this.delivery_charge = delivery_charge;
}




@Override
public String toString() {
  return "PaymentDto [pay_no=" + pay_no + ", pay_time=" + pay_time + ", pay_cardnum=" + pay_cardnum + ", pay_carddate="
      + pay_carddate + ", pay_cvc=" + pay_cvc + ", pay_pwd=" + pay_pwd + ", pay_total=" + pay_total + ", prdt_id="
      + prdt_id + ", user_no=" + user_no + ", delivery_reciever=" + delivery_reciever + ", delivery_phone="
      + delivery_phone + ", delivery_postcode=" + delivery_postcode + ", delivery_address=" + delivery_address
      + ", delivery_addressdetail=" + delivery_addressdetail + ", delivery_memo=" + delivery_memo + ", delivery_charge="
      + delivery_charge + "]";
}




@Override
public int hashCode() {
  return Objects.hash(pay_no, prdt_id, user_no);
}


@Override
public boolean equals(Object obj) {
  if (this == obj)
    return true;
  if (obj == null)
    return false;
  if (getClass() != obj.getClass())
    return false;
  PaymentDto other = (PaymentDto) obj;
  return Objects.equals(pay_no, other.pay_no) && prdt_id == other.prdt_id && user_no == other.user_no;
}



public Integer getPay_no() {
  return pay_no;
}



public void setPay_no(Integer pay_no) {
  this.pay_no = pay_no;
}



public Date getPay_time() {
  return pay_time;
}



public void setPay_time(Date pay_time) {
  this.pay_time = pay_time;
}



public String getPay_cardnum() {
  return pay_cardnum;
}



public void setPay_cardnum(String pay_cardnum) {
  this.pay_cardnum = pay_cardnum;
}



public int getPay_carddate() {
  return pay_carddate;
}



public void setPay_carddate(int pay_carddate) {
  this.pay_carddate = pay_carddate;
}



public int getPay_cvc() {
  return pay_cvc;
}



public void setPay_cvc(int pay_cvc) {
  this.pay_cvc = pay_cvc;
}



public int getPay_pwd() {
  return pay_pwd;
}



public void setPay_pwd(int pay_pwd) {
  this.pay_pwd = pay_pwd;
}



public int getPay_total() {
  return pay_total;
}



public void setPay_total(int pay_total) {
  this.pay_total = pay_total;
}



public int getPrdt_id() {
  return prdt_id;
}



public void setPrdt_id(int prdt_id) {
  this.prdt_id = prdt_id;
}



public int getUser_no() {
  return user_no;
}



public void setUser_no(int user_no) {
  this.user_no = user_no;
}



public String getDelivery_reciever() {
  return delivery_reciever;
}



public void setDelivery_reciever(String delivery_reciever) {
  this.delivery_reciever = delivery_reciever;
}



public String getDelivery_phone() {
  return delivery_phone;
}



public void setDelivery_phone(String delivery_phone) {
  this.delivery_phone = delivery_phone;
}



public String getDelivery_postcode() {
  return delivery_postcode;
}



public void setDelivery_postcode(String delivery_postcode) {
  this.delivery_postcode = delivery_postcode;
}



public String getDelivery_address() {
  return delivery_address;
}



public void setDelivery_address(String delivery_address) {
  this.delivery_address = delivery_address;
}



public String getDelivery_addressdetail() {
  return delivery_addressdetail;
}



public void setDelivery_addressdetail(String delivery_addressdetail) {
  this.delivery_addressdetail = delivery_addressdetail;
}



public String getDelivery_memo() {
  return delivery_memo;
}



public void setDelivery_memo(String delivery_memo) {
  this.delivery_memo = delivery_memo;
}



public int getDelivery_charge() {
  return delivery_charge;
}



public void setDelivery_charge(int delivery_charge) {
  this.delivery_charge = delivery_charge;
}


}
