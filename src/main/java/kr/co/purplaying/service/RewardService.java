package kr.co.purplaying.service;

import java.util.List;

import kr.co.purplaying.domain.RewardDto;

public interface RewardService {

  int insertReward(RewardDto rewardDto) throws Exception;

  List<RewardDto> selectReward(int prdt_id) throws Exception;

  RewardDto selectItem(int reward_id) throws Exception;

  int updateReward(RewardDto rewardDto) throws Exception;

  int deleteReward(int reward_id) throws Exception;

}
