package kr.co.purplaying;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.purplaying.dao.AnsDao;
import kr.co.purplaying.domain.AnsDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ansDaoImplTest {
	
	@Autowired
	private AnsDao ansDao;

	//@Test
/*	public void insertDummyDataTest() throws Exception {
		//boardDao.deleteAll();
		
		for(int i=1; i<= 122; i++) {
			
		  AnsDto ansDto = new AnsDto(i, null, i, null, null, false, "ddd"+i, "Ry"+i, "ezen@gmail.com", false, null);
		  ansDao.insert(ansDto);
			
		}
		
	} */






}
