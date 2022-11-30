package kr.co.purplaying.service;

import java.util.List;

import kr.co.purplaying.domain.ReplyDto;

public interface ReplyService {

  List<ReplyDto> selectReply(int prdt_id) throws Exception;

  int insertReply(ReplyDto replyDto) throws Exception;

}
