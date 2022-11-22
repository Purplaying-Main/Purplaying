package kr.co.purplaying.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.SearchResultDao;
import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.SearchResultDto;

@Service
public class SearchResultServiceImpl implements SearchResultService {

  
  UserDao userDao;
  
  @Autowired
  SearchResultDao searchResultDao;
  
  public SearchResultServiceImpl(UserDao userDao, SearchResultDao searchResultDao) {
    //super();
    this.userDao = userDao;
    this.searchResultDao = searchResultDao;
  }

  @Override
  public List<SearchResultDto> getGoodsList(SearchResultDto sr) throws Exception {
    // TODO Auto-generated method stub
    return searchResultDao.getGoodsList(sr);
  }

  @Override
  public int goodsGetTotal(SearchResultDto sr) throws Exception {
    // TODO Auto-generated method stub
    return searchResultDao.goodsGetTotal(sr);
  }

  

  




  
  
 
  
}
