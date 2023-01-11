package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.co.purplaying.domain.RewardDto;

public interface RewardDao {

  int insertReward(RewardDto rewardDto) throws Exception;

  List<RewardDto> selectReward(int prdt_id) throws Exception;

  RewardDto selectItem(int reward_id) throws Exception;

  int updateReward(RewardDto rewardDto) throws Exception;

  int deleteReward(int reward_id) throws Exception;
  
  //디테일페이지-드롭박스 필터
  List<RewardDto> rewardCategory(int prdt_id,int reward_category) throws Exception;

  //결제-리워드 수량 감소
  @Transactional(rollbackFor = Exception.class)
  int calRewardStock(int prdt_id, int reward_id, int reward_stock, int reward_user_cnt) throws Exception;
  
  //결제취소-리워드 수량 증가
  @Transactional(rollbackFor = Exception.class)
  int renewReward(int prdt_id,int reward_id, int reward_stock, int reward_user_cnt) throws Exception;
}
