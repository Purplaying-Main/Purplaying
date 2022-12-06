package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.AnsDto;

public interface AnsDao {

/*
   
  List<AnsDto> selectPage(Map map) throws Exception;
  
  int deleteAll(Integer inquiry_no) throws Exception;

  List<AnsDto> selectAll(Integer inquiry_no) throws Exception;

  int insert(AnsDto ansDto)throws Exception;

  int update(AnsDto ansDto)throws Exception;

  AnsDto select(Integer inquiry_no) throws Exception;


*/
  AnsDto selectAnsData(Integer inquiry_no) throws Exception;

  int insertAns(AnsDto ansDto) throws Exception;

  int deleteAns(Integer ans_no, String admin_id) throws Exception;

  int modifyAns(AnsDto ansDto)throws Exception;
 

}
