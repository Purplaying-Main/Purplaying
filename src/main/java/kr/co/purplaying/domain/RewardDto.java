package kr.co.purplaying.domain;

import java.util.Objects;

public class RewardDto {
  private int row_number;
  private int reward_id;
  private String reward_name;
  private String reward_desc;
  private int reward_price;
  private int reward_stock;
  private int reward_category;
  private int prdt_id;
  
  public RewardDto() {
  }

  public RewardDto(int row_number, int reward_id, String reward_name, String reward_desc, int reward_price, int reward_stock, int reward_category) {
    this.row_number = row_number;
    this.reward_id = reward_id;
    this.reward_name = reward_name;
    this.reward_desc = reward_desc;
    this.reward_price = reward_price;
    this.reward_stock = reward_stock;
    this.reward_category = reward_category;
  }

  
  public int getRow_number() {
    return row_number;
  }

  public void setRow_number(int row_number) {
    this.row_number = row_number;
  }

  public int getReward_id() {
    return reward_id;
  }

  public void setReward_id(int reward_id) {
    this.reward_id = reward_id;
  }

  public String getReward_name() {
    return reward_name;
  }

  public void setReward_name(String reward_name) {
    this.reward_name = reward_name;
  }

  public String getReward_desc() {
    return reward_desc;
  }

  public void setReward_desc(String reward_desc) {
    this.reward_desc = reward_desc;
  }

  public int getReward_price() {
    return reward_price;
  }

  public void setReward_price(int reward_price) {
    this.reward_price = reward_price;
  }

  public int getReward_stock() {
    return reward_stock;
  }

  public void setReward_stock(int reward_stock) {
    this.reward_stock = reward_stock;
  }

  public int getReward_category() {
    return reward_category;
  }

  public void setReward_category(int reward_category) {
    this.reward_category = reward_category;
  }

  public int getPrdt_id() {
    return prdt_id;
  }

  public void setPrdt_id(int prdt_id) {
    this.prdt_id = prdt_id;
  }
  
  @Override
  public String toString() {
    return "RewardDto [row_number="+row_number+", reward_id=" + reward_id + ", reward_name=" + reward_name + ", reward_desc=" + reward_desc
        + ", reward_price=" + reward_price + ", reward_stock=" + reward_stock + ", reward_category=" + reward_category
        + ", prdt_id=" + prdt_id + "]";
  }
  
  
  
}
