package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.CommunityDao;
import kr.co.purplaying.domain.CommunityDto;

@Service
public class CommunityServiceImpl implements CommunityService {

  @Autowired
  CommunityDao communityDao;

  @Override
  public List<CommunityDto> getPage(Map map) throws Exception {
    // TODO Auto-generated method stub
    return communityDao.selectPage(map);
  }

  @Override
  public int write(CommunityDto communityDto) throws Exception {
    // TODO Auto-generated method stub
    return communityDao.insert(communityDto);
  }

}
