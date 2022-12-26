package kr.co.purplaying.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
  public int calRewardStock(int prdt_id, int reward_id, int reward_stock, int reward_user_cnt) throws Exception {
    Map map = new HashMap();
    map.put("prdt_id", prdt_id);
    map.put("reward_id", reward_id);
    map.put("reward_stock", reward_stock);
    map.put("reward_user_cnt", reward_user_cnt);
    return session.update(namespace+"calRewardStock", map);
  }

  @Override
  public List<RewardDto> rewardCategory(int prdt_id, int reward_category) throws Exception {
    Map map = new HashMap();
    map.put("prdt_id",prdt_id);
    map.put("reward_category", reward_category);
    return session.selectList(namespace, map);
  }


  
}
