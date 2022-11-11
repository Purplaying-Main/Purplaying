package kr.co.purplaying;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.purplaying.dao.BoardDao;
import kr.co.purplaying.domain.BoardDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDaoImplTest2 {
	
	@Autowired
	private BoardDao boardDao;

	@Test
	public void insertDummyDataTest() throws Exception {
		//boardDao.deleteAll();
		
		for(int i=1; i<= 122; i++) {
			
			BoardDto boardDto = new BoardDto("aaaaaaaaaaaaaaaa"+i, "Ready"+i, "ezen@gmail.com");
			boardDao.insert(boardDto);
			
		}
		
	}






}
