package kr.co.purplaying.domain;

public class LeaveDto {
  
  private int leave_no;
  private int user_no;
  private int leave_category;
  private String leave_reason;
  
  
  public LeaveDto() {
    this(0,0,"");
  }
  public LeaveDto(int user_no, int leave_category, String leave_reason) {
    this.user_no = user_no;
    this.leave_category = leave_category;
    this.leave_reason = leave_reason;
  }
  
  //getter////////////////////////////////////////////////////////////////
  public int getUser_no() {
    return user_no;
  }
  public int getLeave_category() {
    return leave_category;
  }
  public String getLeave_reason() {
    return leave_reason;
  }
  
  //setter////////////////////////////////////////////////////////////////
  public void setUser_no(int user_no) {
    this.user_no = user_no;
  }
  public void setLeave_category(int leave_category) {
    this.leave_category = leave_category;
  }  
  public void setLeave_reason(String leave_reason) {
    this.leave_reason = leave_reason;
  }

  @Override
  public String toString() {
    return "LeaveDto [leave_no=" + leave_no + ", user_no=" + user_no + ", leave_category=" + leave_category
        + ", leave_reason=" + leave_reason + "]";
  }
  
  
  
  
  
  
}
