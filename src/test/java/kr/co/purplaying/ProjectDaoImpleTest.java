package kr.co.purplaying;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.purplaying.dao.ProjectDao;
import kr.co.purplaying.domain.ProjectDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ProjectDaoImpleTest {
		
		@Autowired
		private ProjectDao projectDao;
		
		@Test
		public void prjInsertDummyDataTest() throws Exception{
		  DateFormat openDate = new SimpleDateFormat("yyyy-MM-dd");
//		  ProjectDto projectDto = new ProjectDto
//		  ("창작자", "테스트 프로젝트", "테스트 프로젝트 간단설명", "테스트 프로젝트 자세한설명", openDate.parse("2022-11-01"), openDate.parse("2022-11-20"),0, false, "테스트 프로젝트 정책", 1, "image/thumb");
//		  ("", "", "", "", null, null, 0, false, "", 0, "");
//		  projectDao.insert(projectDto);
//			for(int i=1; i<=100; i++) {
//				NoticeDto noticeDto = new NoticeDto("관리자", "공지사항"+i, "공지사항입니다"+i, 1, true);
//				noticeDao.insert(noticeDto);
//			}
			
//			for(int i=1; i<=100; i++) {
//              NoticeDto projectDao = new NoticeDto("admin@gmail.com", "공지사항"+i, "공지사항입니다"+i, 1, true);
//              noticeDao.insert(noticeDto);
//          }
//			
//			for(int i=1; i<=5; i++) {
//				BoardDto boardDto = new BoardDto("Pioneering"+i, "Ready for Action"+i, "ezen5");
//				boardDao.insert(boardDto);
//			}
			
		}
}
