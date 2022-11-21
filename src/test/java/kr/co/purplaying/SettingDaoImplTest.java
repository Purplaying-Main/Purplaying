package kr.co.purplaying;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.purplaying.dao.SettingDao;
import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.SettingDto;
import kr.co.purplaying.domain.UserDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class SettingDaoImplTest {
  
  @Autowired
  SettingDao settingDao;
  UserDao userDao;
  
  @Test
  public void selectTest() throws Exception {
      assertTrue(settingDao != null);
      System.out.println("settingDao = " + settingDao);
      
      String id = (String)"ezen@gmail.com";
      UserDto userDto = userDao.selectUser(id);
      SettingDto settingDto = settingDao.selectSetting(userDto.getUser_no());
      System.out.println("settingDao = " + settingDao);
      System.out.println("settingNo = " + settingDto.getSetting_no());
      assertTrue(settingDto.getSetting_no().equals(1));
  }
}
