package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.SearchResultDao;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem;

@Service
public class SearchResultServiceImpl implements SearchResultService {

  

  
  @Autowired
  SearchResultDao searchResultDao;
  

  @Override
  public List<ProjectDto> searchResult(Map map) throws Exception {
    // TODO Auto-generated method stub
    return searchResultDao.searchResult(map);
  }

  @Override
  public List<ProjectDto> getSearchResultPage(SearchItem sc) throws Exception {
    // TODO Auto-generated method stub
    return searchResultDao.searchSelectPage(sc);
  }

  @Override
  public int getsearchcount(SearchItem sc) throws Exception {
    // TODO Auto-generated method stub
    return searchResultDao.searchcount(sc);
  }






  

  




  
  
 
  
}
