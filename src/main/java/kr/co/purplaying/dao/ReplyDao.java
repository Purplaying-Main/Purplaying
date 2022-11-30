package kr.co.purplaying.dao;

import java.util.List;

import kr.co.purplaying.domain.ReplyDto;

public interface ReplyDao {

  List<ReplyDto> selectReply(int prdt_id) throws Exception;

  int insertReply(ReplyDto replyDto) throws Exception ;

}
