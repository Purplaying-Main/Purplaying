package kr.co.purplaying.service;

import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.SearchResultDao;
import kr.co.purplaying.dao.UserDao;

@Service
public class SearchResultServiceImpl implements SearchResultService {

  
  UserDao UserDao;
  SearchResultDao SearchResultDao;
  
  public SearchResultServiceImpl(UserDao userDao, SearchResultDao searchResultDao) {
    //super();
    this.UserDao = userDao;
    this.SearchResultDao = searchResultDao;
  }
  
  
  
 
  
}
