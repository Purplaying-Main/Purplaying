package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.OneononeDao;
import kr.co.purplaying.domain.OneononeDto;
import kr.co.purplaying.domain.SearchItem;

@Service
public class OneononeServiceImpl implements OneononeService{
	
	@Autowired
	OneononeDao oneononeDao;

	@Override
	public List<OneononeDto> getPage(Map map) throws Exception {
		// TODO Auto-generated method stub
		return oneononeDao.selectPage(map);
	}

	@Override
	public int getCount() throws Exception {
		return oneononeDao.count();
	}

	@Override
	public OneononeDto read(int inquiry_no) throws Exception {
	  OneononeDto oneononeDto = oneononeDao.select(inquiry_no);

		return oneononeDto;
	}

  @Override
  public int remove(Integer inquiry_no, String user_id) throws Exception {
    // TODO Auto-generated method stub
    return oneononeDao.delete(inquiry_no,user_id);
  }

  @Override
  public int write(OneononeDto oneononeDto) throws Exception {
      
      return oneononeDao.insert(oneononeDto);
//    throw new Exception();              // 예외상황 테스트
  }

  @Override
  public int modify(OneononeDto oneononeDto) throws Exception {
      // TODO Auto-generated method stub
      return oneononeDao.update(oneononeDto);
//    throw new Exception();              // 예외상황 테스트
  }

  @Override
  public int getSearchResultCnt(SearchItem sc) throws Exception {
      // TODO Auto-generated method stub
      return oneononeDao.searchResultCnt(sc);
  }

  @Override
  public List<OneononeDto> getSearchResultPage(SearchItem sc) throws Exception {
      // TODO Auto-generated method stub
      return oneononeDao.searchSelectPage(sc);
  }
	
	
}
