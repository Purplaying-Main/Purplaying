package kr.co.purplaying;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.purplaying.dao.NoticeDao;
import kr.co.purplaying.domain.NoticeDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class NoticeDaoImpleTest {
		
		@Autowired
		private NoticeDao noticeDao;
		
		@Test
		public void insertDummyDataTest() throws Exception{
			noticeDao.deleteAll();
			
//			for(int i=1; i<=100; i++) {
//				NoticeDto noticeDto = new NoticeDto("관리자", "공지사항"+i, "공지사항입니다"+i, 1, true);
//				noticeDao.insert(noticeDto);
//			}
			
			for(int i=1; i<=100; i++) {
              NoticeDto noticeDto = new NoticeDto("admin@gmail.com", "공지사항"+i, "공지사항입니다"+i, 1, true);
              noticeDao.insert(noticeDto);
          }
			
//			for(int i=1; i<=5; i++) {
//				BoardDto boardDto = new BoardDto("Pioneering"+i, "Ready for Action"+i, "ezen5");
//				boardDao.insert(boardDto);
//			}
			
		}
}
