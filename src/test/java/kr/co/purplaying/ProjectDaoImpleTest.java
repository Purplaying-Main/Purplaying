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
		static DateFormat prjDate = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String today = date.toString();
		
		@Test
		public void prjInsertDummyDataTest() throws Exception{
		  ProjectDto projectDto = new ProjectDto("ezen@gmail.com", 3, "testtest", "", "", prjDate.parse("2022-11-10"), prjDate.parse("2022-11-20"), 500000, null, true,"", 0, "");
		  projectDao.update(projectDto);
			
		}
}
