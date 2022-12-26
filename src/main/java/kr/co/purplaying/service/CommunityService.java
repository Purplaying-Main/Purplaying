package kr.co.purplaying.service;

import java.util.List;

import kr.co.purplaying.domain.CommunityDto;
import kr.co.purplaying.domain.ReplyDto;

public interface CommunityService {

  List<CommunityDto> getList(int prdt_id) throws Exception;

  int insertChat(CommunityDto communityDto) throws Exception;

  int modify(CommunityDto dto) throws Exception;

  int remove(int chat_no) throws Exception;

  int replyInsert(ReplyDto rDto) throws Exception;
  
  List<ReplyDto> getRlist(int prdt_id) throws Exception;


}
