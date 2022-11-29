package kr.co.purplaying.service;

import java.util.List;

import kr.co.purplaying.domain.ReplyDto;

public interface ReplyService {

  List<ReplyDto> getList(int prdt_id) throws Exception;

  int insertRply(ReplyDto replyDto) throws Exception;

}
