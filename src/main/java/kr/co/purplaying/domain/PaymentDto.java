package kr.co.purplaying.domain;

import java.util.Date;
import java.util.Map;
import java.util.Objects;

public class PaymentDto {
 private Integer pay_no;
 private Date pay_time;
 private int prdt_id;
 private int user_no;
 private int reward_id;
 private int reward_user_cnt;
 private int pay_total;
 private String delivery_reciever;
 private String delivery_phone;
 private String delivery_postcode;
 private String delivery_address;
 private String delivery_addressdetail;
 private String delivery_memo;
 private int delivery_charge;
 private String pay_cardnum;
 private int pay_carddate;
 private int pay_cvc;
 private int pay_pwd;
 private int daySum;
 private int day;


public PaymentDto() {
  // TODO Auto-generated constructor stub
}





public PaymentDto(Integer pay_no, Date pay_time, int prdt_id, int user_no, int reward_id, int reward_user_cnt,
    int pay_total, String delivery_reciever, String delivery_phone, String delivery_postcode, String delivery_address,
    String delivery_addressdetail, String delivery_memo, int delivery_charge, String pay_cardnum, int pay_carddate,
    int pay_cvc, int pay_pwd, int daySum, int day) {
  //super();
  this.pay_no = pay_no;
  this.pay_time = pay_time;
  this.prdt_id = prdt_id;
  this.user_no = user_no;
  this.reward_id = reward_id;
  this.reward_user_cnt = reward_user_cnt;
  this.pay_total = pay_total;
  this.delivery_reciever = delivery_reciever;
  this.delivery_phone = delivery_phone;
  this.delivery_postcode = delivery_postcode;
  this.delivery_address = delivery_address;
  this.delivery_addressdetail = delivery_addressdetail;
  this.delivery_memo = delivery_memo;
  this.delivery_charge = delivery_charge;
  this.pay_cardnum = pay_cardnum;
  this.pay_carddate = pay_carddate;
  this.pay_cvc = pay_cvc;
  this.pay_pwd = pay_pwd;
  this.daySum = daySum;
  this.day = day;
}


@Override
public String toString() {
  return "PaymentDto [pay_no=" + pay_no + ", pay_time=" + pay_time + ", prdt_id=" + prdt_id + ", user_no=" + user_no
      + ", reward_id=" + reward_id + ", reward_user_cnt=" + reward_user_cnt + ", pay_total=" + pay_total
      + ", delivery_reciever=" + delivery_reciever + ", delivery_phone=" + delivery_phone + ", delivery_postcode="
      + delivery_postcode + ", delivery_address=" + delivery_address + ", delivery_addressdetail="
      + delivery_addressdetail + ", delivery_memo=" + delivery_memo + ", delivery_charge=" + delivery_charge
      + ", pay_cardnum=" + pay_cardnum + ", pay_carddate=" + pay_carddate + ", pay_cvc=" + pay_cvc + ", pay_pwd="
      + pay_pwd + ", daySum=" + daySum + ", day=" + day + "]";
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




public int getReward_id() {
  return reward_id;
}




public void setReward_id(int reward_id) {
  this.reward_id = reward_id;
}




public int getReward_user_cnt() {
  return reward_user_cnt;
}




public void setReward_user_cnt(int reward_user_cnt) {
  this.reward_user_cnt = reward_user_cnt;
}




public int getPay_total() {
  return pay_total;
}




public void setPay_total(int pay_total) {
  this.pay_total = pay_total;
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




public int getDaySum() {
  return daySum;
}




public void setDaySum(int daySum) {
  this.daySum = daySum;
}





public int getDay() {
  return day;
}





public void setDay(int day) {
  this.day = day;
}



}
