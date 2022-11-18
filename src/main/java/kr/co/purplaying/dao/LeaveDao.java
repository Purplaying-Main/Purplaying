package kr.co.purplaying.dao;


public interface LeaveDao {
  int insertLeaveReason(int user_no, int leave_category, String leave_reason) throws Exception ;
}
