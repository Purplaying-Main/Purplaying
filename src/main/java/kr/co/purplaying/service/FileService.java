package kr.co.purplaying.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.AttachFileDto;

public interface FileService {
  
  AttachFileDto read(Integer prdt_id) throws Exception;
  int insertFile(String uploadPath, String uploadFileName, long uploadFileSize, int prdt_id) throws Exception;
  List<AttachFileDto> getPage(Map map) throws Exception;
  
  int insertUserProfile(String uploadFolderPath, String uploadFileName, long uploadFileSize, int user_no) throws Exception;
  int insertMainFile(String uploadPath, String uploadFileName, long uploadFileSize) throws Exception;
}
