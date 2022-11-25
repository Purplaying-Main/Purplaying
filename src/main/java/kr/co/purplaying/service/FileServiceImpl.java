package kr.co.purplaying.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.AttachFileDao;
import kr.co.purplaying.domain.AttachFileDto;

@Service
public class FileServiceImpl implements FileService {
  
  @Autowired
  AttachFileDao attachFileDao;

  @Override
  public AttachFileDto read(Integer file_id) throws Exception {
    AttachFileDto attachFileDto = attachFileDao.selectFile(file_id);
    return attachFileDto;
  }
  
  @Override
  public int insertFile(String uploadFolderPath, String uploadFileName, long uploadFileSize, int prdt_id) throws Exception {
    return attachFileDao.insertFile(uploadFolderPath, uploadFileName, uploadFileSize, prdt_id);
  }

  @Override
  public List<AttachFileDto> getPage(Map map) throws Exception {
    return attachFileDao.selectFileList(map);
  }

}
