package kr.co.purplaying.dao;

import java.util.List;

import kr.co.purplaying.domain.PaymentDto;
import kr.co.purplaying.domain.RewardDto;

public interface RewardDao {

  int insertReward(RewardDto rewardDto) throws Exception;

  List<RewardDto> selectReward(int prdt_id) throws Exception;

  RewardDto selectItem(int reward_id) throws Exception;

  int updateReward(RewardDto rewardDto) throws Exception;

  int deleteReward(int reward_id) throws Exception;
  
  RewardDto getPaymentRewardInfo(Integer prdt_id) throws Exception;
  
  List<RewardDto> selectedRewardPayment(int no_arr, int cnt_arr) throws Exception;
  
  int insertSelectReward(int no_arr,int cnt_arr) throws Exception;

  List<RewardDto> userSelectedReward(int prdt_id,int user_no,int pay_total) throws Exception;

}
