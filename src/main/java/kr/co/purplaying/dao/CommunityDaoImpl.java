package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.BoardDto;
import kr.co.purplaying.domain.CommunityDto;

@Repository
public class CommunityDaoImpl implements CommunityDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "kr.co.purplaying.dao.CommunityMapper.";

      @Override
      public CommunityDto select(int user_no) throws Exception {
        // TODO Auto-generated method stub
        return null;
        }

      @Override
      public List<CommunityDto> selectPage(Map map) throws Exception {
        // TODO Auto-generated method stub
        return session.selectList(namespace+"selectPage", map);
      }

      @Override
      public int insert(CommunityDto dto) throws Exception {
        // TODO Auto-generated method stub
        return session.insert(namespace+"insert", dto);
      }

      @Override
      public int update(CommunityDto communityDto) throws Exception {
        // TODO Auto-generated method stub
        return session.update(namespace+"update", communityDto);
      }

}
