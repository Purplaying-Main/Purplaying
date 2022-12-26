package kr.co.purplaying.service;

import java.util.List;

import kr.co.purplaying.domain.ReplyDto;

public interface ReplyService {

  List<ReplyDto> getRlist(int prdt_id) throws Exception;

  int replyInsert(ReplyDto rDto) throws Exception;

}
