package kr.co.purplaying.domain;

import java.util.Arrays;
import java.util.Date;

public class PaymentDto {
 private Integer pay_no;
 private Date pay_time;
 private int prdt_id;
 private int user_no;
 private String[] reward_id;
 private String[] reward_user_cnt;
 private int pay_total;
 private String delivery_reciever;
 private String delivery_phone;
 private String delivery_postcode;
 private String delivery_address;
 private String delivery_addressdetail;
 private String delivery_memo;
 private int daySum;
 private int day;
 private String reward_id_s;
 private String reward_user_cnt_s;
 
 public PaymentDto() {
  // TODO Auto-generated constructor stub
}



public PaymentDto(Integer pay_no, Date pay_time, int prdt_id, int user_no, String[] reward_id, String[] reward_user_cnt,
    int pay_total, String delivery_reciever, String delivery_phone, String delivery_postcode, String delivery_address,
    String delivery_addressdetail, String delivery_memo, int daySum, int day, String reward_id_s,
    String reward_user_cnt_s) {
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
  this.daySum = daySum;
  this.day = day;
  this.setReward_id_s(reward_id_s);
  this.setReward_user_cnt_s(reward_user_cnt_s);
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

public String[] getReward_id() {
  return reward_id;
}

public void setReward_id(String[] reward_id) {
  this.reward_id = reward_id;
}

public String[] getReward_user_cnt() {
  return reward_user_cnt;
}

public void setReward_user_cnt(String[] reward_user_cnt) {
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


public String getReward_id_s() {
  return reward_id_s;
}



public void setReward_id_s(String reward_id_s) {
  this.reward_id_s = reward_id_s;
}



public String getReward_user_cnt_s() {
  return reward_user_cnt_s;
}



public void setReward_user_cnt_s(String reward_user_cnt_s) {
  this.reward_user_cnt_s = reward_user_cnt_s;
}



@Override
public String toString() {
  return "PaymentDto [pay_no=" + pay_no + ", pay_time=" + pay_time + ", prdt_id=" + prdt_id + ", user_no=" + user_no
      + ", reward_id=" + Arrays.toString(reward_id) + ", reward_user_cnt=" + Arrays.toString(reward_user_cnt)
      + ", pay_total=" + pay_total + ", delivery_reciever=" + delivery_reciever + ", delivery_phone=" + delivery_phone
      + ", delivery_postcode=" + delivery_postcode + ", delivery_address=" + delivery_address
      + ", delivery_addressdetail=" + delivery_addressdetail + ", delivery_memo=" + delivery_memo + ", daySum=" + daySum
      + ", day=" + day + ", reward_id_s=" + reward_id_s + ", reward_user_cnt_s=" + reward_user_cnt_s + "]";
}
 



}
