package kr.co.purplaying.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.AttachFileDao;
import kr.co.purplaying.domain.AttachFileDto;
import kr.co.purplaying.domain.BannerFileDto;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem;

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

  @Override
  public int insertUserProfile(String uploadFolderPath, String uploadFileName, long uploadFileSize, int user_no) throws Exception {
    return attachFileDao.insertUserProfile(uploadFolderPath, uploadFileName, uploadFileSize, user_no);
  }

  @Override
  public int getSearchResultCnt(SearchItem sc) throws Exception {
    return attachFileDao.searchResultCnt(sc);
  }

  @Override
  public List<AttachFileDto> selectFileListforAdmin(SearchItem sc) throws Exception {
    return attachFileDao.selectFileListforAdmin(sc);
  }

  @Override
  public ProjectDto findprojectImg(Integer prdt_id) throws Exception {
    return attachFileDao.findprojectImg(prdt_id);
  }

  @Override
  public int insertBannerFile(ProjectDto projectDto) throws Exception {
   
    return attachFileDao.insertBannerFile(projectDto);
  }

  @Override
  public List<BannerFileDto> selectBannerList() throws Exception {
    // TODO Auto-generated method stub
    return attachFileDao.selectBannerList();
  }

  
}
