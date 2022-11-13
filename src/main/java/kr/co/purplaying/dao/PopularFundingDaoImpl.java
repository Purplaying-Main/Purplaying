package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.purplaying.domain.PopularFundingDto;

@Repository
public class PopularFundingDaoImpl implements PopularFundingDao {

  @Autowired
  private SqlSession session;
  private static String namespace = "kr.co.purplaying.dao.popularFundingMapper.";

  @Override
  public List<PopularFundingDto> popularFunding(Map map) throws Exception {
    // TODO Auto-generated method stub
    return session.selectList(namespace+"popularFunding", map);
  }

}
