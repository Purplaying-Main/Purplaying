package kr.co.purplaying.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.LikeDto;

public interface LikeDao {

  int insertLike(LikeDto likeDto) throws Exception;

  int deleteLike(LikeDto likeDto) throws Exception;

  List<Integer> selectLikelist(String user_id) throws Exception;

  List<LikeDto> selectByUserId(String user_id) throws Exception;

}
