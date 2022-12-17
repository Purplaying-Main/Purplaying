package kr.co.purplaying.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.AttachFileDto;
import kr.co.purplaying.domain.BannerFileDto;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem;

public interface FileService {
  
  AttachFileDto read(Integer prdt_id) throws Exception;
  int insertFile(String uploadPath, String uploadFileName, long uploadFileSize, int prdt_id) throws Exception;
  List<AttachFileDto> getPage(Map map) throws Exception;
  
  int insertUserProfile(String uploadFolderPath, String uploadFileName, long uploadFileSize, int user_no) throws Exception;
  int getSearchResultCnt(SearchItem sc) throws Exception;
  List<AttachFileDto> selectFileListforAdmin(SearchItem sc) throws Exception;
  ProjectDto findprojectImg(Integer prdt_id) throws Exception;
  int insertBannerFile(ProjectDto projectDto) throws Exception;
  List<BannerFileDto> selectBannerList()throws Exception;
  int updateBannerFile(ProjectDto projectDto, int position) throws Exception;
  int insertbannerFile(String uploadPath, String srcFileName, long uploadFileSize) throws Exception;
  List<AttachFileDto> selectBanner_list(SearchItem sc) throws Exception;
  int getBannerSearchResultCnt(SearchItem sc) throws Exception;
  AttachFileDto findBannerByID(int file_id) throws Exception;
  int updateBannerFileByUpload(String imgsrc, int position) throws Exception;
  
}
