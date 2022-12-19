package kr.co.purplaying.service;

import java.util.List;

import kr.co.purplaying.domain.LikeDto;


public interface LikeService {

  int insertLike(LikeDto likeDto) throws Exception;

  int deleteLike(LikeDto likeDto) throws Exception;

  List<Integer> selectLikelist(String user_id) throws Exception;

  List<LikeDto> selectByUserId(String user_id) throws Exception;

  LikeDto selectByRecently(String user_id) throws Exception;
  
}
