package kr.co.purplaying.domain;

import java.util.Objects;

public class SettingDto {

  private Integer setting_no;
  private int user_no;
  private boolean msg_agree;
  private boolean update_agree;
  private boolean favor_agree;
  private boolean marketing_agree;
  private String user_introduce;
  
  
  public SettingDto() {
    this(0, false, false, false, false);
  }
  
  public SettingDto(int user_no, boolean msg_agree, boolean update_agree, boolean favor_agree,
      boolean marketing_agree) {
    //super();
    this.user_no = user_no;
    this.msg_agree = msg_agree;
    this.update_agree = update_agree;
    this.favor_agree = favor_agree;
    this.marketing_agree = marketing_agree;
  }

  

  @Override
  public String toString() {
    return "SettingDto [setting_no=" + setting_no + ", user_no=" + user_no + ", msg_agree=" + msg_agree
        + ", update_agree=" + update_agree + ", favor_agree=" + favor_agree + ", marketing_agree=" + marketing_agree
        + ", user_introduce=" + user_introduce + "]";
  }

  public Integer getSetting_no() {
    return setting_no;
  }
  
  public void setSetting_no(Integer setting_no) {
    this.setting_no = setting_no;
  }
  
  public int getUser_no() {
    return user_no;
  }
  
  public void setUser_no(int user_no) {
    this.user_no = user_no;
  }
  
  public boolean isMsg_agree() {
    return msg_agree;
  }
  
  public void setMsg_agree(boolean msg_agree) {
    this.msg_agree = msg_agree;
  }
  
  public boolean isUpdate_agree() {
    return update_agree;
  }
  
  public void setUpdate_agree(boolean update_agree) {
    this.update_agree = update_agree;
  }
  
  public boolean isFavor_agree() {
    return favor_agree;
  }
  
  public void setFavor_agree(boolean favor_agree) {
    this.favor_agree = favor_agree;
  }
  
  public boolean isMarketing_agree() {
    return marketing_agree;
  }
  
  public void setMarketing_agree(boolean marketing_agree) {
    this.marketing_agree = marketing_agree;
  }
  
  @Override
  public int hashCode() {
    return Objects.hash(setting_no, user_no);
  }
  
  public String getUser_introduce() {
    return user_introduce;
  }

  public void setUser_introduce(String user_introduce) {
    this.user_introduce = user_introduce;
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    SettingDto other = (SettingDto) obj;
    return setting_no == other.setting_no && user_no == other.user_no;
  }
  
}
