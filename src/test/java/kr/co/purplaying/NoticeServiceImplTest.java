package kr.co.purplaying;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.purplaying.dao.NoticeDao;
import kr.co.purplaying.domain.NoticeDto;
import kr.co.purplaying.service.NoticeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class NoticeServiceImplTest {
		
		
    @Autowired
    NoticeService noticeService;
    private SqlSession session;
    private static String namespace = "kr.co.purplaying.dao.NoticeMapper.";

		
		@Test
	    public void testDelete() throws Exception {
	        
	        int result = noticeService.remove(94, "admin@gmail.com");
	        System.out.println("result : " + result);
	        
	    }
		
	
}
