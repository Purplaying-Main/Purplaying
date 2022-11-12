package kr.co.purplaying.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.purplaying.dao.NoticeMapper.";
	
	@Override
	public NoticeDto select(Integer notice_id) throws Exception{
		return session.selectOne(namespace+"select",notice_id);
	}

	@Override
	public int insert(NoticeDto dto) throws Exception {
		return session.insert(namespace+"insert", dto);
	}

	@Override
	public int count() throws Exception {
		return session.selectOne(namespace+"count");
	}

	@Override
	public int deleteAll() throws Exception {
		return session.delete(namespace+"deleteAll");
	}

	@Override
	public List<NoticeDto> selectPage(Map map) throws Exception {
		return session.selectList(namespace+"selectPage",map);
	}

	@Override
	public int increaseViewCnt(Integer notice_id) throws Exception {
		return session.update(namespace+"increaseViewCnt", notice_id);
	}

  @Override
  public int delete(Integer notice_id, String writer) throws Exception {
    Map map = new HashMap();
    map.put("notice_id", notice_id);
    map.put("writer", writer);
    return session.delete(namespace+"delete", map);
  }

  @Override
  public int update(NoticeDto noticeDto) throws Exception {
    return session.update(namespace+"update", noticeDto);
  }

  @Override
  public int privateFalse(NoticeDto noticeDto) throws Exception {
    return session.update(namespace+"privateFalse", noticeDto);
  }

}
