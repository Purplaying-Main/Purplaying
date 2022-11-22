package kr.co.purplaying.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.RewardDao;
import kr.co.purplaying.domain.RewardDto;

@Service
public class RewardServiceImpl implements RewardService {
  
  @Autowired
  RewardDao rewardDao;

  @Override
  public int insertReward(RewardDto rewardDto) throws Exception {
    return rewardDao.insertReward(rewardDto);
  }

  @Override
  public List<RewardDto> selectReward(int prdt_id) throws Exception {
    return rewardDao.selectReward(prdt_id);
  }

  @Override
  public RewardDto selectItem(int reward_id) throws Exception {
    // TODO Auto-generated method stub
    return rewardDao.selectItem(reward_id);
  }

  @Override
  public int updateReward(RewardDto rewardDto) throws Exception {
    return rewardDao.updateReward(rewardDto);
  }

  @Override
  public int deleteReward(int reward_id) throws Exception {
    return rewardDao.deleteReward(reward_id);
  }
  
  

}
