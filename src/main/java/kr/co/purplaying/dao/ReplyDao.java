package kr.co.purplaying.dao;

import java.util.List;

import kr.co.purplaying.domain.ReplyDto;

public interface ReplyDao {

  List<ReplyDto> selectAll(int prdt_id) throws Exception;

  int insertRply(ReplyDto replyDto) throws Exception ;

}
