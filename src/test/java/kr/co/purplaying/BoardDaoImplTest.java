package kr.co.purplaying;

import static org.junit.Assert.assertTrue;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.purplaying.dao.BoardDao;
import kr.co.purplaying.domain.BoardDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDaoImplTest {
    
    @Autowired
    private BoardDao boardDao;

    //@Test
    public void selectTest() throws Exception {
        assertTrue(boardDao != null);
        System.out.println("boardDao = " + boardDao);
        
        BoardDto boardDto = boardDao.select(1);
        System.out.println("boardDto = " + boardDto);
        assertTrue(boardDto.getInquiry_no().equals(1));
        
        boardDao.deleteAll();
        
        boardDto = new BoardDto("Pioneering", "Ready for Action", "ezen");
        boardDao.insert(boardDto);
        
        boardDto = boardDao.select(2);
        System.out.println("boardDto = " + boardDto);
        assertTrue(boardDto.getInquiry_no().equals(2));     
        
    }
    
    @Test
    public void selectPageTest() throws Exception {
        boardDao.deleteAll();
        
        for (int i = 1; i<=10; i++) {
            BoardDto boardDto = new BoardDto("Pioneering"+i, "취업 준비"+i, "ezen");
            boardDao.insert(boardDto);
        }
        
        Map map = new HashMap();
        map.put("offset", 0);
        map.put("pageSize", 3);
        
        List<BoardDto> list = boardDao.selectPage(map);
        assertTrue(list.get(0).getInquiry_title().equals("Pioneering10"));
        assertTrue(list.get(1).getInquiry_title().equals("Pioneering9"));
        assertTrue(list.get(2).getInquiry_title().equals("Pioneering8"));
        for(int i=0; i<list.size(); i++) {
            assertTrue(list.get(i).getInquiry_title().equals("Pioneering"+(10-i)));
        }
        
        for(int i=0; i<list.size(); i++) {
            System.out.println(list.get(i).getInquiry_title().toString());
        }
        
    }
    
    
    
}
