package kr.co.purplaying.dao;

import java.io.File;
import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.NoticeDto;
import kr.co.purplaying.domain.PaymentDto;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem;
import kr.co.purplaying.domain.UpdateDto;
import kr.co.purplaying.domain.UserDto;

public interface ProjectDao {
  
  ProjectDto select(Integer prdt_id) throws Exception;
  ProjectDto selectRecently(String writer) throws Exception;
  
  List<ProjectDto> selectPage(Map map) throws Exception;

  int insert(ProjectDto projectDto) throws Exception;
  int update(ProjectDto projectDto) throws Exception;
  int searchResultCnt(SearchItem sc) throws Exception;
  List<ProjectDto> searchSelectPage(SearchItem sc) throws Exception;
  int count() throws Exception;
  List<ProjectDto> selectAll(Integer prdt_id) throws Exception;
  int delete(Integer prdt_id, String writer) throws Exception;
  ProjectDto projectDetail(Integer prdt_id) throws Exception;
  int insertFile(File uploadPath, String uploadFileName, long uploadFileSize, int prdt_id) throws Exception;
  int insertUpdate(UpdateDto updateDto) throws Exception;
  List<UpdateDto> selectUpdate(Integer prdt_id) throws Exception;
  
  List<ProjectDto> selectProject(SearchItem sc) throws Exception;
  int deleteProject(Integer prdt_id) throws Exception;
  ProjectDto selectProjectlikelist(int prdt_id) throws Exception;
  
  //결제-후원자수 증가 update
  int plusBuyerCnt(int prdt_id) throws Exception;
  //결제-후원금액 증가 update
  int plusBuyerPrice(int prdt_id,int pay_total,int prdt_currenttotal) throws Exception;
  //결제완료-펀딩정보 select
  ProjectDto getPaymentProjectInfo(Integer prdt_id) throws Exception;
  
  List<ProjectDto> getListByWriter(String user_id) throws Exception;
  List<ProjectDto> getSoonListByWriter(String user_id) throws Exception;
  List<ProjectDto> selectProjectImgforAdmin(SearchItem sc) throws Exception;
  
  int updateProject(int prdt_id, int refundFee) throws Exception;
  //마이페이지
  List<ProjectDto> getMyFunding(String user_id) throws Exception;
}
