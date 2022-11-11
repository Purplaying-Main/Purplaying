package kr.co.purplaying;

import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.purplaying.dao.ComingsoonFundingDao;
import kr.co.purplaying.domain.ComingsoonFundingDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ComingsoonFundingDaoImplTest {

  @Autowired
  private ComingsoonFundingDao comingsoonFundingDao;
  
  @Test
  public void comingsoonFundingTest() throws Exception{
    assertTrue(comingsoonFundingDao != null);
    System.out.println(comingsoonFundingDao);
    
    System.out.println();
    
    Map map = new HashMap();
    List<ComingsoonFundingDto> list_c = comingsoonFundingDao.comingsoonFunding(map);
    System.out.println(list_c);
  }
  
}
