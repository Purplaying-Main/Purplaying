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
import kr.co.purplaying.dao.IndexDao;
import kr.co.purplaying.domain.IndexDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class IndexDaoImplTest {
  @Autowired
  private IndexDao indexDao;
  
  @Test
  public void selectTest() throws Exception{
    assertTrue(indexDao != null);
    System.out.println("indexDao = " + indexDao);
  }
  
   @Test
    public void popluarFundingTest() throws Exception{
      Map map = new HashMap();
      List<IndexDto> list_p = indexDao.popluarFunding(map);
    }
  
    
    @Test
    public void newFundingTest() throws Exception{
      Map map = new HashMap();
      List<IndexDto> list_n = indexDao.newFunding(map);
      System.out.println(list_n);
    }
    

  
}
