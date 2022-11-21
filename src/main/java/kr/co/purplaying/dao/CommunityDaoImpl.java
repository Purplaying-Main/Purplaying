package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.CommunityDto;

@Repository
public class CommunityDaoImpl implements CommunityDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "kr.co.purplaying.dao.CommunityMapper.";

      @Override
      public List<CommunityDto> selectAll(Integer prdt_id) throws Exception {
        // TODO Auto-generated method stub
        return session.selectList(namespace+"selectAll", prdt_id);
      }

}
