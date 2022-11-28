package kr.co.purplaying.dao;

import java.io.File;
import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.AttachFileDto;

public interface AttachFileDao {
// 프로젝트
  AttachFileDto selectFile(Integer prdt_id) throws Exception;
  int insertFile(String uploadPath, String uploadFileName, long uploadFileSize, int prdt_id) throws Exception;
  List<AttachFileDto> selectFileList(Map map) throws Exception;
  
//  프로필
  int insertUserProfile(String uploadFolderPath, String uploadFileName, long uploadFileSize, int user_no) throws Exception;

  int insertMainFile(String uploadFolderPath, String uploadFileName, long uploadFileSize) throws Exception;
}
