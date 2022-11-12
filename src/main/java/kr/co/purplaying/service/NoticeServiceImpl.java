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
	 public NoticeDto read(Integer notice_id) throws Exception {
	   NoticeDto noticeDto = noticeDao.select(notice_id);
	   //조회수 증가
	   noticeDao.increaseViewCnt(notice_id);
	   return noticeDto;
	 }
	    
	
    @Override
    public int remove(Integer notice_id, String writer) throws Exception {
      return noticeDao.delete(notice_id, writer);
    }
  
    @Override
    public int write(NoticeDto noticeDto) throws Exception {
      return noticeDao.insert(noticeDto);
    }
  
    @Override
    public int modify(NoticeDto noticeDto) throws Exception {
      return noticeDao.update(noticeDto);
    }

    @Override
    public int privateFalse(NoticeDto noticeDto) throws Exception {
      return noticeDao.privateFalse(noticeDto);
    }

 
	
}
