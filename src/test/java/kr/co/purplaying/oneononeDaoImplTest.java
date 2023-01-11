package kr.co.purplaying;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.purplaying.dao.OneononeDao;
import kr.co.purplaying.domain.OneononeDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class oneononeDaoImplTest {
	
	@Autowired
	private OneononeDao oneononeDao;

	@Test
	public void insertDummyDataTest() throws Exception {
		//boardDao.deleteAll();
		
		for(int i=1; i<= 101; i++) {
			
		    OneononeDto oneononeDto = new OneononeDto(i, 0, "ezen@gmail.com", "purplaying 더미 데이터 제목"+i, "purplaying 더미 데이터 내용"+i, false, null, null, null);
			oneononeDao.insert(oneononeDto);
			
		}
		
	}


}
