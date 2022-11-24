package kr.co.purplaying.service;

import java.util.List;

import kr.co.purplaying.domain.AnsDto;
import kr.co.purplaying.domain.OneononeDto;

public interface AnsService {
	
	  
//	int remove(Integer ans_no, Integer inquiry_no, String admin_id, Integer inquiry_state) throws Exception;

    
 //   int privateFalse(AnsDto ansDto) throws Exception;
    
    List<AnsDto> getList(Integer inquiry_no) throws Exception;

    int remove(Integer ans_no, Integer inquiry_no, String admin_id) throws Exception;

    int write(AnsDto ansDto)throws Exception;

    int modify(AnsDto ansDto) throws Exception;
   
    AnsDto read(Integer ans_no) throws Exception;

    AnsDto selectAnsData(Integer inquiry_no) throws Exception;

    int insertAns(AnsDto ansDto) throws Exception;

    
}