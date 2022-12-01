package kr.co.purplaying.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.PaymentDto;
import kr.co.purplaying.domain.RewardDto;

@Repository
public class RewardDaoImpl implements RewardDao {

  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.RewardMapper.";
  
  @Override
  public int insertReward(RewardDto rewardDto) throws Exception {
    return session.insert(namespace+"insertReward",rewardDto);
  }

  @Override
  public List<RewardDto> selectReward(int prdt_id) throws Exception {
    return session.selectList(namespace+"selectReward",prdt_id);
  }

  @Override
  public RewardDto selectItem(int reward_id) throws Exception {
    return session.selectOne(namespace+"selectItem",reward_id);
  }

  @Override
  public int updateReward(RewardDto rewardDto) throws Exception {
    return session.update(namespace+"updateReward",rewardDto);
  }

  @Override
  public int deleteReward(int reward_id) throws Exception {
    return session.delete(namespace+"deleteReward",reward_id);
  }

  @Override
  public RewardDto getPaymentRewardInfo(Integer prdt_id) throws Exception {
    // TODO Auto-generated method stub
    return session.selectOne(namespace+"getPaymentRewardInfo", prdt_id);
  }

  @Override
  public List<RewardDto> selectedRewardPayment(int no_arr, int cnt_arr) throws Exception {
    Map map = new HashMap();
    map.put("reward_id", no_arr);
    map.put("reward_cnt", cnt_arr);
    return session.selectList(namespace+"selectedRewardPayment",map);
  }

  @Override
  public int insertSelectReward(int no_arr, int cnt_arr) throws Exception {
    Map map = new HashMap();
    map.put("reward_id", no_arr);
    map.put("reward_cnt", cnt_arr);
    return session.update(namespace+"insertSelectReward", map);
  }
  
  @Override
  public List<RewardDto> userSelectedReward(int prdt_id, int user_no) throws Exception {
    Map map = new HashMap();
    map.put("prdt_id", prdt_id);
    map.put("user_no", user_no);
    return session.selectList(namespace+"userSelectedReward", map);
  }
}
