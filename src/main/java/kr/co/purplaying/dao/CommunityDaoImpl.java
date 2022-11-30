package kr.co.purplaying.dao;

import java.util.List;

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
      public List<CommunityDto> selectAll(int prdt_id) throws Exception {
        // TODO Auto-generated method stub
        return session.selectList(namespace+"selectAll", prdt_id);
      }

      @Override
      public int insertChat(CommunityDto communityDto) throws Exception {
        // TODO Auto-generated method stub
        return session.insert(namespace+"insertChat", communityDto);
      }

      @Override
      public int update(CommunityDto communityDto) throws Exception {
        // TODO Auto-generated method stub
        return session.update(namespace+"update", communityDto);
      }

      @Override
      public int delete(int chat_no) throws Exception {
        // TODO Auto-generated method stub
        return session.delete(namespace+"delete", chat_no);
      }

}
