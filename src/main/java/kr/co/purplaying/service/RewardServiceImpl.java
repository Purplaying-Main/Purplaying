package kr.co.purplaying.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

  @Override
  public RewardDto readPayment(Integer prdt_id) throws Exception {
    RewardDto rewardDto = rewardDao.getPaymentRewardInfo(prdt_id);
    return rewardDto;
  }

  @Override
  public List<RewardDto> setReward(int no_arr, int cnt_arr) throws Exception {

    return rewardDao.selectedRewardPayment(no_arr,cnt_arr);
  }
  
  

}
