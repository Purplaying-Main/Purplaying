package kr.co.purplaying.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LeaveDaoImpl implements LeaveDao{
  
  @Autowired(required=true)
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.UserMapper.";

  @Override
  public int insertLeaveReason(int user_no, int leave_category, String leave_reason) throws Exception {
    Map map = new HashMap();
    map.put("user_no", user_no);
    map.put("leave_category", leave_category);
    map.put("leave_reason", leave_reason);
    
    return session.insert(namespace+"insertLeaveReason",map);
  }

}
