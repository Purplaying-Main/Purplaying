package kr.co.purplaying.dao;

import java.io.File;
import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.AttachFileDto;

public interface AttachFileDao {
  AttachFileDto selectFile(Integer prdt_id) throws Exception;
  int insertFile(String uploadPath, String uploadFileName, long uploadFileSize, int prdt_id) throws Exception;
  List<AttachFileDto> selectFileList(Map map) throws Exception;
}
