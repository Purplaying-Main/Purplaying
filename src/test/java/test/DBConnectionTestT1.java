package test;

import static org.junit.Assert.assertTrue;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import kr.co.purplaying.domain.User;


public class DBConnectionTestT1 {
  
  @Autowired
  private User user;
//데이터베이스 커넥션 테스트
  @Test
  public void springJdbcConnectionTest1() throws SQLException
  {
      ApplicationContext ac = new GenericXmlApplicationContext(
              "file:src/main/webapp/WEB-INF/spring/**/root-context.xml");

      DataSource ds = ac.getBean(DataSource.class);
      // 1) 데이터베이스의 연결을 얻음.
      Connection conn = ds.getConnection();

      // 괄호안의 조건식이 true면 테스트 성공, 아니면 실패
      assertTrue(conn != null); 
      System.out.println(user);
  }
}
