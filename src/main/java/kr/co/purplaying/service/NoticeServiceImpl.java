package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.NoticeDao;
import kr.co.purplaying.domain.NoticeDto;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	NoticeDao noticeDao;

	@Override
	public List<NoticeDto> getPage(Map map) throws Exception {
		// TODO Auto-generated method stub
		return noticeDao.selectPage(map);
	}

	@Override
	public int getCount() throws Exception {
		return noticeDao.count();
	}

	@Override
	public NoticeDto read(int notice_id) throws Exception {
		NoticeDto noticeDto = noticeDao.select(notice_id);
		//비즈니스 로직 추가
		noticeDao.increaseViewCnt(notice_id);
		return noticeDto;
	}

  @Override
  public int remove(Integer notice_id, String writer) throws Exception {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public int write(NoticeDto noticeDto) throws Exception {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public int modify(NoticeDto noticeDto) throws Exception {
    // TODO Auto-generated method stub
    return 0;
  }
	
	
}
